<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Service extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Service";
		$data['service'] = $this->db->get('service')->row();
		$this->load->view('layouts/header.php', $data);
		$this->load->view('service/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['service'] = $this->db->get_where('service', array("id" => $id))->row();
		$data['title'] = "Edit Service";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('service/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$address = $this->input->post('address');
		$mobile_number = $this->input->post('mobile_number');
		$email = $this->input->post('email');
		$lat = $this->input->post('lat');
		$lng = $this->input->post('lng');

		$this->form_validation->set_rules('address', 'Address', 'required|trim');
		$this->form_validation->set_rules('mobile_number', 'Mobile number', 'required|trim');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
		$this->form_validation->set_rules('lat', 'Latitude', 'required|trim');
		$this->form_validation->set_rules('lng', 'Longitude', 'required|trim');

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			$data = array(
				"address" => $address,
				'mobile_number' => $mobile_number,
				'email' => $email,
				'lat' => $lat,
				'lng' => $lng,
			);

			$this->db->set($data);
			$this->db->where('id', $id);
			$this->db->update('service');
			redirect("admin/service");
		}
	}
}
