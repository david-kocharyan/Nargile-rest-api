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
				$this->thumbImage('logo');
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
		$data['restaurant_images'] = $this->db->get_where('restaurants_images', array('restaurant_id' => $id))->result();
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

		$user = $this->Restaurant->selectById($id);

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			if (!empty($_FILES['logo']['name']) || null != $_FILES['logo']['name']) {
				unlink(FCPATH . "/plugins/images/Restaurants/".$user->logo);
				unlink(FCPATH . "/plugins/thumb_images/Restaurants/Thumb_".$user->logo);

				$image = $this->uploadImage('logo');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->edit($id);
					return;
				}
				$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			}
			$this->db->trans_start();

			if(!empty($_FILES['images']['name'][0]) || null != $_FILES['images']['name'][0]){
				$images = $this->upload_files($_FILES['images'], $id);
				if(isset($images['err'])) {
					$this->errors = $images['err'];
					$this->db->trans_rollback();
					$this->edit($this->input->post('id'));
					return;
				}
				else{
					$this->db->insert_batch('restaurants_images', $images);
				}
			}
			$this->db->trans_complete();

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

	public function change_status_image($id)
	{
		$data = $this->db->get_where('restaurants_images', ["id" => $id])->row();
		if(null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('restaurants_images', array("status" => $status), ['id' => $id] );
		redirect("admin/restaurants/edit/$data->restaurant_id");
	}

	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Restaurants")) {
			mkdir(FCPATH . "/plugins/images/Restaurants", 0755, true);
		}

		if (!is_dir(FCPATH . "/plugins/thumb_images/Restaurants")) {
			mkdir(FCPATH . "/plugins/thumb_images/Restaurants", 0755, true);
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
		$target_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 800,
			'height' => 800,
		);
		$this->load->library('image_lib');
		$this->image_lib->initialize($config_manip);

		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();

//		second thumb resize
		$source_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => FCPATH . "/plugins/thumb_images/Restaurants/" . "Thumb_" . $filename,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 300,
			'height' => 300,
		);

		$this->image_lib->initialize($config_manip);
		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}

	private function upload_files($files, $id)
	{
		if(!is_dir(FCPATH . "/plugins/images/Restaurant_images")) {
			mkdir(FCPATH . "/plugins/images/Restaurant_images", 0755, true);
		}
		$config = array(
			'upload_path'   => FCPATH . "/plugins/images/Restaurant_images",
			'allowed_types' => 'jpg|jpeg|png|jfif',
			'max_size' => 100000000000,
			'overwrite' => 1
		);

		$this->load->library('upload', $config);

		$images = array();

		foreach ($files['name'] as $key => $image) {
			$_FILES['images[]']['name']= $files['name'][$key];
			$_FILES['images[]']['type']= $files['type'][$key];
			$_FILES['images[]']['tmp_name']= $files['tmp_name'][$key];
			$_FILES['images[]']['error']= $files['error'][$key];
			$_FILES['images[]']['size']= $files['size'][$key];
			$ext = explode(".", $image)[1];
			$fileName = 'Res_image_' . time() . '_' . uniqid().".".$ext;

			$images[$key]['image'] = $fileName;
			$images[$key]['restaurant_id'] = $id;

			$config['file_name'] = $fileName;

			$this->upload->initialize($config);

			if ($this->upload->do_upload('images[]')) {
				$this->upload->data();
				$this->resizeResImage($fileName, $config['upload_path']);
			} else {
				$data['err'] = $this->upload->display_errors() . $image;
				return $data;
			}
		}
		return $images;
	}

	private function resizeResImage($filename, $path)
	{
		$source_path = $path . "/" . $filename;
		$target_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 1000,
			'height' => 1000,
		);
		$this->load->library('image_lib');
		$this->image_lib->initialize($config_manip);

		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}
}
