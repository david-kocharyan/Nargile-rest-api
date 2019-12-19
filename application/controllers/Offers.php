<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Offers extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Offer");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['featured'] = $this->Offer->select_featured();
		$data['hour'] = $this->Offer->select_hour();
		$data['coins'] = $this->Offer->select_coins();
		$data['title'] = "ALL Offers";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('all_offers/index.php');
		$this->load->view('layouts/footer.php');
	}

//change status
	public function change_status_featured($id)
	{
		$this->Offer->changeStatusFeatured($id);
		redirect("admin/offers");
	}

	public function change_status_hour($id)
	{
		$this->Offer->changeStatusHour($id);
		redirect("admin/offers");
	}

	public function change_status_coins($id)
	{
		$this->Offer->changeStatusCoins($id);
		redirect("admin/offers");
	}
}
