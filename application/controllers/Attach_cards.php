<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Attach_cards extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('user') == NULL OR !$this->session->userdata('user') OR $this->session->userdata('user')['role'] != "admin") {
			redirect('/admin/login');
		}
		$this->load->model("Attach_card");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['attach'] = $this->Attach_card->select();
		$data['title'] = "Loyalty card";

		$data['loyalty'] = $this->Attach_card->my_loyalty($data['user']['user_id']);
		$data['users'] = $this->Attach_card->all_users();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('attach_card/index.php');
		$this->load->view('layouts/footer.php');
	}


	public function store()
	{
		$user = $this->input->post('user');
		$card = $this->input->post('card');

		$this->form_validation->set_rules('user', 'User', 'required');
		$this->form_validation->set_rules('card', 'Loyalty card', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
			return;
		}

		$data = array(
			"user_id" => $user,
			"card_id" => $card,
		);

		$this->Attach_card->insert($data);
		$this->session->set_flashdata('success', 'You have stored the loyalty card successfully');
		redirect("admin/attach-card");
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['attach'] = $this->Attach_card->selectById($id);
		$data['loyalty'] = $this->Attach_card->my_loyalty($data['user']['user_id']);
		$data['users'] = $this->Attach_card->all_users();
		$data['title'] = "Edit Loyalty card";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('attach_card/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{

		$user = $this->input->post('user');
		$card = $this->input->post('card');

		$this->form_validation->set_rules('user', 'User', 'required');
		$this->form_validation->set_rules('card', 'Loyalty card', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
			return;
		}

		$data = array(
			"user_id" => $user,
			"card_id" => $card,
		);

		$this->Attach_card->update($data, $id);

		$this->session->set_flashdata('success', 'You changed the loyalty card successfully');
		redirect("admin/attach-card");
	}

	public function change_status($id)
	{
		$this->Attach_card->changeStatus($id);
		redirect("admin/attach-card");
	}

}
