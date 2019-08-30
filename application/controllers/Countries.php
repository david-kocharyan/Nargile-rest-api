<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Countries extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Country");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['countries'] = $this->Country->selectAll();
		$data['title'] = "Countries";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('countries/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Add Country";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('countries/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		$country = $this->input->post('country');

		$this->form_validation->set_rules('country', 'Country', 'required|trim|max_length[30]|is_unique[countries.name]');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
		} else {
			$data = array("name" => $country);
			$this->Country->insert($data);
			$this->session->set_flashdata('success', 'You have stored the country successfully');
			redirect("admin/countries/create");
		}
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Edit Country Name";
		$data['country'] = $this->Country->select($id);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('countries/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$country = $this->input->post('country');
		$def_country = $this->Country->select($id)->name;

		if ($def_country == $country) {
			$this->session->set_flashdata('success', 'You have stored the country successfully');
			redirect("admin/countries/edit/$id");
		}

		$this->form_validation->set_rules('country', 'Country', 'required|trim|max_length[30]|is_unique[countries.name]');

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			$data = array("name" => $country);
			$this->Country->update($data, $id);

			$this->session->set_flashdata('success', 'You have stored the country successfully');
			redirect("admin/countries/edit/$id");
		}
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Country->changeStatus($id);
		redirect("admin/countries");
	}
}

