<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Restaurants extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Restaurant");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['restaurants'] = $this->Restaurant->selectAll();
		$data['title'] = "Restaurants";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$this->load->model("Area");
		$data['area'] = $this->Area->selectAll();
		$data['title'] = "Add Restaurant";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		$name = $this->input->post('name');
		$area = $this->input->post('area');

		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('area', 'Area', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
		} else {
			if (!empty($_FILES['logo']['name']) || null != $_FILES['logo']['name']) {
				$image = $this->uploadImage('logo');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->create();
					return;
				}
				$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			} else {
				$this->session->set_flashdata('error', 'Image was required');
				$this->create();
				return;
			}

			$restaurant = array(
				'name' => $name,
				'area_id' => $area,
				'logo' => $logo,
				'status' => 1
			);

			$this->Restaurant->insert($restaurant);

			$this->session->set_flashdata('success', 'You have stored the restaurant successfully');
			redirect("admin/restaurants/create");
		}
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$this->load->model("Area");
		$data['area'] = $this->Area->selectAll();
		$data['restaurant'] = $this->Restaurant->selectById($id);
		$data['title'] = "Edit Restaurant";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/edit.php');
		$this->load->view('layouts/footer.php');
	}

	/**
	 * Update client specified resource.
	 * @param int $id
	 */
	public function update($id)
	{
		$name = $this->input->post('name');
		$area = $this->input->post('area');

		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('area', 'Area', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			if (!empty($_FILES['logo']['name']) || null != $_FILES['logo']['name']) {
				$image = $this->uploadImage('logo');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->edit($id);
					return;
				}
				$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			}

			$restaurant = array(
				'name' => $name,
				'area_id' => $area
			);
			if (isset($logo)) $restaurant['logo'] = $logo;

			$this->Restaurant->update($restaurant, $id);
			$this->session->set_flashdata('success', 'You have change the clients successfully');
			redirect("admin/restaurants/edit/$id");
		}
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Restaurant->changeStatus($id);
		redirect("admin/restaurants");
	}


	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Restaurants")) {
			mkdir(FCPATH . "/plugins/images/Restaurants", 0755, true);
		}
		$path = FCPATH . "/plugins/images/Restaurants";
		$config['upload_path'] = $path;
		$config['file_name'] = 'Logo_' . time() . '_' . rand();
		$config['allowed_types'] = 'jpg|png|jpeg';
		$config['max_size'] = 100000;
		$this->load->library('upload', $config);

		if (!$this->upload->do_upload($image)) {
			$errorStrings = strip_tags($this->upload->display_errors());
			$error = array('error' => $errorStrings, 'image' => $image);
			return $error;
		} else {
			$uploadedImage = $this->upload->data();
			$this->resizeImage($uploadedImage['file_name'], $path);

			$data = array('data' => $uploadedImage);
			return $data;
		}
	}

	private function resizeImage($filename, $path)
	{
		$source_path = $path . "/" . $filename;
		$target_path = $path . "/" . $filename;;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'width' => 400,
			'height' => 400,
		);
		$this->load->library('image_lib', $config_manip);
		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}


}
