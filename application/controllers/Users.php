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

		$this->db->select('users.id, username, first_name, last_name, DATE_FORMAT(DATE_ADD(FROM_UNIXTIME(0), 
		interval date_of_birth second),"%Y-%m-%d") as date_of_birth, mobile_number, 
		email, coins, concat("/plugins/images/Logo/", image) as image, notification_status, logged_via_fb, country, regions.name as reg_name, gender');
		$this->db->join('regions', 'regions.id = users.region_id', 'left');
		$data['users'] = $this->db->get_where('users', array('verify' => 1))->result();

		foreach ($data['users'] as $bin => $key) {
			$data['users'][$bin]->favorites = $this->User->favorite($key->id)->count ?? 0;
			$data['users'][$bin]->rates = $this->User->rate($key->id)->count ?? 0;
			$data['users'][$bin]->reviews = $this->User->review($key->id)->count ?? 0;
			$data['users'][$bin]->friends = $this->User->friend($key->id) ?? 0;
			$data['users'][$bin]->share = $this->User->share($key->id)->count ?? 0;
			$data['users'][$bin]->badges = $this->User->badges($key->id)->count ?? 0;
		}

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
