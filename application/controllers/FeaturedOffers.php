<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class FeaturedOffers extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user'))) {
			redirect('/admin/login');
		}
		$this->load->model("FeaturedOffer");
	}

	public function index($id)
	{
		$type = $this->check_admin_restaurant($id);

		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Featured Offers";
		$data['offers'] = $this->FeaturedOffer->selectAll($id);
		$data['id'] = $id;

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/featuredOffers/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function store($id)
	{
		$type = $this->check_admin_restaurant($id);
		$info = $_POST["name"];
		foreach ($info as $key) {
			if (trim($key) != '') {
				$this->db->insert("featured_offers", array("text" => $key, 'restaurant_id' => $id));
			}
		}
		redirect("admin/restaurants/featured-offers/$id");
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Featured Offer Edit";
		$data['offers'] = $this->FeaturedOffer->select($id);
		$type = $this->check_admin_restaurant($data['offers']->restaurant_id);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/featuredOffers/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$type = $this->check_admin_restaurant($this->FeaturedOffer->select($id)->restaurant_id);

		$name = $this->input->post('name');
		$this->form_validation->set_rules('name', 'Text', 'required');
		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
			return;
		}
		$this->FeaturedOffer->update($id, array("text" => $name));
		$this->session->set_flashdata('success', 'You have change the offer successfully');
		redirect("admin/restaurants/featured-offers/edit/$id");
	}

	public function change_status($id)
	{
		$data = $this->db->get_where('featured_offers', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$type = $this->check_admin_restaurant($data->restaurant_id);
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('featured_offers', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/featured-offers/$data->restaurant_id");
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
