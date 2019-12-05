<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');
require FCPATH . "application/controllers/Firebase.php";

class Restaurant_Profile_Api extends REST_Controller
{
	const SHARE_REQUEST_EVENT = "share_request";

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

		if ($this->input->get("timezone") == NULL OR !is_numeric($this->input->get('id'))) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => 'Please provide correct id and timezone'
			);
			$this->response($data, self::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$restaurant = $this->find();

		$restaurant->reviews = $this->get_reviews_count($this->input->get('id'))->reviews;
		$restaurant->overall_rate = $this->get_restaurant_rate();
		$restaurant->my_rate = $this->get_current_user_rate($res);
		$restaurant->favorite = $this->get_favorite($res);
		$restaurant->is_admin = $this->get_admin();
		$restaurant->working_hours = $this->get_working_hours($this->input->get("timezone"));


		$images = $this->getImages();
		$more_info = $this->get_info();

		$highlighted_reviews = $this->get_reviews($this->input->get('id'));
		$featured_offers = $this->get_featured_offers();

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
		lat, lng, address, phone_number");
		$this->join();
		$this->where();
		$data = $this->db->get("restaurants")->row();
		return $data != null ? $data : new stdClass();
	}

	private function where()
	{
		$this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));
		$this->db->where("restaurants.id", $this->input->get('id'));
	}

	private function join()
	{
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
	}

	private function getImages()
	{
		$this->db->select("concat('/plugins/images/Restaurant_images/', restaurants_images.image) as image");
		$data = $this->db->get_where("restaurants_images", array("restaurant_id" => $this->input->get("id"), "restaurants_images.status" => 1))->result();
		return $data != null ? $data : array();
	}

	private function get_reviews($id)
	{
		$this->db->select("reviews.review, users.id as user_id, concat('/plugins/images/Logo/', users.image) as user_image");
		$this->db->join("users", 'users.id = reviews.user_id');
		$this->db->where("restaurant_id", $id);
		$this->db->limit(3);
		$data = $this->db->get("reviews")->result();
		return $data != null ? $data : array();

	}

	private function get_reviews_count($id)
	{
		$this->db->select("COUNT(restaurant_id) as reviews");
		$this->db->where("restaurant_id", $id);
		$data = $this->db->get("reviews")->row();
		return $data;
	}

	private function get_current_user_rate($res)
	{
		$this->get_rate();
		$this->db->where("user_id", $res);
		$this->db->where("restaurant_id", $this->input->get('id'));
		return $this->db->get("rates")->row();
	}

	private function get_restaurant_rate()
	{
		$this->get_rate();
		$this->db->where("restaurant_id", $this->input->get('id'));
		return $this->db->get("rates")->row();
	}

	private function get_rate()
	{
		$this->db->select("
		CASE WHEN ROUND(AVG(overall),1) IS NULL THEN 0 ELSE ROUND(AVG(overall),1) END AS overall,
		CASE WHEN ROUND(AVG(taste),1) IS NULL THEN 0 ELSE ROUND(AVG(taste),1) END AS taste,
		CASE WHEN ROUND(AVG(charcoal),1) IS NULL THEN 0 ELSE ROUND(AVG(charcoal),1) END AS charcoal,
		CASE WHEN ROUND(AVG(cleanliness),1) IS NULL THEN 0 ELSE ROUND(AVG(cleanliness),1) END AS cleanliness,
		CASE WHEN ROUND(AVG(staff),1) IS NULL THEN 0 ELSE ROUND(AVG(staff),1) END AS staff,
		CASE WHEN ROUND(AVG(value_for_money),1) IS NULL THEN 0 ELSE ROUND(AVG(value_for_money),1) END AS value_for_money,
		");
	}

	private function get_info()
	{
		$this->db->select("id, restaurant_id, name");
		$this->db->where("restaurant_id", $this->input->get('id'));
		$this->db->where("status", 1);
		$data = $this->db->get("more_infos")->result();
		return $data != null ? $data : array();
	}

	private function get_featured_offers()
	{
		$this->db->select("text");
		$this->db->where("restaurant_id", $this->input->get('id'));
		$this->db->where("status", 1);
		$this->db->limit(3);
		$data = $this->db->get("featured_offers")->result();
		return $data != null ? $data : array();
	}

	private function get_favorite($res)
	{
		$data = $this->db->get_where("favorites", array('user_id' => $res, 'restaurant_id' => $this->input->get('id'), 'status' => 1))->result();
		return $data != null ? '1' : '0';
	}

	private function get_admin()
	{
		$data = $this->db->get_where("restaurants", array('id' => $this->input->get('id'), 'admin_id != ' => NULL))->result();
		return $data != null ? '1' : '0';
	}

	private function get_working_hours($timezone)
	{
		$this->db->select('weeks.day as day, open, close, FLOOR(type) as is_closed');
		$this->db->join('weeks', "weeks.day_id = restaurant_weeks.day");
		$data = $this->db->get_where("restaurant_weeks", array("restaurant_id" => $this->input->get('id'), 'status' => 1))->result();
		$dateTime = new DateTime('now', new DateTimeZone($timezone));
		$day = $dateTime->format('N');
		if ($data != null) {
			for ($i = 2; $i <= $day; $i++) {
				array_push($data, array_shift($data));
			}
			return $data;
		} else {
			return array();
		}
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
		$pages = ($limit != 0 || null !== $limit) ? ceil($this->reviews_page($res)->pages / $limit) : 0;

		$this->db->select("users.id as user_id, concat('/plugins/images/Logo/', users.image) as user_image");
		$this->db->join("users", 'users.id = reviews.user_id');
		$this->reviews_were($res);
		$this->db->limit($limit, $offset);
		$this->db->order_by("reviews.id DESC");
		if ($this->input->get('type') == "all") $this->db->group_by("reviews.user_id");
		$data = $this->db->get("reviews")->result();

		$arr = array();
		foreach ($data as $key => $val) {
			$this->db->select("count(user_id) as count, reviews.review as r");
			$this->db->order_by("reviews.id DESC");
			$p = $this->db->get_where("reviews", array("user_id" => $val->user_id))->row();
			$arr["text"] = $p->r;
			$arr["count"] = $p->count;
			$val->review = $arr;
			unset($arr);
		}

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

	private function reviews_were($res)
	{
		if ($this->input->get('type') == "my") $this->db->where(array("restaurant_id" => $this->input->get("id"), "user_id" => $res));
		if ($this->input->get('type') == "all") $this->db->where(array("restaurant_id" => $this->input->get("id"), "user_id  !=" => $res));
	}

	private function reviews_page($res)
	{
		if ($this->input->get('type') == "all") {

			$this->db->select(" count(page) as pages from ( SELECT count(id) as page");
			$this->reviews_were($res);
			$this->db->group_by("reviews.user_id ) as p");
			$data = $this->db->get("reviews")->row();
			return $data != null ? $data : 0;
		} else {
			$this->db->select("count(id) as pages");
			$this->reviews_were($res);
			$data = $this->db->get("reviews")->row();
			return $data != null ? $data : 0;
		}
	}


//	choose restaurant my favorite
	public function choose_favorite_post()
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

		if (!$this->input->post('restaurant_id') OR $this->input->post('restaurant_id') == NULL) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please provide restaurant id',
			);
			$this->response($response, $status);
			return;
		}

		$favorite = $this->db->get_where('favorites', array('user_id' => $res, 'restaurant_id' => $this->input->post('restaurant_id')))->row();

		if ($favorite == NULL) {
			$this->db->insert('favorites', array('user_id' => $res, 'restaurant_id' => $this->input->post('restaurant_id')));

			$data = array(
				"success" => true,
				"data" => array(
					'is_favorite' => 1
				),
				"msg" => "Favorite chosen and save successfully",
			);
			$this->response($data, REST_Controller::HTTP_OK);
			return;
		} elseif ($favorite->status == 1) {

			$this->db->set('status', 0);
			$this->db->where(array('user_id' => $res, 'restaurant_id' => $this->input->post('restaurant_id')));
			$this->db->update('favorites');

			$data = array(
				"success" => true,
				"data" => array(
					'is_favorite' => 0
				),
				"msg" => "Favorite deleted successfully",
			);
			$this->response($data, REST_Controller::HTTP_OK);
			return;
		} elseif ($favorite->status == 0) {

			$this->db->set('status', 1);
			$this->db->where(array('user_id' => $res, 'restaurant_id' => $this->input->post('restaurant_id')));
			$this->db->update('favorites');

			$data = array(
				"success" => true,
				"data" => array(
					'is_favorite' => 1
				),
				"msg" => "Favorite chosen and save successfully",
			);
			$this->response($data, REST_Controller::HTTP_OK);
			return;
		}
	}

//	claim your business part
	public function claim_your_business_post()
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

		$data = array(
			"restaurant_id" => $this->input->post("id"),
			"first_name" => $this->input->post("first_name"),
			"last_name" => $this->input->post("last_name"),
			"mobile_number" => $this->input->post("mobile_number"),
			"email" => $this->input->post("email"),
			"position" => $this->input->post("position"),
			"owner_first" => $this->input->post("owner_first"),
			"owner_last" => $this->input->post("owner_last"),
			"owner_mobile" => $this->input->post("owner_mobile"),
			"owner_email" => $this->input->post("owner_email"),
			"via_mobile" => $this->input->post("via_mobile"),
			"via_whatsapp" => $this->input->post("via_whatsapp"),
			"via_email" => $this->input->post("via_email"),
			"report" => $this->input->post("report"),
		);

		$this->db->insert('claim_your_business', $data);

		$data = array(
			"success" => true,
			"data" => array(),
			"msg" => "Your request is accepted. Our manager will contact you.",
		);
		$this->response($data, REST_Controller::HTTP_OK);
		return;
	}

//	get menu request
	public function getMenu_get()
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

		$this->db->select('name, price');
		$menu = $this->db->get_where('menus', array('restaurant_id' => $this->input->get('id'), 'status' => 1))->result();

		$this->db->select('concat("/plugins/images/Menu/", image) as image');
		$images = $this->db->get_where('menu_images', array('restaurant_id' => $this->input->get('id'), 'status' => 1))->result();

		$data = array(
			"success" => true,
			"data" => array(
				"restaurant_menu" => array(
					"menu" => $menu != null ? $menu : array(),
					"images" => $images != null ? $images : array(),
				),
			),
			"msg" => "",
		);
		$this->response($data, REST_Controller::HTTP_OK);
		return;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//share profile
	public function share_post()
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

		if ($this->input->post("restaurant_id") == NULL OR $this->input->post("restaurant_id") == "") {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide Restaurant"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		if ($this->input->post("user_id") == NULL OR $this->input->post("user_id") == "") {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide User"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		try {
			$this->send_notif($this->input->post("user_id"), $res, $this->input->post("restaurant_id"));
		} catch (Exception $e) {
			var_dump($e);
			die;
		}

		$response = array(
			"success" => true,
			"data" => array(),
			"msg" => "The Share Has Been Sent Successfully"
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

	private function send_notif($sent_to_id, $sent_from_id, $restaurant_id)
	{
//		get the user whom is sent the request
		$sent_to_user = $this->db->get_where("users", array("id" => $sent_to_id))->row();
		$sent_from_user = $this->db->get_where("users", array("id" => $sent_from_id))->row();
		$restaurant = $this->db->get_where("restaurants", array("id" => $restaurant_id))->row();

		if (null != $sent_to_user) {
			$body = $sent_from_user->first_name . " " . $sent_from_user->last_name . " Will Share A " . $restaurant->name . "  Restaurant With You!";

//			add to database
			$data = array(
				"user_id" => $sent_to_id,
				"body" => $body,
				"click_action" => self::SHARE_REQUEST_EVENT,
				"action_id" => $restaurant_id
			);
			$this->db->insert('notification', $data);

//			get the user's fcm tokens whom is sent the request
			$tokens = $this->get_fcm_tokens($sent_to_id);
			Firebase::send($body, $tokens, self::SHARE_REQUEST_EVENT, $restaurant_id);
		}

	}

	private function get_fcm_tokens($user_id)
	{
		$this->db->select("fcm_token, os");
		$this->db->where("tokens.fcm_token IS NOT NULL");
		$this->db->where("user_id", $user_id);
		$data = $this->db->get("tokens")->result();
		$result = array();
		if (null != $data) {
			foreach ($data as $d) {
				if ($d->os == Firebase::IS_ANDROID && !empty($d->fcm_token)) {
					$result[Firebase::ANDROID][] = $d->fcm_token;
				} elseif ($d->os == Firebase::IS_IOS && !empty($d->fcm_token)) {
					$result[Firebase::IOS][] = $d->fcm_token;
				}
			}
			return $result;
		} elseif (null == $data) {
			return;
		}
	}

}
