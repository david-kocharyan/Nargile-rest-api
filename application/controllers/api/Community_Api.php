<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');
require FCPATH . "application/controllers/Firebase.php";

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

		if ($this->input->get("action") == "coin_offers") {
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
					"coin_offers" => array(
						"list" => $coin_offers,
						"meta" => array(
							"limit" => $limit,
							"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
							"pages" => ($limit != 0 || null !== $limit) ? ceil($count_coin_offers->pages / $limit) : 0,
						),
						"action" => "coin_offers"
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
				case "coin_offers":
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
		$this->db->select("id, concat('/plugins/images/Logo/', users.image) as image, username, first_name, last_name");
		$this->db->where("DATE_FORMAT(FROM_UNIXTIME(date_of_birth),'%m-%d') = DATE_FORMAT(NOW(),'%m-%d')");
		$this->db->where("users.id != $res");
		$this->db->order_by("users.id DESC");
		$this->limits();
		$data = $this->db->get('users')->result();
		return $data != null ? $data : array();
	}

	private function get_upcoming($res)
	{
		$this->db->select("id, concat('/plugins/images/Logo/', users.image) as image, username, first_name, last_name, 
		DATE_FORMAT(FROM_UNIXTIME(date_of_birth), '%M %D %Y') as date_of_birth");
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


	public function get_friends_get()
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

//		check name
		if ($this->input->get("name") != NULL OR $this->input->get("name") != "") {
			$name_sql = "and (users.username LIKE '%" . $this->input->get("name") . "%' OR users.first_name LIKE '%" . $this->input->get("name") . "%' OR users.last_name LIKE '%" . $this->input->get("name") . "%')";
		} else {
			$name_sql = "";
		}

		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? intval($this->input->get('limit')) : 10;
		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;

//		get all friends
		$sql = ("SELECT users.id as user_id, users.username, users.first_name, users.last_name, concat('plugins/images/Logo/', users.image) as image, friends.id as friends_id
 				FROM friends JOIN  users on users.id = friends.from_id where to_id = $res and status = 1  $name_sql UNION
				(SELECT users.id as user_id, users.username, users.first_name, users.last_name, concat('plugins/images/Logo/', users.image) as image, friends.id as friends_id
				FROM friends JOIN  users on users.id = friends.to_id where from_id = $res and status = 1 $name_sql ) 
				ORDER BY friends_id LIMIT $limit OFFSET $offset");
		$data = $this->db->query($sql)->result();

//		get pages for friends
		$page_sql = ("SELECT COUNT(friends_id) as pages	FROM (SELECT friends.id as friends_id FROM friends JOIN users on users.id = friends.from_id where to_id = $res and status = 1 $name_sql
						UNION (SELECT friends.id as friends_id FROM friends JOIN users on users.id = friends.to_id where from_id = $res and status = 1 $name_sql) ) as p");
		$get_pages = $this->db->query($page_sql)->row();
		$pages = ($limit != 0 || null !== $limit) ? ceil($get_pages->pages / $limit) : 0;

		$response = array(
			"success" => true,
			"data" => array(
				"list" => isset($data) ? $data : array(),
				"meta" => array(
					"limit" => $limit,
					"offset" => $offset,
					"pages" => ($limit != 0 || null !== $limit) ? $pages : 0,
				),
			),
			"msg" => ""
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//add friend

	public function add_friend_post()
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

		if ($this->input->post("id") == NULL OR $this->input->post("id") == "") {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide User"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$friend_id = $this->input->post("id");
		$this->db->where(array("from_id" => $res, "to_id" => $friend_id));
		$this->db->or_where(array("from_id" => $friend_id));
		$this->db->where(array("to_id" => $res));
		$is_friends = $this->db->get('friends')->row();
		if ($is_friends != NULL) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "This user already your friends"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$data = array(
			"from_id" => $res,
			"to_id" => $friend_id,
			"status" => 1,
		);

		$this->db->insert('friends', $data);
		$id = $this->db->insert_id();

		$this->send_notif($id);

		$response = array(
			"success" => false,
			"data" => array(),
			"msg" => "This user already your friends"
		);
		$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
	}

	private function send_notif($id)
	{
		$this->db->select("user_1.id as id_1, user_2.id as id_2, 
		user_1.username as username_1, user_2.username as username_2");
		$this->db->join('users as user_1', 'user_1.id = friends.from_id');
		$this->db->join('users as user_2', 'user_2.id = friends.to_id');
		$data = $this->db->get_where('friends', array("friends.id" => $id))->row();

//		if($user_id->user_id != null) {
//			$this->db->select("fcm_token, os");
//			$this->db->join("users_api", "users_api.id = tokens.user_id AND users_api.notifications = 1");
//			$this->db->where("tokens.fcm_token IS NOT NULL");
//			$this->db->where("tokens.user_id", $user_id->user_id);
//			$data = $this->db->get("tokens")->result();
//			$result = array();
//			if(null != $data) {
//				foreach ($data as $d) {
//					if($d->os == Firebase::IS_ANDROID) {
//						$result[Firebase::IS_ANDROID][] = $d->fcm_token;
//					} else {
//						$result[Firebase::IS_IOS][] = $d->fcm_token;
//					}
//				}
//				Firebase::send("New Receipt Registered !!!", $result, "invoice", $id);
//			}
//		}
		Firebase::send("useri anun um uxarkum em", "friend_request", $id);
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// claim coin offers

	public function claim_post()
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

		if ($this->input->post('coin_id') == NUll OR is_numeric($this->input->post('coin_id')) == FALSE) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide valid value"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
		}

		$offer_id = $this->input->post("coin_id");

		$this->db->select('price');
		$price = $this->db->get_where("coin_offers", array("id" => $offer_id))->row()->price;

		$this->db->select('id, coins');
		$user = $this->db->get_where("users", array("id" => $res))->row();

		if ($user->coins < $price) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Insufficient funds"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$data = array(
			"user_id" => $res,
			"coin_offer_id" => $offer_id
		);

		$balance = $user->coins - $price;

		$this->db->trans_start();

		$this->db->set("coins", $balance);
		$this->db->where("id", $res);
		$this->db->update("users");

		$this->db->insert("claimed_offers", $data);

		$this->db->trans_complete();

		$response = array(
			"success" => true,
			"data" => array(),
			"msg" => "Successfully purchased"
		);
		$this->response($response, REST_Controller::HTTP_OK);
		return;
	}
}
