<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Loyalty_cards extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if ($this->session->userdata('user') == NULL OR !$this->session->userdata('user') OR $this->session->userdata('user')['role'] != "admin") {
			redirect('/admin/login');
		}
		$this->load->model("Loyalty_card");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['loyalty'] = $this->Loyalty_card->select();
		$data['title'] = "Loyalty card";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('loyalty/index.php');
		$this->load->view('layouts/footer.php');
	}


	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['restaurant'] = $this->db->get_where('restaurants', array("admin_id" => $data['user']["user_id"]))->result();
		$data['title'] = "Create new loyalty card";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('loyalty/create.php');
		$this->load->view('layouts/footer.php');
	}


	public function store()
	{
		$desc = $this->input->post('desc');
		$valid_date = $this->input->post('valid_date');
		$percent = $this->input->post('percent');
		$qr = $this->input->post('qr');
		$res_id = $this->input->post('res_id');

		$this->form_validation->set_rules('desc', 'Description', 'required');
		$this->form_validation->set_rules('res_id', 'Restaurant', 'required');
		$this->form_validation->set_rules('valid_date', 'Valid Date', 'required');
		$this->form_validation->set_rules('percent', 'Percent', 'required');
		$this->form_validation->set_rules('qr', 'QR Code', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
			return;
		}

		$qr_image = $this->create_qr($qr);
		$data = array(
			"desc" => $desc,
			"res_id" => $res_id,
			"valid_date" => strtotime($valid_date),
			"percent" => $percent,
			"qr" => $qr_image,
		);

		$this->Loyalty_card->insert($data);

		$this->session->set_flashdata('success', 'You have stored the loyalty card successfully');
		redirect("admin/loyalty");
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['loyalty'] = $this->Loyalty_card->selectById($id);
		$data['title'] = "Edit Loyalty card";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('loyalty/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{

		$desc = $this->input->post('desc');
		$valid_date = $this->input->post('valid_date');
		$percent = $this->input->post('percent');
		$qr = $this->input->post('qr');

		$this->form_validation->set_rules('desc', 'Description', 'required');
		$this->form_validation->set_rules('valid_date', 'Valid Date', 'required');
		$this->form_validation->set_rules('percent', 'Percent', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
			return;
		}

		if ($qr != NULL) {
			$qr_image = $this->create_qr($qr);
		}

		$data = array(
			"desc" => $desc,
			"valid_date" => strtotime($valid_date),
			"percent" => $percent,
		);
		if ($qr_image != null) $data["qr"] = $qr_image;

		$this->Loyalty_card->update($data, $id);

		$this->session->set_flashdata('success', 'You have stored the loyalty card successfully');
		redirect("admin/loyalty");
	}

	public function change_status($id)
	{
		$this->Loyalty_card->changeStatus($id);
		redirect("admin/loyalty");
	}

	private	function create_qr($qr)
	{
		if (!is_dir(FCPATH . "/plugins/images/QR")) {
			mkdir(FCPATH . "/plugins/images/QR", 0755, true);
		}
		$path = FCPATH . "/plugins/images/QR/";
		$this->load->library('QR/ciqrcode');
		$params['data'] = $qr;
		$params['level'] = 'H';
		$params['size'] = 5;
		$params['savename'] = $path . $qr . '_' . time() . '.png';
		$this->ciqrcode->generate($params);
		return $qr . '_' . time() . '.png';
	}

}
