<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Clients extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Admin");
	}

	/**
	 * Display a listing of the resource.
	 */
	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['clients'] = $this->Admin->selectAll();
		$data['title'] = "Clients";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('clients/index.php');
		$this->load->view('layouts/footer.php');
	}

	/**
	 * Show the form for creating a new resource.
	 */
	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Add New Clients";

		$this->load->model("Restaurant");
		$data["restaurants"] = $this->Restaurant->selectAll();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('clients/create.php');
		$this->load->view('layouts/footer.php');
	}

	/**
	 * Store a newly created resource in storage.
	 */
	public function store()
	{
		$username = $this->input->post('username');
		$full_name = $this->input->post('full_name');
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$restaurant = $this->input->post('restaurant');

		$this->form_validation->set_rules('username', 'Username', 'required|trim|max_length[30]|is_unique[admins.username]');
		$this->form_validation->set_rules('full_name', 'Full name', 'required|trim|regex_match[/^([a-z ])+$/i]');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|is_unique[admins.email]');
		$this->form_validation->set_rules('restaurant', 'Restaurant', 'required|trim|is_unique[admins.restaurant_id]');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]');

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

			$password = hash("sha512", $password);
			$user = array(
				'username' => $username,
				'full_name' => $full_name,
				'email' => $email,
				'role' => 'admin',
				'password' => $password,
				'active' => 1,
				'logo' => $logo,
				'restaurant_id' => $restaurant
			);

			$this->Admin->create($user);

			$this->session->set_flashdata('success', 'You have stored the clients successfully');
			redirect("admin/clients/create");
		}
	}

	/**
	 * Show the form for editing the specified resource.
	 * @param int $id
	 */
	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data["client"] = $this->Admin->getClientById($id);
		$data["title"] = "Edit Client";

		$this->load->model("Restaurant");
		$data["restaurants"] = $this->Restaurant->selectAll();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('clients/edit.php');
		$this->load->view('layouts/footer.php');
	}


	/**
	 * Update client specified resource.
	 * @param int $id
	 */
	public function update($id)
	{
		$user = $this->Admin->getClientById($id);

		$username = $this->input->post('username');
		$full_name = $this->input->post('full_name');
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$restaurant = $this->input->post('restaurant');

		$def_username = $user->username;
		$def_email = $user->email;
		$def_logo = $user->logo;
		$def_restaurant_id = $user->restaurant_id;
		$def_password = $user->password;

		if ($def_username != $username) {
			$this->form_validation->set_rules('username', 'Username', 'required|trim|max_length[30]|is_unique[admins.username]');
		}
		if ($def_restaurant_id != $restaurant) {
			$this->form_validation->set_rules('restaurant', 'Restaurant', 'required|trim|is_unique[admins.username]');
		}
		if ($def_email != $email) {
			$this->form_validation->set_rules('email', 'Email', 'required|trim|is_unique[admins.email]');
		}
		if (empty($password)) {
			$password = $def_password;
		} else {
			$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]');
			$password = hash("sha512", $password);
		}
		$this->form_validation->set_rules('full_name', 'Full name', 'required|trim|regex_match[/^([a-z ])+$/i]');


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
				$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : $def_logo;
			} else {
				$logo = $def_logo;
			}

			$client = array(
				'username' => $username,
				'full_name' => $full_name,
				'email' => $email,
				'password' => $password,
				'logo' => $logo,
				"restaurant_id" => $restaurant
			);

			$this->Admin->update($id, $client);

			$this->session->set_flashdata('success', 'You have change the clients successfully');
			redirect("admin/clients/edit/$id");
		}
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Admin->changeStatus($id);
		redirect("admin/clients");
	}

	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Logo")) {
			mkdir(FCPATH . "/plugins/images/Logo", 0755, true);
		}
		$path = FCPATH . "/plugins/images/Logo";
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
