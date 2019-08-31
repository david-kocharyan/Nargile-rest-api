<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Areas extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Area");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['area'] = $this->Area->selectAll();
		$data['title'] = "Area";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('area/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function create()
	{
		$this->load->model("Country");

		$data['user'] = $this->session->userdata('user');
		$data['countries'] = $this->Country->selectAll();
		$data['title'] = "Add Country";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('area/create.php');
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

	public function edit($id)
	{
		$this->load->model("Country");

		$data['user'] = $this->session->userdata('user');
		$data['countries'] = $this->Country->selectAll();
		$data['area'] = $this->Area->select($id);
		$data['title'] = "Edit Country Name";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('area/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$area = $this->input->post('area');
		$country_id = $this->input->post('country');


		$this->form_validation->set_rules('area', 'Area', 'required|trim|max_length[30]');

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			$data = array(
				"name" => $area,
				"country_id" => $country_id,
			);
			$this->Area->update($data, $id);

			$this->session->set_flashdata('success', 'You have stored the country successfully');
			redirect("admin/area/edit/$id");
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
