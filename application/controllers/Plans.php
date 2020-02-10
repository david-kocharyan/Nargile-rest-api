<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Plans extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Plan");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['plans'] = $this->Plan->select();
		$data['all_plans'] = $this->Plan->selectAll();
		$data['title'] = "All Restaurant Plans";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('all_plans/index.php');
		$this->load->view('layouts/footer.php');
	}


}
