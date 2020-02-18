<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user'))) {
			redirect('/admin/login');
		}
		$this->load->model("User");
	}

//	users list
	public function users_list()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Users List";

		$this->db->select('id, username, first_name, last_name, DATE_FORMAT(DATE_ADD(FROM_UNIXTIME(0), interval date_of_birth second),"%Y-%m-%d") as date_of_birth, mobile_number, email, coins, concat("/plugins/images/Logo/", image) as image');
		$data['users'] = $this->db->get_where('users', array('verify' => 1))->result();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('users/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function show($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Users Show ";

		$data['users'] = $this->db->get_where('users', array('id' => $id))->row();

		$data['favorites'] = $this->User->favorite($id);
		$data['rates'] = $this->User->rate($id);
		$data['reviews'] = $this->User->review($id);
		$data['friends'] = $this->User->friend($id);
		$data['badges'] = $this->User->badges($id);
		$data['share'] = $this->User->share($id);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('users/show.php');
		$this->load->view('layouts/footer.php');
	}



}
