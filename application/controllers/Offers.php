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

	/**
	 * Display a listing of the resource.
	 */
	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['offers'] = $this->Offer->selectAll();
		$data['title'] = "Offers";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('offers/index.php');
		$this->load->view('layouts/footer.php');
	}

	/**
	 * Show the form for creating a new resource.
	 */
	public function create()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Add New Offers";
        $data['restaurants'] = $this->Offer->getRestaurants();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('offers/create.php');
		$this->load->view('layouts/footer.php');
	}

	/**
	 * Store a newly created resource in storage.
	 */
	public function store()
	{
		$restaurant_id = $this->input->post('restaurant_id');
		$type = $this->input->post('type');
		$text = $this->input->post('text');

		$this->form_validation->set_rules('restaurant_id', 'Restaurant', 'required|is_numeric');
		$this->form_validation->set_rules('type', 'Offer Type', 'required|is_numeric');
		$this->form_validation->set_rules('text', 'Text', 'required');

		if ($this->form_validation->run() == FALSE){
			$this->create();
		}
		else{
            $offer = array(
                "restaurant_id" => $restaurant_id,
                "type" => $type,
                "text" => $text,
            );
			$this->Offer->insert($offer);

			$this->session->set_flashdata('success', 'You have stored the offer successfully');
			redirect("admin/offers");
		}
	}

	/**
	 * Show the form for editing the specified resource.
	 * @param int $id
	 */
	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data["title"] = "Edit Offer";
		$data["offer"] = $this->Offer->selectById($id);
        $data['restaurants'] = $this->Offer->getRestaurants();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('offers/edit.php');
		$this->load->view('layouts/footer.php');
	}


	/**
	 * Update client specified resource.
	 * @param int $id
	 */
	public function update($id)
	{
        $restaurant_id = $this->input->post('restaurant_id');
        $type = $this->input->post('type');
        $text = $this->input->post('text');

        $this->form_validation->set_rules('restaurant_id', 'Restaurant', 'required|is_numeric');
        $this->form_validation->set_rules('type', 'Offer Type', 'required|is_numeric');
        $this->form_validation->set_rules('text', 'Text', 'required');

		if ($this->form_validation->run() == FALSE){
			$this->edit($id);
		}
		else{

            $offer = array(
                "restaurant_id" => $restaurant_id,
                "type" => $type,
                "text" => $text,
            );
			$this->Offer->update($offer, $id);

			$this->session->set_flashdata('success', 'You have changed the offer successfully');
			redirect("admin/offers");
		}
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Offer->changeStatus($id);
		redirect("admin/offers");
	}

	/**
	 * simple image uploading
	 * @param image
	 * @return image name
	 */
	private function uploadImage($image)
	{
		if(!is_dir(FCPATH . "/plugins/images/Logo")) {
			mkdir(FCPATH . "/plugins/images/Logo", 0755, true);
		}
		$path = FCPATH . "/plugins/images/Logo";
		$config['upload_path'] = $path;
		$config['file_name'] = 'Logo_' . time() . '_' . rand();
		$config['allowed_types'] = 'jpg|png|jpeg';
		$config['max_size'] = 100000;

		$this->load->library('upload', $config);
		if (!$this->upload->do_upload($image)) {
			$errorStrings = strip_tags($this->upload->display_errors());
			$error = array('error' => $errorStrings, 'image' => $image);
			return $error;
		} else {
			$data = array('data' => $this->upload->data());
			return $data;
		}
	}





}
