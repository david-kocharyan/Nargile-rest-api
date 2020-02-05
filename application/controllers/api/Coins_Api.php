<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');
require FCPATH . "application/controllers/Firebase.php";

class Coins_Api extends REST_Controller
{
	const COIN_REQUEST_EVENT = "coin_request";

	public function __construct()
	{
		parent::__construct();
		$this->load->database();

	}

	public function index_post()
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

		if ($this->input->post('user_id') == NULL OR $this->input->post('user_id') == "") {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please Provide User"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		} elseif ($this->input->post('coins_count') == NULL OR $this->input->post('coins_count') == 0) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "The count of coins cannot be zero!"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$user_id = $this->input->post('user_id');
		$this->db->select('coins');
		$user = $this->db->get_where('users', array('id' => $user_id))->row();
		if ($user == NULL) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "User Not Found!"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$coin_count = $this->input->post('coins_count');

		$my_coins = $this->db->get_where('users', array('id' => $res))->row()->coins;
		if ($coin_count > $my_coins) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Not enough coins in your account"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$this->db->set('coins', $my_coins - $coin_count);
		$this->db->where('id', $res);
		$this->db->update('users');

		try {
			$this->send_notif($user_id, $res, $coin_count);
		} catch (Exception $e) {
		}

		$response = array(
			"success" => true,
			"data" => array(),
			"msg" => "Coins sent successfully"
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}


	private function send_notif($sent_to_id, $sent_from_id, $coins)
	{
//		get the user whom is sent the request
		$sent_to_user = $this->db->get_where("users", array("id" => $sent_to_id))->row();
		$sent_from_user = $this->db->get_where("users", array("id" => $sent_from_id))->row();

		if (null != $sent_to_user) {
			$body = $sent_from_user->first_name . " " . $sent_from_user->last_name . " Sent You $coins Coins";

//			add to database
			$data = array(
				"user_id" => $sent_to_id,
				"body" => $body,
				"click_action" => self::COIN_REQUEST_EVENT,
				"coins" => $coins,
				"action_id" => $sent_from_id
			);
			$this->db->insert('notification', $data);

//			get the user's fcm tokens whom is sent the request
			$tokens = $this->get_fcm_tokens($sent_to_id);
			Firebase::send($body, $tokens, self::COIN_REQUEST_EVENT, $sent_from_id);
		}
	}

	private function get_fcm_tokens($user_id)
	{
		$this->db->select("fcm_token, os");
		$this->db->join("users", "users.id = tokens.user_id AND users.notification_status = 1");
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
