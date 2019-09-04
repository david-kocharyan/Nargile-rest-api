<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sliders extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
		$this->load->model("Slider");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['sliders'] = $this->Slider->selectAll();
		$data['title'] = "Slider";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('sliders/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		if (!empty($_FILES['image']['name'][0]) || null != $_FILES['images']['name'][0]) {
			$images = $this->upload_files($_FILES['images'], $this->input->post('id'));
			if (isset($images['err'])) {
				$this->errors = $images['err'];
				$this->index();
				return;
			} else {
				$this->db->insert_batch('sliders', $images);
			}
		}
		redirect('sliders');
	}

	public function delete($id)
	{
		$image = $this->Slider->SelectById($id);
		$this->Slider->delete($id);
		unlink("plugins/images/Slider/".$image->image);
		redirect("admin/sliders");
	}

	//  uploading multiple images
	private function upload_files($files, $id)
	{
		if (!is_dir(FCPATH . "/plugins/images/Slider")) {
			mkdir(FCPATH . "/plugins/images/Slider", 0755, true);
		}
		$config = array(
			'upload_path' => FCPATH . "/plugins/images/Slider",
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
			$fileName = 'Res_Image_' . time() . '_' . uniqid() . ".$ext";

			$images[$key]['image'] = $fileName;

			$config['file_name'] = $fileName;

			$this->upload->initialize($config);

			if ($this->upload->do_upload('images[]')) {
				$this->resizeImage($fileName, $config['upload_path']);
				$this->upload->data();
			} else {
				$data['err'] = $this->upload->display_errors() . $image;
				return $data;
			}
		}
		return $images;
	}

	//resize image
	private function resizeImage($filename, $path)
	{
		$config['image_library'] = 'GD2';
		$config['source_image'] = $path."/".$filename;
		$config['create_thumb'] = FALSE;
		$config['maintain_ratio'] = true;
		$config['quality'] = '50%';
		$config['width'] = '400';
		$config['height'] = '400';
		$config['new_image'] = $path."/".$filename;
		$this->load->library('image_lib');
		$this->image_lib->clear();
		$this->image_lib->initialize($config);
		$this->image_lib->resize();
	}

}
