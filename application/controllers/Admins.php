<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admins extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin" ) {
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
		$data['title'] = "Home";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('layouts/footer.php');
	}

}
