<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menus extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Menu");
	}

	public function index($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Restaurant Menu";
		$data['menu'] = $this->Menu->selectAll($id);
		$data['id'] = $id;

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/menu/index.php');
		$this->load->view('layouts/footer.php');

	}

	public function change_status($id)
	{
		$data = $this->db->get_where('menus', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('menus', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/menu/$data->restaurant_id");
	}
}
