<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MoreInfos extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("MoreInfo");
	}

	public function index($id)
	{
//		$data['user'] = $this->session->userdata('user');
//		$data['title'] = "More Info";
//		$data['info'] = $this->MoreInfo->selectAll($id);
//		$data['id'] = $id;
//
//		$this->load->view('layouts/header.php', $data);
//		$this->load->view('restaurants/menu/index.php');
//		$this->load->view('layouts/footer.php');

		//TODO...
	}
}
