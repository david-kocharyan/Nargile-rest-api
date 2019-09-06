<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

class Restaurant_Profile_Api extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	/**
	 * Simple register method.
	 * @return Response
	 */
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

		$restaurant = $this->find();
		$images = $this->getImages();
		$more_info = array('WiFi','Parking', 'Indoor seating', 'Outdoor seating' );
		$highlighted_reviews = array("lorem ipsum dolor set amet", "lorem ipsum dolor set amet", "lorem ipsum dolor set amet","lorem ipsum dolor set amet");
		$featured_offers = array("Nargile Price Range 10000-16000 LBP", "Nargile Price Range 10000-16000 LBP", "Nargile Price Range 10000-16000 LBP");

		$response = array(
			"success" => true,
			"data" => array(
				"restaurant_info" => array(
					"restaurant" => $restaurant,
					"images" => $images,
					"mere_info" => $more_info,
					"highlighted_reviews" => $highlighted_reviews,
					"featured_offers" => $featured_offers,
				)
			),
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

	private function find()
	{
		$this->db->select("
		restaurants.id as id, 
		restaurants.name as name, 
		area.name as area_name, 
		concat('/plugins/images/Restaurants/', restaurants.logo) as logo, 
		concat('/plugins/thumb_images/Restaurants/Thumb_', restaurants.logo) as thumb,
		'Nargile Price Range 10000-16000 LBP' as info, 
		'3.6' as rate,
		'466' as reviews,
		 ");
		$this->join();
		$this->where();
		$data = $this->db->get("restaurants")->result();
		return $data != null ? $data : array();
	}

	private function where()
	{
		$this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));
		$this->db->where("restaurants.id",  $this->input->get('id'));
	}

	private function join()
	{
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
	}

	private function getImages()
	{
		return $this->db->get_where("restaurants_images", array("restaurant_id" => $this->input->get("id")))->result();
	}

}
