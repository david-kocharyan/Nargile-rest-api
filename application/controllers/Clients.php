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
		$first_name = $this->input->post('first_name');
		$last_name = $this->input->post('last_name');
		$email = $this->input->post('email');
		$mobile_number = $this->input->post('mobile_number');
		$password = $this->input->post('password');

		$this->form_validation->set_rules('username', 'Username', 'required|trim|max_length[30]|is_unique[admins.username]');
		$this->form_validation->set_rules('first_name', 'First name', 'required|trim|regex_match[/^([a-z ])+$/i]');
		$this->form_validation->set_rules('last_name', 'Last name', 'required|trim|regex_match[/^([a-z ])+$/i]');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|is_unique[admins.email]');
		$this->form_validation->set_rules('mobile_number', 'Mobile Number', 'required|trim|is_unique[admins.mobile_number]');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
		} else {
			$password = hash("sha512", $password);
			$user = array(
				'username' => $username,
				'first_name' => $first_name,
				'last_name' => $last_name,
				'email' => $email,
				'role' => 'admin',
				'password' => $password,
				'active' => 1,
				'logo' => 'User_default.png',
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
		$first_name = $this->input->post('first_name');
		$last_name = $this->input->post('last_name');
		$email = $this->input->post('email');
		$mobile_number = $this->input->post('mobile_number');
		$password = $this->input->post('password');

		$def_username = $user->username;
		$def_email = $user->email;
		$def_password = $user->password;

		$this->form_validation->set_rules('first_name', 'First name', 'required|trim|regex_match[/^([a-z ])+$/i]');
		$this->form_validation->set_rules('last_name', 'Last name', 'required|trim|regex_match[/^([a-z ])+$/i]');
		$this->form_validation->set_rules('mobile_number', 'Mobile Number', 'required|trim');

		if ($def_username != $username) {
			$this->form_validation->set_rules('username', 'Username', 'required|trim|max_length[30]|is_unique[admins.username]');
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

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			$client = array(
				'username' => $username,
				'first_name' => $first_name,
				'last_name' => $last_name,
				'email' => $email,
				'mobile_number' => $mobile_number,
				'password' => $password,
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
}
