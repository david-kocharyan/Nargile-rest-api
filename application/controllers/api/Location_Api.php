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
				"geolocation" => array(
					"city" => isset($address['city']) ? $address['city'] : 'null',
					"country" => isset($address['country']) ? $address['country'] : 'null',
				),
			),
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);

	}

	private function getAddress($latitude, $longitude)
	{
		if (!empty($latitude) && !empty($longitude)) {
			$url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyDsz2KPO5FSf6PDx2YwCTtB1HBt2DkXFrY";

			$data = file_get_contents($url);
			$jsondata = json_decode($data, true);

			if (!$this->check_status($jsondata)) return array();

			if ($this->google_getCity($jsondata) == null){
				$city = $jsondata['results'][0]['address_components'][1]['long_name'];
			}
			else{
				$city = $this->google_getCity($jsondata);
			}

			$address = array(
				'country' => $this->google_getCountry($jsondata),
				'city' => $city,
			);

			return $address;
		}
	}

	private function check_status($jsondata)
	{
		if ($jsondata["status"] == "OK") return true;
		return false;
	}

	private function google_getCountry($jsondata)
	{
		return $this->find_Long_Name_Given_Type("country", $jsondata["results"][0]["address_components"]);
	}

	private function google_getCity($jsondata)
	{
		return $this->find_Long_Name_Given_Type("locality", $jsondata["results"][0]["address_components"]);
	}

	private function find_Long_Name_Given_Type($type, $array, $short_name = false) {
		foreach($array as $value) {
			if (in_array($type, $value["types"])) {
				if ($short_name)
					return $value["short_name"];
				return $value["long_name"];
			}
		}
	}

//	private function getAddress($latitude, $longitude)
//	{
//		if (!empty($latitude) && !empty($longitude)) {
//			//Send request and receive json data by address
//			$geocodeFromLatLong = file_get_contents('https://eu1.locationiq.com/v1/reverse.php?key=34fefe62bdf260&lat=' . $latitude . '&lon=' . $longitude . '&format=json');
//			$output = json_decode($geocodeFromLatLong);
//			return $output->address;
//		}
//	}

}
