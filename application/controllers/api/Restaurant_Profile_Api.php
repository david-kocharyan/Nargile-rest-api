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
		$restaurant->reviews = $this->get_reviews_count($this->input->get('id'))->reviews;
		$images = $this->getImages();
		$more_info = array('WiFi','Parking', 'Indoor seating', 'Outdoor seating' );
		$highlighted_reviews = $this->get_reviews($this->input->get('id'));
		$featured_offers = array("Nargile Price Range 10000-16000 LBP", "Nargile Price Range 10000-16000 LBP", "Nargile Price Range 10000-16000 LBP");

		$response = array(
			"success" => true,
			"data" => array(
				"restaurant_info" => array(
					"restaurant" => $restaurant,
					"images" => $images,
					"highlighted_reviews" => $highlighted_reviews,
					"more_info" => $more_info,
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
		lat, lng, address,
		'Nargile Price Range 10000-16000 LBP' as info,
		");
		$this->get_rate();
		$this->join();
		$this->where();
		$data = $this->db->get("restaurants")->row();
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
		$this->db->join("rates", "restaurants.id = rates.restaurant_id");
	}

	private function getImages()
	{
		return $this->db->get_where("restaurants_images", array("restaurant_id" => $this->input->get("id"), "restaurants_images.status" => 1))->result();
	}

	private function get_rate()
	{
		$this->db->select("ROUND(AVG(overall),1) as overall, 
		ROUND(AVG(taste),1) as taste,
		ROUND(AVG(charcoal),1) as charcoal,
		ROUND(AVG(cleanliness),1) as cleanliness,
		ROUND(AVG(staff),1) as staff,
		ROUND(AVG(value_for_money),1) as value_for_money,
		");
	}

	private function get_reviews($id)
	{
		$this->db->select("reviews.review, users.id as user_id, users.image as user_image");
		$this->db->join("users", 'users.id = reviews.user_id');
		$this->db->where("restaurant_id", $id);
		$this->db->limit(5);
		return	$this->db->get("reviews")->result();
	}

	private function get_reviews_count($id)
	{
		$this->db->select("COUNT(restaurant_id) as reviews");
		$this->db->where("restaurant_id", $id);
		return	$this->db->get("reviews")->row();
	}


}
