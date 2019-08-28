<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct() {
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) ) {
			redirect('/admin/login');
		}
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$this->load->view('layouts/header.php', $data);
		$this->load->view('layouts/footer.php');
	}




}
