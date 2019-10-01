<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Badges extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Badge");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['badges'] = $this->Badge->selectAll();
		$data['title'] = "Badges";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('badge/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Add Badge";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('badge/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		$info = $this->input->post('info');
		$count = $this->input->post('count');
		$type = $this->input->post('type');

		$this->form_validation->set_rules('info', 'Info', 'required|trim');
		$this->form_validation->set_rules('count', 'count', 'required|trim|is_natural_no_zero');
		$this->form_validation->set_rules('type', 'Type', 'required|trim');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
		} else {
			if (!empty($_FILES['image']['name']) || null != $_FILES['image']['name']) {
				$image = $this->uploadImage('image');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->create();
					return;
				}
				$badge_image = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			} else {
				$this->session->set_flashdata('error', 'Image was required');
				$this->create();
				return;
			}

			$badge = array(
				'info' => $info,
				'count' => $count,
				'type' => $type,
			);
			if (isset($badge_image)) $badge['image'] = $badge_image;

			$this->Badge->insert($badge);

			$this->session->set_flashdata('success', 'You have stored the badge successfully');
			redirect("admin/badges");
		}
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['badge'] = $this->Badge->select($id);
		$data['title'] = "Edit Badge";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('badge/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$info = $this->input->post('info');
		$count = $this->input->post('count');
		$type = $this->input->post('type');

		$this->form_validation->set_rules('info', 'Info', 'required|trim');
		$this->form_validation->set_rules('count', 'count', 'required|trim|is_natural_no_zero');
		$this->form_validation->set_rules('type', 'Type', 'required|trim');

		$badge = $this->Badge->select($id);

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			if (!empty($_FILES['image']['name']) || null != $_FILES['image']['name']) {
				unlink(FCPATH . "/plugins/images/Badge/" . $badge->image);

				$image = $this->uploadImage('image');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->edit($id);
					return;
				}
				$badge_image = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			}

			$badges = array(
				'info' => $info,
				'count' => $count,
				'type' => $type,
			);
			if (isset($badge_image)) $badge['image'] = $badge_image;

			$this->Badge->update($badges, $id);
			redirect("admin/badges");
		}
	}

	public function change_status($id)
	{
		$this->Badge->changeStatus($id);
		redirect("admin/badges");
	}

	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Badge")) {
			mkdir(FCPATH . "/plugins/images/Badge", 0755, true);
		}

		$path = FCPATH . "/plugins/images/Badge";
		$config['upload_path'] = $path;
		$config['file_name'] = 'Badge_' . time() . '_' . rand();
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
			'width' => 300,
			'height' => 300,
		);
		$this->load->library('image_lib');
		$this->image_lib->initialize($config_manip);

		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}

















//
//	public function edit($id)
//	{
//		$this->load->model("Country");
//
//		$data['user'] = $this->session->userdata('user');
//		$data['countries'] = $this->Country->selectAll();
//		$data['area'] = $this->Area->select($id);
//		$data['title'] = "Edit Country Name";
//
//		$this->load->view('layouts/header.php', $data);
//		$this->load->view('area/edit.php');
//		$this->load->view('layouts/footer.php');
//	}
//
//	public function update($id)
//	{
//		$area = $this->input->post('area');
//		$country_id = $this->input->post('country');
//
//
//		$this->form_validation->set_rules('area', 'Area', 'required|trim|max_length[30]');
//
//		if ($this->form_validation->run() == FALSE) {
//			$this->edit($id);
//		} else {
//			$data = array(
//				"name" => $area,
//				"country_id" => $country_id,
//			);
//			$this->Area->update($data, $id);
//
//			$this->session->set_flashdata('success', 'You have stored the country successfully');
//			redirect("admin/area/edit/$id");
//		}
//	}
//
//	/**
//	 * Change the clients active status.
//	 * @param int $id
//	 */
//	public function change_status($id)
//	{
//		$this->Area->changeStatus($id);
//		redirect("admin/area");
//	}


}
