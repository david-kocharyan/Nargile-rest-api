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

		$checkUsername = $this->User->check_username($username);

		if (null == $this->input->post('username')) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'Please, provide username',
			);
			$this->response($response, $status);
			return;
		} elseif ($checkUsername == false) {
			$status = self::HTTP_UNPROCESSABLE_ENTITY;
			$response = array(
				'success' => false,
				'data' => array(),
				'msg' => 'The username must be unique',
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

	public function f_post()
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
		} else {
			$this->response($res);
		}

	}


}

