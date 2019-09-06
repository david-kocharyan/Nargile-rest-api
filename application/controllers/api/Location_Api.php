<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

class Location_Api extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();

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

		$this->db->select('*');
		$this->db->where('countries.status', 1);
		$countries = $this->db->get('countries')->result();


		$this->db->select('*');
		$this->db->join("countries", "countries.id = area.country_id");
		$this->db->where('area.status', 1);
		$area = $this->db->get('area')->result();

		var_dump($area);
	}

}
