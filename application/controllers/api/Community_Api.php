<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

class Community_Api extends REST_Controller
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

		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? intval($this->input->get('limit')) : 10;
		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;

		$coin_offers = $this->get_coin_offers();
		$birthdays = $this->get_birthday($res);
		$upcoming = $this->get_upcoming($res);

		if ($this->input->get("action") == "coin-offers") {
			$count_data = $this->get_coin_pages();
		} else if ($this->input->get("action") == "birthdays") {
			$count_data = $this->get_birthdays_pages($res);
		} else if ($this->input->get("action") == "upcoming") {
			$count_data = $this->get_upcoming_pages($res);
		} else {
			$count_coin_offers = $this->get_coin_pages();
			$count_birthdays = $this->get_birthdays_pages($res);
			$count_upcoming = $this->get_upcoming_pages($res);
		}
		if (null == $this->input->get('action')) {
			$response = array(
				'success' => true,
				'data' => array(
					"coin-offers" => array(
						"list" => $coin_offers,
						"meta" => array(
							"limit" => $limit,
							"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
							"pages" => ($limit != 0 || null !== $limit) ? ceil($count_coin_offers->pages / $limit) : 0,
						),
						"action" => "coin-offers"
					),
					"birthdays" => array(
						"list" => $birthdays,
						"meta" => array(
							"limit" => $limit,
							"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
							"pages" => ($limit != 0 || null !== $limit) ? ceil($count_birthdays->pages / $limit) : 0,
						),
						"action" => "birthday"
					),
					"upcoming" => array(
						"list" => $upcoming,
						"meta" => array(
							"limit" => $limit,
							"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
							"pages" => ($limit != 0 || null !== $limit) ? ceil($count_upcoming->pages / $limit) : 0,
						),
						"action" => "upcoming"
					),
				),
				'msg' => '',
			);
			$this->response($response, REST_Controller::HTTP_OK);
		} else {
			switch ($this->input->get('action')) {
				case "coin-offers":
					$data = $this->get_coin_offers();
					break;
				case "birthdays":
					$data = $this->get_birthday($res);
					break;
				case "upcoming":
					$data = $this->get_upcoming($res);
					break;
			}
			$pages = ($limit != 0 || null !== $limit) ? ceil($count_data->pages / $limit) : 0;
			$response = array(
				"success" => true,
				"data" => array(
					$this->input->get('action') => array(
						"list" => $data,
						"meta" => array(
							"limit" => $limit,
							"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
							"pages" => $pages,
						),
						"action" => $this->input->get('action'),
					),
				),
				"msg" => ""
			);
			$this->response($response, REST_Controller::HTTP_OK);
		}

	}

	private function get_coin_offers()
	{
		$this->db->select("concat('/plugins/images/Restaurants/', restaurants.logo) as logo,
         restaurants.id as id, restaurants.name as name, restaurants.address as address, restaurants.rate as rate,
          coin_offers.id as coin_id, concat('Nargile for ' , coin_offers.price, ' coins') as info, coin_offers.price as price");
		$this->limits();
		$this->db->join("restaurants", "restaurants.id = coin_offers.restaurant_id");
		$this->join();
		$this->where();
		$this->db->order_by("coin_offers.id DESC");
		$data = $this->db->get_where("coin_offers", array("coin_offers.status" => 1))->result();
		return $data != null ? $data : array();
	}

	private function get_birthday($res)
	{
		$this->db->select("concat('/plugins/images/Logo/', users.image) as image, username, first_name, last_name");
		$this->db->where("DATE_FORMAT(FROM_UNIXTIME(date_of_birth),'%m-%d') = DATE_FORMAT(NOW(),'%m-%d')");
		$this->db->where("users.id != $res");
		$this->db->order_by("users.id DESC");
		$this->limits();
		$data = $this->db->get('users')->result();
		return $data != null ? $data : array();
	}

	private function get_upcoming($res)
	{
		$this->db->select("concat('/plugins/images/Logo/', users.image) as image, username, first_name, last_name, DAYOFYEAR(FROM_UNIXTIME(1570132800))");
		$this->db->where("DAYOFYEAR(FROM_UNIXTIME(date_of_birth)) BETWEEN DAYOFYEAR(NOW()) + 1 AND DAYOFYEAR(NOW()) + 31");
		$this->db->where("users.id != $res");
		$this->db->order_by("users.id DESC");
		$this->limits();
		$data = $this->db->get('users')->result();
		return $data != null ? $data : array();
	}

///////////////////////////////////////////////////////////////////
	private function get_coin_pages()
	{
		$this->db->select("count(restaurant_id) as pages");
		$this->where();
		$this->db->join("restaurants", "restaurants.id = coin_offers.restaurant_id");
		$this->join();
		$data = $this->db->get_where('coin_offers', array("coin_offers.status" => 1))->row();
		return $data != null ? $data : 0;
	}

	private function get_birthdays_pages($res)
	{
		$this->db->select("COUNT(users.id) as pages");
		$this->db->where("DATE_FORMAT(FROM_UNIXTIME(date_of_birth),'%m-%d') = DATE_FORMAT(NOW(),'%m-%d')");
		$this->db->where("users.id != $res");
		$this->db->order_by("users.id DESC");
		$data = $this->db->get('users')->row();
		return $data != null ? $data : 0;
	}

	private function get_upcoming_pages($res)
	{
		$this->db->select("COUNT(users.id) as pages");
		$this->db->where("DAYOFYEAR(FROM_UNIXTIME(date_of_birth)) BETWEEN DAYOFYEAR(NOW())  AND DAYOFYEAR(NOW()) + 31");
		$this->db->where("users.id != $res");
		$this->db->order_by("users.id DESC");
		$data = $this->db->get('users')->row();
		return $data != null ? $data : 0;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	private function limits()
	{
		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? $this->input->get('limit') : 10;
		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;
		$this->db->limit($limit, $offset);
	}

	private function where()
	{
		$this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));
	}

	private function join()
	{
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
	}


//	get friends
//	public function get_friends_get()
//	{
//		$res = $this->verify_get_request();
//		if (gettype($res) != 'string') {
//			$data = array(
//				"success" => false,
//				"data" => array(),
//				"msg" => $res['msg']
//			);
//			$this->response($data, $res['status']);
//			return;
//		}
//
//		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? intval($this->input->get('limit')) : 10;
//		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;
////		$pages = ($limit != 0 || null !== $limit) ? ceil($this->get_pages(null, $res)->pages / $limit) : 0;
//
////	 get friends db
//
//		 $sql = ("SELECT users.id as id FROM friends JOIN  users on users.id = friends.from_id where to_id = $res and status = 1 UNION
//							(SELECT users.id as id FROM friends JOIN  users on users.id = friends.to_id where from_id = $res and status = 1)");
//		$this->db->order_by("friends.id ASK");
////		$this->db->limit($limit, $offset);
//		$data = $this->db->query($sql)->result();
//		var_dump($data);die;
//
//		$response = array(
//			"success" => true,
//			"data" => array(
//				"list" => isset($data) ? $data : array(),
//				"meta" => array(
//					"limit" => $limit,
//					"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
//					"pages" => ($limit != 0 || null !== $limit) ? $pages : 0,
//				),
//			),
//			"msg" => ""
//		);
//		$this->response($response, REST_Controller::HTTP_OK);
//	}


}
