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

		$this->db->select("id, name");
		$country = $this->db->get_where('countries', array('status' => 1))->result();

		$this->db->select("id, name, country_id");
		$area = $this->db->get_where('area', array('status' => 1))->result();

		$data = array();
		foreach ($country as $bin => $key) {
			$data["country"][$bin] = $key;
			foreach ($area as $bin2 => $item) {
				if ($key->id == $item->country_id) {
					$data["country"][$bin]->areas[] = $item;
				}
			}
		}

		$response = array(
			"success" => true,
			"data" => $data,
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

	public function geolocation_post()
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

		$lat = $this->input->post("lat");
		$lng = $this->input->post("lng");
		$address = $this->getaddress($lat, $lng);

		$response = array(
			"success" => true,
			"data" => array(
				"geolocation" => $address
			),
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);

	}

	private function getAddress($latitude, $longitude)
	{
		if (!empty($latitude) && !empty($longitude)) {
			//Send request and receive json data by address
			$geocodeFromLatLong = file_get_contents('https://eu1.locationiq.com/v1/reverse.php?key=34fefe62bdf260&lat=' . $latitude . '&lon=' . $longitude . '&format=json');
			$output = json_decode($geocodeFromLatLong);
			return $output->address;
		}
	}

}
