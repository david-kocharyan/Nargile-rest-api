<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');


class Service_Api extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->load->model("User");
	}


	public function index_get()
	{
		$res = $this->verify_get_request();
		if (gettype($res) != 'string') {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => $res['msg']
			);
			$this->response($data, $res['status']);
			return;
		}

		$this->db->select('address, mobile_number, email, lat, lng');
		$data = $this->db->get_where('service', array('status' => 1))->row();

		$response = array(
			"success" => true,
			"data" => $data,
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

}
