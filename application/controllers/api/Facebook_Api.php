<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');
require_once FCPATH . '/vendor/autoload.php'; // change path as needed


class Facebook_Api extends REST_Controller
{
	private $fb;

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->load->model("User");

		$this->fb = new \Facebook\Facebook(array(
			'app_id' => '504140546796159',
			'app_secret' => '69c62d7b28f4ca1710eeb33c57aa5a97',
			'default_graph_version' => 'v2.10',
		));
	}

	public function login_post()
	{
		$accessToken = $this->input->post("accessToken");
		$me = '/me?fields=id,name,first_name,last_name,email,birthday';

		try {
			$response = $this->fb->get($me, $accessToken);
		} catch (\Facebook\Exceptions\FacebookResponseException $e) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Wrong Credentials',
			);
			$this->response($response, $status);
			return;
		} catch (\Facebook\Exceptions\FacebookSDKException $e) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Wrong Credentials',
			);
			$this->response($response, $status);
			return;
		}

		$user = $response->getGraphUser();
		if (!$user["email"] || empty($user["email"]) || NULL == $user["email"] || $user["email"] == "") {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Wrong Credentials',
			);
			$this->response($response, $status);
			return;
		}

		$user_data = $this->db->get_where('users', array('email' => $user['email']))->row();
		$username = $user['first_name'] . $user['last_name'] . time() . rand();

		if (NULL == $user_data) {
			$data = array(

				"username" => $username,
				"first_name" => $user['first_name'],
				"last_name" => $user['last_name'],
				"date_of_birth" => '',
				"mobile_number" => '',
				"email" => $user['email'],
				"password" => time() . '?' . rand(),
				"reference_code" => "",
				'coins' => 0,
				"image" => 'User_default.png',

			);
			$this->db->insert('users', $data);
			$id = $this->db->insert_id();

			$auth = $this->db->get_where("users", array("id" => $id))->row();
			$this->Auth($auth);
		} else {
			$this->Auth($user_data);
		}
	}

	private function Auth($auth)
	{

		if (!$auth) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Wrong Credentials',
			);
			$this->response($response, $status);
			return;
		}

		$token = $this->generateToken();
		$data['refresh_token'] = $this->generateToken();
		$status = self::HTTP_OK;
		$data = array(
			"token" => $token,
			"time" => time() + 86400,
			"user_id" => $auth->id,
			'refresh_token' => $data['refresh_token']
		);

		$badges = $this->get_badges($auth->id);
		$user_data = array(
			"user" => array(
				"id" => $auth->id,
				"first_name" => $auth->first_name,
				"last_name" => $auth->last_name,
				"date_of_birth" => $auth->date_of_birth,
				"mobile_number" => $auth->mobile_number,
				"email" => $auth->email,
				"reference_code" => $auth->reference_code == null ? "" : $auth->reference_code,
				"coins" => $auth->coins,
				"image" => '/plugins/images/Logo/' . $auth->image,
				'badges' => $badges,
			),
			"tokens" => array(
				"token" => $token,
				"refresh_token" => $data['refresh_token']
			),
		);

		$this->db->insert('tokens', $data);
		unset($data['user_id']);
		unset($data['time']);
		$response = array(
			"msg" => '',
			"data" => $user_data,
			"success" => true
		);
		$this->response($response, $status);
	}

	private function get_badges($res)
	{
		$this->db->select('COUNT("user_id") as count');
		$review = $this->db->get_where("reviews", array("user_id" => $res))->row();

		$this->db->select('COUNT("user_id") as count');
		$rate = $this->db->get_where("rates", array("user_id" => $res))->row();

		$count = $rate->count + $review->count;

		$this->db->select('count, type, info, concat("/plugins/images/Badge/", image) as image');
		$this->db->where(array('status' => 1, "count <" => $count));
		$data = $this->db->get('badges')->result();

		return $data != null ? $data : array();
	}


}
