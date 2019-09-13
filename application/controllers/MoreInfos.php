<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MoreInfos extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("MoreInfo");
	}

	public function index($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "More Info";
		$data['info'] = $this->MoreInfo->selectAll($id);
		$data['id'] = $id;

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/moreInfo/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function store($id)
	{
		$info = $_POST["name"];
		foreach ($info as $key) {
			if (trim($key) != '') {
				$this->db->insert("more_infos", array("name" => $key, 'restaurant_id' => $id));
			}
		}
		redirect("admin/restaurants/info/$id");
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "More Info Edit";
		$data['info'] = $this->MoreInfo->select($id);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/moreInfo/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$name = $this->input->post('name');
		$this->form_validation->set_rules('name', 'Info', 'required');
		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
			return;
		}
		$this->MoreInfo->update($id, array("name" => $name));
		$this->session->set_flashdata('success', 'You have change the clients successfully');
		redirect("admin/restaurants/info/edit/$id");
	}

	public function change_status($id)
	{
		$data = $this->db->get_where('more_infos', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('more_infos', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/info/$data->restaurant_id");
	}


}
