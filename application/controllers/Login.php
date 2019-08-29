<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->model("Admin");
	}

	public function index()
	{
		$this->load->view('login.php');
	}

	public function login()
	{
		$username = $this->input->post("username");
		$password = $this->input->post("password");

		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');

		if ($this->form_validation->run() == FALSE)  $this->load->view('login.php');
		$check = $this->Admin->authenticate($username, $password);
		if ($check === false){
			$this->load->view('login.php');
		}
		else{
			$user = array(
				'user_id' => $check->id,
				'username' => $check->username,
				'full_name' => $check->full_name,
				'email' => $check->email,
				'role' => $check->role,
				'active' => $check->active,
				'logo' => $check->logo,
			);
			$this->session->set_userdata("user",$user);
			redirect( 'admin/dashboard' );
		}
	}

	public function logout(){
		$this->session->unset_userdata('user');
		redirect('admin/login');
	}

}
