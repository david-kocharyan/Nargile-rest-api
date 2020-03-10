<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Videos extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user'))) {
			redirect('/admin/login');
		}
		$this->load->model("Video");
	}

//	users list
	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Video";

		$data['video'] = $this->Video->select();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('video/index.php');
		$this->load->view('layouts/footer.php');
	}


	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Video Create";

		$data['restaurant'] = $this->Video->get_restaurant();
		$data['country'] = $this->Video->get_country();
		$data['region'] = $this->Video->get_regions();


		$this->load->view('layouts/header.php', $data);
		$this->load->view('video/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		$region = $this->input->post('region');
		$country = $this->input->post('country');
		$restaurant = $this->input->post('restaurant');
		$link = $this->input->post('link');
		$show = $this->input->post('show');
		$valid_date = $this->input->post('date');

//		$this->form_validation->set_rules('region', 'Region', 'required|trim');
//		$this->form_validation->set_rules('country', 'Country', 'required|trim');
		$this->form_validation->set_rules('restaurant', 'Restaurant', 'required|trim');
		$this->form_validation->set_rules('show', 'Show', 'required|trim');
		$this->form_validation->set_rules('date', 'Valid date', 'required|trim');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
			return;
		} else {
			if (!empty($_FILES['video']['name']) || null != $_FILES['video']['name']) {
				$image = $this->uploadImage('video');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->create();
					return;
				}
				$video = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			} else {
				$this->session->set_flashdata('error', 'Image was required');
				$this->create();
				return;
			}

			if ($link != null) {
				$link = "http://".$link;
			}

			$mime = finfo_file(finfo_open(FILEINFO_MIME_TYPE), FCPATH."plugins/images/Video/$video");
			$type =  explode("/", $mime);

			$data = array(
				'restaurant_id' => $restaurant,
				'region_id' => $region,
				'country' => $country,
				'valid_date' => $valid_date,
				'show_count' => $show,
				'link' => $link,
				'video' => $video,
				'type' => $type[0],
			);

		}

		$this->Video->insert($data);
		redirect('admin/video');
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Video Edit";

		$data['video'] = $this->Video->select_video($id);
		$data['restaurant'] = $this->Video->get_restaurant();
		$data['country'] = $this->Video->get_country();
		$data['region'] = $this->Video->get_regions();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('video/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$region = $this->input->post('region');
		$country = $this->input->post('country');
		$restaurant = $this->input->post('restaurant');
		$link = $this->input->post('link');
		$show = $this->input->post('show');
		$valid_date = $this->input->post('date');

//		$this->form_validation->set_rules('region', 'Region', 'required|trim');
//		$this->form_validation->set_rules('country', 'Country', 'required|trim');
		$this->form_validation->set_rules('restaurant', 'Restaurant', 'required|trim');
		$this->form_validation->set_rules('show', 'Show', 'required|trim');
		$this->form_validation->set_rules('date', 'Valid date', 'required|trim');

		$old_video = $this->Video->select_video($id);

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
			return;
		}

		if (!empty($_FILES['video']['name']) || null != $_FILES['video']['name']) {
			$image = $this->uploadImage('video');
			if (isset($image['error'])) {
				$this->session->set_flashdata('error', $image['error']);
				$this->create();
				return;
			}
			$video = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			unlink(FCPATH . "/plugins/images/Video/" . $old_video->video);
		}

		if ($link != null && strpos($link, 'http://') === false) {
			$link = "http://".$link;
		}

		$data = array(
			'restaurant_id' => $restaurant,
			'region_id' => $region,
			'country' => $country,
			'valid_date' => $valid_date,
			'show_count' => $show,
			'link' => $link,
		);
		if (isset($video)){
			$data['video'] = $video;

			$mime = finfo_file(finfo_open(FILEINFO_MIME_TYPE), FCPATH."plugins/images/Video/$video");
			$type =  explode("/", $mime);
			$data['video'] = $type[0];
		}

		$this->Video->update($data, $id);
		redirect('admin/video');
	}

	public function change_status($id)
	{
		$this->Video->changeStatus($id);
		redirect("admin/video");
	}


	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Video")) {
			mkdir(FCPATH . "/plugins/images/Video", 0755, true);
		}

		$path = FCPATH . "/plugins/images/Video";
		$config['upload_path'] = $path;
		$config['file_name'] = 'Video_' . time() . '_' . rand();
		$config['allowed_types'] = 'jpg|png|jpeg|mp4';
		$config['max_size'] = 100000;
		$this->load->library('upload', $config);

		if (!$this->upload->do_upload($image)) {
			$errorStrings = strip_tags($this->upload->display_errors());
			$error = array('error' => $errorStrings, 'image' => $image);
			return $error;
		} else {
			$uploadedImage = $this->upload->data();
			$data = array('data' => $uploadedImage);
			return $data;
		}
	}


}
