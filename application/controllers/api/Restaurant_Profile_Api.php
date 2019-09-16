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
		$my_rate = $this->get_current_user_rate($res);
		$rate = $this->get_restaurant_rate();

		$restaurant->reviews = $this->get_reviews_count($this->input->get('id'))->reviews;
		$restaurant->rate = $rate;
		$restaurant->my_rate = $my_rate;

		$images = $this->getImages();
		$more_info = $this->get_info();

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
	}

	private function getImages()
	{
		return $this->db->get_where("restaurants_images", array("restaurant_id" => $this->input->get("id"), "restaurants_images.status" => 1))->result();
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

	private function get_current_user_rate($res)
	{
		$this->get_rate();
		$this->db->where("user_id", $res);
		$this->db->where("restaurant_id", $this->input->get('id'));
		$data = $this->db->get("rates")->row();
		return $data != null ? $data : NULL;
	}

	private function get_restaurant_rate()
	{
		$this->get_rate();
		$this->db->where("restaurant_id", $this->input->get('id'));
		$data = $this->db->get("rates")->row();
		return $data != null ? $data : NULL;
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

	private function get_info()
	{
		$this->db->select("id, restaurant_id, name");
		$this->db->where("restaurant_id", $this->input->get('id'));
		$this->db->where("status", 1);
		$data = $this->db->get("more_infos")->result();
		return $data != null ? $data : NULL;
	}

// restaurant reviews request

	public function reviews_get()
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

		if ($this->input->get('type') == null) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide reviews type",
			);
			$this->response($data, self::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? intval($this->input->get('limit')) : 10;
		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;
		$pages = ($limit != 0 || null !== $limit) ? ceil($this->reviews_page()->pages / $limit) : 0;

		$this->db->select("reviews.review, users.id as user_id, users.image as user_image");
		$this->db->join("users", 'users.id = reviews.user_id');
		$this->reviews_were();
		$this->db->limit($limit, $offset);
		$this->db->order_by("reviews.id DESC");
		$data = $this->db->get("reviews")->result();

		$response = array(
			"success" => true,
			"data" => array(
				"reviews" => $data,
				"meta" => array(
					"limit" => $limit,
					"offset" => $offset,
					"pages" => $pages,
				),
				"type" => $this->input->get('type'),
			),
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

	private function reviews_were()
	{
		if ($this->input->get('type') == "my") 	$this->db->where(array("restaurant_id" => $this->input->get("restaurant"), "user_id" => $this->input->get("user")));
		if ($this->input->get('type') == "all") $this->db->where(array("restaurant_id" => $this->input->get("restaurant"), "user_id  !=" => $this->input->get("user")));
	}

	private function reviews_page()
	{
		$this->db->select("count(id) as pages");
		$this->reviews_were();
		$data = $this->db->get("reviews")->row();
		return $data != null ? $data : 0;
	}




}
