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
			// When Graph returns an error
			echo 'Graph returned an error: ' . $e->getMessage();
			exit;
		} catch (\Facebook\Exceptions\FacebookSDKException $e) {
			// When validation fails or other local issues
			echo 'Facebook SDK returned an error: ' . $e->getMessage();
			exit;
		}

		$user = $response->getGraphUser();
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
			);
			$this->db->insert('users', $data);
			var_dump(22);
		}
		else{
			var_dump($user_data);
		}
	}

}
