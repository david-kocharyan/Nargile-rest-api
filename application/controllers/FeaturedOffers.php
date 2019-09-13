<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class FeaturedOffers extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("FeaturedOffer");
	}

	public function index($id)
	{
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

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/featuredOffers/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
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
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('featured_offers', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/featured-offers/$data->restaurant_id");
	}


}
