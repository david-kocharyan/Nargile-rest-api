<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');


class Users_API extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->load->model("User");
	}

	/**
	 * Simple register method.
	 * @return Response
	 */
	public function register_post()
	{
		$username = $this->input->post('username');
		$first_name = $this->input->post('first_name');
		$last_name = $this->input->post('last_name');
		$date_of_birth = $this->input->post('date_of_birth');
		$mobile_number = $this->input->post('mobile_number');
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$reference_code = $this->input->post('reference_code');

		$check = $this->User->check_unique($username, $mobile_number, $email);

		if (null == $this->input->post('username')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide username',
			);
			$this->response($response, $status);
			return;
		} elseif (null == $this->input->post('first_name')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide first name',
			);
			$this->response($response, $status);
			return;
		} elseif (null == $this->input->post('last_name')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide last name',
			);
			$this->response($response, $status);
			return;
		} elseif (null == $this->input->post('date_of_birth')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide date of birth',
			);
			$this->response($response, $status);
			return;
		} elseif (null == $this->input->post('mobile_number')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide mobile number',
			);
			$this->response($response, $status);
			return;
		} elseif (null == $this->input->post('email')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide email',
			);
			$this->response($response, $status);
			return;
		} elseif ($check != 2) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please provide unique '.$check,
			);
			$this->response($response, $status);
			return;
		} elseif (null == $this->input->post('password')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide password',
			);
			$this->response($response, $status);
			return;
		} elseif ($this->input->post('password') != $this->input->post('password_confirm')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Password must be confirmed',
			);
			$this->response($response, $status);
			return;
		} else {
			$password = hash("sha512", $password);
			$data = array(
				"username" => $username,
				"first_name" => $first_name,
				"last_name" => $last_name,
				"date_of_birth" => $date_of_birth,
				"mobile_number" => $mobile_number,
				"email" => $email,
				"password" => $password,
				"reference_code" => $reference_code,
			);

			$auth_id = $this->User->register($data);

			$token = $this->generateToken();
			$data['refresh_token'] = $this->generateToken();
			$status = self::HTTP_OK;

			$user_data = array(
				"user" => array(
					"first_name" => $first_name,
					"last_name" => $last_name,
					"date_of_birth" => $date_of_birth,
					"mobile_number" => $mobile_number,
					"email" => $email,
					"reference_code" => $reference_code == null ? "" : $reference_code,
				),
				"tokens" => array(
					"token" => $token,
					"refresh_token" => $data['refresh_token']
				),
			);

			$data = array(
				"token" => $token,
				"time" => time() + 86400,
				"user_id" => $auth_id,
				'refresh_token' => $data['refresh_token']
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
	}

	/**
	 * Simple login method.
	 * @return Response
	 */
	public function login_post()
	{
		$username = $this->input->post('username');
		$password = $this->input->post('password');

		if (null == $this->input->post('username')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide username',
			);
			$this->response($response, $status);
			return;
		} elseif (null == $this->input->post('password')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide password',
			);
			$this->response($response, $status);
			return;
		}

		$auth = $this->User->login($username, $password);
		if (!$auth) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Wrong Credentials',
			);
			$this->response($response, $status);
		} else {
			$token = $this->generateToken();
			$data['refresh_token'] = $this->generateToken();
			$status = self::HTTP_OK;
			$data = array(
				"token" => $token,
				"time" => time() + 86400,
				"user_id" => $auth->id,
				'refresh_token' => $data['refresh_token']
			);

			$user_data = array(
				"user" => array(
					"first_name" => $auth->first_name,
					"last_name" => $auth->last_name,
					"date_of_birth" => $auth->date_of_birth,
					"mobile_number" => $auth->mobile_number,
					"email" => $auth->email,
					"reference_code" => $auth->reference_code == null ? "" : $auth->reference_code,
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
	}

	public function refresh_token_post()
	{
		if (null == $this->input->post("refresh_token")) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide refresh token',
			);
			$this->response($response, $status);
			return;
		}

		$tokens = $this->db->get_where("tokens", ['refresh_token' => $this->input->post("refresh_token")])->row_array();
		if (null == $tokens) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Provided refresh token is incorrect',
			);
			$this->response($response, $status);
			return;
		}

		$response_tokens = array(
			"token" => $this->generateToken(),
			"refresh_token" => $this->generateToken()
		);
		$this->db->update('tokens', ['token' => $response_tokens['token'], 'refresh_token' => $response_tokens['refresh_token'], 'time' => time() + 86400], ['id' => $tokens['id']]);
		$data = array(
			'success' => true,
			'data' => $response_tokens,
			'msg' => ""
		);
		$this->response($data, REST_Controller::HTTP_OK);

	}

//	get user country
//	public function ip_info($ip = NULL, $purpose = "location", $deep_detect = TRUE) {
//		$output = NULL;
//		if (filter_var($ip, FILTER_VALIDATE_IP) === FALSE) {
//			$ip = $_SERVER["REMOTE_ADDR"];
//			if ($deep_detect) {
//				if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP))
//					$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
//				if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP))
//					$ip = $_SERVER['HTTP_CLIENT_IP'];
//			}
//		}
//		$purpose    = str_replace(array("name", "\n", "\t", " ", "-", "_"), NULL, strtolower(trim($purpose)));
//		$support    = array("country", "countrycode", "state", "region", "city", "location", "address");
//		$continents = array(
//			"AF" => "Africa",
//			"AN" => "Antarctica",
//			"AS" => "Asia",
//			"EU" => "Europe",
//			"OC" => "Australia (Oceania)",
//			"NA" => "North America",
//			"SA" => "South America"
//		);
//		if (filter_var($ip, FILTER_VALIDATE_IP) && in_array($purpose, $support)) {
//			$ipdat = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $ip));
//			if (@strlen(trim($ipdat->geoplugin_countryCode)) == 2) {
//				switch ($purpose) {
//					case "location":
//						$output = array(
//							"city"           => @$ipdat->geoplugin_city,
//							"state"          => @$ipdat->geoplugin_regionName,
//							"country"        => @$ipdat->geoplugin_countryName,
//							"country_code"   => @$ipdat->geoplugin_countryCode,
//							"continent"      => @$continents[strtoupper($ipdat->geoplugin_continentCode)],
//							"continent_code" => @$ipdat->geoplugin_continentCode
//						);
//						break;
//					case "address":
//						$address = array($ipdat->geoplugin_countryName);
//						if (@strlen($ipdat->geoplugin_regionName) >= 1)
//							$address[] = $ipdat->geoplugin_regionName;
//						if (@strlen($ipdat->geoplugin_city) >= 1)
//							$address[] = $ipdat->geoplugin_city;
//						$output = implode(", ", array_reverse($address));
//						break;
//					case "city":
//						$output = @$ipdat->geoplugin_city;
//						break;
//					case "state":
//						$output = @$ipdat->geoplugin_regionName;
//						break;
//					case "region":
//						$output = @$ipdat->geoplugin_regionName;
//						break;
//					case "country":
//						$output = @$ipdat->geoplugin_countryName;
//						break;
//					case "countrycode":
//						$output = @$ipdat->geoplugin_countryCode;
//						break;
//				}
//			}
//		}
////			return $output;
//		var_dump($output);
//	}


}

