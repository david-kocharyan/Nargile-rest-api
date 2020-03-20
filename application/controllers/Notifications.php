<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notifications extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) {
			redirect('/admin/login');
		}
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Notification";


		$this->db->order_by('id DESC');
		$data['notification'] = $this->db->get_where('approve_notification', array('admin_id' => $data['user']['user_id']))->result();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('notification/admin_index.php');
		$this->load->view('layouts/footer.php');
	}



}
