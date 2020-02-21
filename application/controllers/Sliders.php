<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sliders extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Slider");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['sliders'] = $this->Slider->selectAll();
		$data['title'] = "Slider";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('sliders/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['region'] = $this->Slider->get_regions();
		$data['clients'] = $this->db->get_where('admins', array('role' => 'admin'))->result();
		$data['area'] = $this->Slider->selectAllArea();
		$data['title'] = "Image upload page";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('sliders/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		$region = $this->input->post("region");
		$client = $this->input->post("client");
		$area = $this->input->post("area");
		$link = $this->input->post("link");
		$start = $this->input->post("start");
		$end = $this->input->post("end");

		if (!empty($_FILES['image']['name']) || null != $_FILES['image']['name']) {
			$image = $this->uploadImage('image');
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

		$data = array(
			"region_id" => $region != NULL ? $region : NULL,
			"client_id" => $client != NULL ? $client : NULL,
			"area_id" => $area != NULL ? $area : NULL,
			"image" => $logo,
			"link" => $link != NULL ? $link : NULL,
			"start" => $start != NULL ? $start : NULL,
			"end" => $end != NULL ? $end : NULL,
		);

		$this->Slider->insert($data);
		redirect('sliders');
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['region'] = $this->Slider->get_regions();
		$data['slider'] = $this->Slider->selectById($id);
		$data['clients'] = $this->db->get_where('admins', array('role' => 'admin'))->result();
		$data['area'] = $this->Slider->selectAllArea();
		$data['title'] = "Slider Edit page";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('sliders/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$region = $this->input->post("region");
		$client = $this->input->post("client");
		$area = $this->input->post("area");
		$link = $this->input->post("link");
		$start = $this->input->post("start");
		$end = $this->input->post("end");

		$slider = $this->Slider->selectById($id);

		if (!empty($_FILES['image']['name']) || null != $_FILES['image']['name']) {
			$image = $this->uploadImage('image');
			if (isset($image['error'])) {
				$this->session->set_flashdata('error', $image['error']);
				$this->edit($id);
				return;
			}
			$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			unlink(FCPATH . "/plugins/images/Slider/" . $slider->image);
		}

		$data = array(
			"region_id" => $region != NULL ? $region : NULL,
			"client_id" => $client != NULL ? $client : NULL,
			"area_id" => $area != NULL ? $area : NULL,
			"link" => $link != NULL ? $link : NULL,
			"start" => $start != NULL ? $start : NULL,
			"end" => $end != NULL ? $end : NULL,
		);
		if (isset($logo)) $data['image'] = $logo;

		$this->Slider->update($data, $id);
		redirect('sliders');
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Slider->changeStatus($id);
		redirect("admin/sliders");
	}

	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Slider")) {
			mkdir(FCPATH . "/plugins/images/Slider", 0755, true);
		}

		$path = FCPATH . "/plugins/images/Slider";
		$config['upload_path'] = $path;
		$config['file_name'] = 'Slider_' . time() . '_' . rand();
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
	}

	public function calendar()
	{
		$data['user'] = $this->session->userdata('user');
		$data['sliders'] = $this->Slider->selectAll();
		$data['title'] = "Slider";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('sliders/calendar.php');
		$this->load->view('layouts/footer.php');
	}


}
