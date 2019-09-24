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
		$data['menu_images'] = $this->Menu->selectAllImages($id);
		$data['id'] = $id;

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/menu/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function store($id)
	{
		$name = $this->input->post('name');
		$price = $this->input->post('price');

		for ($i = 0; $i < count($name); $i++) {
			if (trim($name[$i]) != '' && trim($price[$i]) != '') {
				$this->db->insert("menus", array("name" => $name[$i], "price" => $price[$i], 'restaurant_id' => $id));
			}
		}
		redirect("admin/restaurants/menu/$id");
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Menu Edit";
		$data['menu'] = $this->Menu->select($id);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/Menu/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$name = $this->input->post('name');
		$price = $this->input->post('price');

		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('price', 'Price', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
			return;
		}
		$this->Menu->update($id, array("name" => $name, 'price' => $price));
		$this->session->set_flashdata('success', 'You have change the clients successfully');
		redirect("admin/restaurants/menu/edit/$id");
	}

	public function image_store($id)
	{
		$this->db->trans_start();

		if (!empty($_FILES['images']['name'][0]) || null != $_FILES['images']['name'][0]) {
			$images = $this->upload_files($_FILES['images'], $id);
			if (isset($images['err'])) {
				$this->errors = $images['err'];
				$this->db->trans_rollback();
				return;
			} else {
				$this->db->insert_batch('menu_images', $images);
			}
		}
		$this->db->trans_complete();

		redirect("admin/restaurants/menu/$id");
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

	public function change_status_image($id)
	{
		$data = $this->db->get_where('menu_images', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('menu_images', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/menu/$data->restaurant_id");
	}

	private function upload_files($files, $id)
	{
		if (!is_dir(FCPATH . "/plugins/images/Menu")) {
			mkdir(FCPATH . "/plugins/images/Menu", 0755, true);
		}
		$config = array(
			'upload_path' => FCPATH . "/plugins/images/Menu",
			'allowed_types' => 'jpg|jpeg|png',
			'max_size' => 100000000000,
			'overwrite' => 1
		);

		$this->load->library('upload', $config);

		$images = array();

		foreach ($files['name'] as $key => $image) {
			$_FILES['images[]']['name'] = $files['name'][$key];
			$_FILES['images[]']['type'] = $files['type'][$key];
			$_FILES['images[]']['tmp_name'] = $files['tmp_name'][$key];
			$_FILES['images[]']['error'] = $files['error'][$key];
			$_FILES['images[]']['size'] = $files['size'][$key];
			$ext = explode(".", $image)[1];
			$fileName = 'Menu_image_' . time() . '_' . uniqid() . "." . $ext;

			$images[$key]['image'] = $fileName;
			$images[$key]['restaurant_id'] = $id;

			$config['file_name'] = $fileName;

			$this->upload->initialize($config);

			if ($this->upload->do_upload('images[]')) {
				$this->upload->data();
				$this->resizeResImage($fileName, $config['upload_path']);
			} else {
				$data['err'] = $this->upload->display_errors() . $image;
				return $data;
			}
		}
		return $images;
	}

	private function resizeResImage($filename, $path)
	{
		$source_path = $path . "/" . $filename;
		$target_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 800,
			'height' => 800,
		);
		$this->load->library('image_lib');
		$this->image_lib->initialize($config_manip);

		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}
}
