<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class HourOffers extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user'))) {
			redirect('/admin/login');
		}
		$this->load->model("HourOffer");
	}

	public function index($id)
	{
		$type = $this->check_admin_restaurant($id);

		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Hour Offers";
		$data['offers'] = $this->HourOffer->selectAll($id);
		$data['id'] = $id;

		$data['country'] = $this->db->get_where('countries', array('status' => 1))->result();
		$data['region'] = $this->db->get_where('regions', array('status' => 1))->result();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/hourOffers/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function store($id)
	{
		$type = $this->check_admin_restaurant($id);

		$info = $this->input->post('name');
		$country = $this->input->post('country');
		$region = $this->input->post('region');

		$this->form_validation->set_rules('name', 'Name', 'required|trim');

		if ($this->form_validation->run() == FALSE) {
			$this->index($id);
			return;
		}

		if ($this->session->userdata('user')['role'] == 'admin') {
			$status = 2;
		}
		if ($this->session->userdata('user')['role'] == 'superAdmin') {
			$status = 1;
		}

		$data = array(
			'text' => $info,
			'restaurant_id' => $id,
			'country' => $country,
			'region' => $region,
			'status' => $status,
		);

		$this->db->insert("hour_offers", $data);

		redirect("admin/restaurants/hour-offers/$id");
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Featured Offer Edit";
		$data['offers'] = $this->HourOffer->select($id);
		$type = $this->check_admin_restaurant($data['offers']->restaurant_id);

		$data['country'] = $this->db->get_where('countries', array('status' => 1))->result();
		$data['region'] = $this->db->get_where('regions', array('status' => 1))->result();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/hourOffers/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$res = $this->HourOffer->select($id)->restaurant_id;
		$type = $this->check_admin_restaurant($res);

		$country = $this->input->post('country');
		$region = $this->input->post('region');
		$name = $this->input->post('name');

		$this->form_validation->set_rules('name', 'Text', 'required');
		$this->form_validation->set_rules('region', 'Region', 'required');
		$this->form_validation->set_rules('country', 'Country', 'required');

		$this->form_validation->set_rules('name', 'Text', 'required');
		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
			return;
		}

		if ($this->session->userdata('user')['role'] == 'admin') {
			$status = 2;
		}
		if ($this->session->userdata('user')['role'] == 'superAdmin') {
			$status = 1;
		}

		$data = array(
			'text' => $name,
			'country' => $country,
			'region' => $region,
			'status' => $status,
		);

		$this->HourOffer->update($id, $data);
		$this->session->set_flashdata('success', 'You have change the offer successfully');
		redirect("admin/restaurants/hour-offers/$res");
	}

	public function change_status($id)
	{
		$data = $this->db->get_where('hour_offers', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$type = $this->check_admin_restaurant($data->restaurant_id);

		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('hour_offers', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/hour-offers/$data->restaurant_id");
	}

	//	check admin type
	private function check_admin_restaurant($res_id)
	{
		$admin_id = $this->session->userdata('user')['user_id'];

		$type = $this->check_admin();
		if ($type == 2) {
			$res_admin_id = $this->db->get_where('restaurants', array('id' => $res_id))->row()->admin_id;
			if ($res_admin_id != $admin_id) {
				redirect('404_override');
			}
		}
	}

	private function check_admin()
	{
		$admin_role = $this->session->userdata('user')['role'];

		if ($admin_role == 'superAdmin') {
			return 1;
		} elseif ($admin_role == 'admin') {
			return 2;
		} else {
			redirect('404_override');
			return;
		}
	}


}
