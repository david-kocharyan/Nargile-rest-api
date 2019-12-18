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
		$data['region'] = $this->Region->selectAll();
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
		$name = $this->input->post('name');
		$coordinates = $this->input->post('coordinates');

		$this->db->trans_start();
		$id = $this->Region->insert_region($name);
		foreach ($coordinates as $key) {
			$key['region_id'] = $id;
			$this->Region->insert_coordinate($key);
		}
		$this->db->trans_complete();

		if ($this->db->trans_status() === FALSE) {
			$this->output->set_output(json_encode("error", JSON_PRETTY_PRINT))->_display();
			exit;
		} else {
			$this->output->set_output(json_encode("success", JSON_PRETTY_PRINT))->_display();
			exit;
		}
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Region->changeStatus($id);
		redirect("admin/regions");
	}


}
