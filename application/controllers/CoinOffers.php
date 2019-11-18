<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CoinOffers extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user'))) {
			redirect('/admin/login');
		}
		$this->load->model("CoinOffer");
	}

	public function index($id)
	{
		$type = $this->check_admin_restaurant($id);

		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Coin Offers";
		$data['coins'] = $this->CoinOffer->selectAll($id);
		$data['id'] = $id;

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/coinOffers/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function store($id)
	{
		$type = $this->check_admin_restaurant($id);

		$price = $this->input->post('price');
		$valid = $this->input->post('valid');
		$desc = $this->input->post('desc');

		for ($i = 0; $i < count($price); $i++) {
			if (trim($price[$i]) != '' && trim($valid[$i]) != '' && trim($desc[$i]) != '') {
				$this->db->insert("coin_offers", array("price" => $price[$i], "valid_date" => strtotime($valid[$i]), "description" => $desc[$i], 'restaurant_id' => $id));
			}
		}
		redirect("admin/restaurants/coin-offers/$id");
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Coin Offer Edit";
		$data['coins'] = $this->CoinOffer->select($id);
		$type = $this->check_admin_restaurant($data['coins']->restaurant_id);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/coinOffers/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$res = $this->CoinOffer->select($id)->restaurant_id;
		$type = $this->check_admin_restaurant($res);

		$price = $this->input->post('price');
		$date = $this->input->post('date');
		$desc = $this->input->post('desc');

		$this->form_validation->set_rules('price', 'Price', 'required');
		$this->form_validation->set_rules('date', 'Date', 'required');
		$this->form_validation->set_rules('desc', 'Description', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
			return;
		}
		$this->CoinOffer->update($id, array("price" => $price, "valid_date" => strtotime($date), "description" => $desc));
		$this->session->set_flashdata('success', 'You have change the offer successfully');
		redirect("admin/restaurants/coin-offers/$res");
	}

	public function change_status($id)
	{
		$data = $this->db->get_where('coin_offers', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$type = $this->check_admin_restaurant($data->restaurant_id);
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('coin_offers', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/coin-offers/$data->restaurant_id");
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
