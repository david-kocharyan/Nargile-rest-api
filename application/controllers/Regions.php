<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Regions extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Region");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
//		$data['area'] = $this->Region->selectAll();
		$data['title'] = "Regions";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('regions/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Add Regions";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('regions/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		$area = $this->input->post('area');
		$country_id = $this->input->post('country');

		$this->form_validation->set_rules('area', 'Area', 'required|trim|max_length[30]');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
		} else {
			$data = array(
				"name" => $area,
				"country_id" => $country_id,
				"status" => 1,
			);
			$this->Area->insert($data);
			$this->session->set_flashdata('success', 'You have stored the area successfully');
			redirect("admin/area/create");
		}
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Area->changeStatus($id);
		redirect("admin/area");
	}


}
