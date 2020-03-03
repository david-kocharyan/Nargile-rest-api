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

		$this->db->select('id, username, first_name, last_name, DATE_FORMAT(DATE_ADD(FROM_UNIXTIME(0), interval date_of_birth second),"%Y-%m-%d") as date_of_birth, mobile_number, email, coins, concat("/plugins/images/Logo/", image) as image, notification_status, logged_via_fb');
		$data['users'] = $this->db->get_where('users', array('verify' => 1))->result();

		foreach ($data['users'] as $bin => $key) {
			$data['users'][$bin]->favorites = $this->User->favorite($key->id)->count ?? 0;
			$data['users'][$bin]->rates = $this->User->rate($key->id)->count ?? 0;
			$data['users'][$bin]->reviews = $this->User->review($key->id)->count ?? 0;
			$data['users'][$bin]->friends = $this->User->friend($key->id) ?? 0;
			$data['users'][$bin]->share = $this->User->share($key->id)->count ?? 0;
//			$data['users'][$bin]->badges = $this->User->badges($key->id)->count ?? 0;
		}

		$this->load->view('layouts/header.php', $data);
		$this->load->view('users/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function getLists()
	{
		$data = $row = array();

		// Fetch member's records
		$memData = $this->User->getRows($_POST);

		$i = $_POST['start'];
		foreach ($memData as $member) {
			$i++;
			$status = ($member->verify == 1) ? 'Active' : 'Inactive';
			$logged_via_fb = ($member->logged_via_fb == 0) ? "No" : "Yes";
			$notification_status = ($member->notification_status == 0) ? "Off" : "On";
			$image = "<img src=".base_url('plugins/images/Logo/').$member->image." style='border-radius: 50%; height: 80px; width: 80px; '>";
			$option = "<a href=".base_url('admin/users/show/'). $member->id." data-toggle='tooltip'
								   data-placement='top' title='All info about current restaurant'
								   class='btn btn-outline btn-primary btn-circle tooltip-primary'> <i
										class='fas fa-eye'></i> </a>";

			$data[] = array("",$member->id,
				$image,
				$member->username,
				$member->first_name,
				$member->last_name,
				$member->date_of_birth,
				$member->mobile_number,
				$member->email,
				$status,
				$logged_via_fb,
				$notification_status,
				$option,
			);
		}

		$output = array(
			"draw" => $_POST['draw'],
			"recordsTotal" => $this->User->countAll(),
			"recordsFiltered" => $this->User->countFiltered($_POST),
			"data" => $data,
		);


		// Output to JSON format
		echo json_encode($output);
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
