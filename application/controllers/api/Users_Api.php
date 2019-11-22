<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

// Required if your environment does not handle autoloading
require FCPATH . '/vendor/autoload.php';

// Use the REST API Client to make requests to the Twilio REST API
use Twilio\Rest\Client;

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
				'msg' => 'Please provide unique ' . $check,
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

			$verif_code = rand(1000,9999);
			$sid    = "AC6cffa9eadacc1e8eeffae00dbb3176d6";
			$token  = "91ee41348baec6b730f01c9050ccec22";
			$twilio = new Client($sid, $token);
			$message = $twilio->messages
				->create("+37499099248", // to
					array(
						"from" => "+19723629637",
						"body" => "Nargile App verification code is: $verif_code"
					)
				);

			print($message->sid);

			$password = hash("sha512", $password);
			$uuid = vsprintf('%s-%s', str_split(dechex(microtime(true) * 1000) . bin2hex(random_bytes(10)), 6));
			$data = array(
				"username" => $username,
				"first_name" => $first_name,
				"last_name" => $last_name,
				"date_of_birth" => $date_of_birth,
				"mobile_number" => $mobile_number,
				"uuid" => $uuid,
				"email" => $email,
				"password" => $password,
				'image' => 'User_default.png',
			);

			$auth_id = $this->User->register($data);
			$badges = $this->get_badges($auth_id);
			$coins = "0";
			$check_reference = "true";

			if ($reference_code != NULL OR $reference_code != "") {
				$promo = $this->db->get_where("users", array("uuid" => $reference_code))->row();

				if ($promo != NULL && $promo->is_used_reference == 0) {
					$this->db->trans_start();

					$this->db->set("coins", 10);
					$this->db->where("id", $auth_id);
					$this->db->update("users");

					$this->db->set("coins", $promo->coins + 10);
					$this->db->set("is_used_reference", 1);
					$this->db->where("id", $promo->id);
					$this->db->update("users");

					$this->db->trans_complete();
					$coins = "10";
				} else {
					$check_reference = "false";
				}

			}

			$token = $this->generateToken();
			$data['refresh_token'] = $this->generateToken();
			$status = self::HTTP_OK;

			$user_data = array(
				"user" => array(
					"id" => "$auth_id",
					"first_name" => $first_name,
					"last_name" => $last_name,
					"date_of_birth" => $date_of_birth,
					"mobile_number" => $mobile_number,
					"email" => $email,
					"uuid" => $uuid,
					"check_reference" => $check_reference,
					"coins" => $coins,
					"image" => '/plugins/images/Logo/User_default.png',
					'badges' => $badges,
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

//	reference code check
	public function promo_code_post()
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

		$promo_code = $this->input->post("promo_code");
		if ($promo_code == NULL) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide reference code."
			);
			$this->response($data, self::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$me = $this->db->get_where("users", array("id" => $res))->row();
		$user = $this->db->get_where("users", array("uuid" => $promo_code))->row();
		if ($user == NULL OR $user->is_used_reference == 1) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => "Your reference code is incorrect or already used."
			);
			$this->response($data, self::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$this->db->trans_start();

		$this->db->set("coins", $me->coins + 10);
		$this->db->where("id", $me->id);
		$this->db->update("users");

		$this->db->set("coins", $user->coins + 10);
		$this->db->set("is_used_reference", 1);
		$this->db->where("id", $user->id);
		$this->db->update("users");

		$this->db->trans_complete();

		if ($this->db->trans_status() === FALSE) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => "Something went wrong. Please try again."
			);
			$this->response($data, self::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}
		$data = array(
			"success" => true,
			"data" => array(),
			"msg" => "Your 10 coins has been successfully transferred."
		);
		$this->response($data, self::HTTP_OK);

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

			$badges = $this->get_badges($auth->id);

			$user_data = array(
				"user" => array(
					"id" => $auth->id,
					"first_name" => $auth->first_name,
					"last_name" => $auth->last_name,
					"date_of_birth" => $auth->date_of_birth,
					"mobile_number" => $auth->mobile_number,
					"email" => $auth->email,
					"uuid" => $auth->uuid,
					"check_reference" => "true",
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	logout
	public function logout_get()
	{
		$headers = $this->input->request_headers();
		$token = "";
		if (isset($headers['Authorize'])) {
			$token = $headers['Authorize'];
		}
		$res = $this->db->get_where("tokens", array("token" => $token))->row_array();
		if (null == $res || empty($res)) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => "Provide valid token",
				"status" => REST_Controller::HTTP_UNPROCESSABLE_ENTITY
			);
		} else {

			$this->db->set('token', NULL);
			$this->db->set('refresh_token', NULL);
			$this->db->set('time', NULL);
			$this->db->where('id', $res['id']);
			$this->db->update('tokens');

			$data = array(
				"success" => true,
				"data" => array(),
				"msg" => "You have successfully logged out",
				"status" => REST_Controller::HTTP_OK
			);
		}
		$status = $data['status'];
		unset($data['status']);
		$this->response($data, $status);
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	get authorized user data
	public function getUser_get()
	{
		//        the function would return current user's id, if the token would be approved
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

		if ($this->input->get('id') != "" OR $this->input->get('id') != NULL) {
			$user_id = $this->input->get('id');
		} else {
			$user_id = $res;
		}

		$this->db->select('id, username, first_name, last_name, date_of_birth, mobile_number, email, coins, uuid, image');
		$user = $this->db->get_where("users", ['id' => $user_id])->row();

		if (null == $user) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => "User not found !"
			);
			$this->response($data, REST_Controller::HTTP_BAD_REQUEST);
			return;
		}
		$badges = $this->get_badges($user_id);

		$response = array(
			"msg" => '',
			"data" => array(
				"user" => array(
					"id" => $user->id,
					"first_name" => $user->first_name,
					"last_name" => $user->last_name,
					"date_of_birth" => $user->date_of_birth,
					"mobile_number" => $user->mobile_number,
					"email" => $user->email,
					"uuid" => $user->uuid,
					"check_reference" => "true",
					"coins" => $user->coins,
					"image" => '/plugins/images/Logo/' . $user->image,
					'badges' => $badges,
				),
			),
			"success" => true
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	get coins
	public function get_coins_get()
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

		$this->db->select("coins");
		$data = $this->db->get_where("users", array("id" => $res))->row();

		$response = array(
			"success" => true,
			"data" => $data != null ? $data : array(),
			"msg" => '',
		);
		$this->response($response, self::HTTP_OK);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// change User Image

	public function change_image_post()
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

		if (!empty($_FILES)) {
			$image = $this->uploadImage('image');
			if (isset($image['error'])) {
				$response = array(
					"success" => false,
					"data" => array(),
					"msg" => $image['error'],
				);
				$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			}
			$avatar = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			$user_image = $this->db->get_where("users", array('id' => $res))->row()->image;

			if ($user_image != "User_default.png") {
				unlink(FCPATH . "/plugins/images/Logo/" . $user_image);
			}

			$this->db->set('image', $avatar);
			$this->db->where('id', $res);
			$this->db->update('users');
		} else {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please upload image!",
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$this->db->select('id, username, first_name, last_name, date_of_birth, mobile_number, email, coins, uuid, image');
		$user = $this->db->get_where("users", array('id' => $res))->row();
		$badges = $this->get_badges($res);

		$response = array(
			"msg" => '',
			"data" => array(
				"user" => array(
					"id" => $user->id,
					"first_name" => $user->first_name,
					"last_name" => $user->last_name,
					"date_of_birth" => $user->date_of_birth,
					"mobile_number" => $user->mobile_number,
					"email" => $user->email,
					"uuid" => $user->uuid,
					"check_reference" => "true",
					"coins" => $user->coins,
					"image" => '/plugins/images/Logo/' . $user->image,
					'badges' => $badges,
				),
			),
			"success" => true
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Logo")) {
			mkdir(FCPATH . "/plugins/images/Logo", 0755, true);
		}

		$path = FCPATH . "/plugins/images/Logo";
		$config['upload_path'] = $path;
		$config['file_name'] = 'Logo_' . time() . '_' . rand();
		$config['allowed_types'] = '*';
		$config['max_size'] = 100000;
		$this->load->library('upload', $config);

		if (!$this->upload->do_upload($image)) {
			$errorStrings = strip_tags($this->upload->display_errors());
			$error = array('error' => $errorStrings, 'image' => $image);
			return $error;
		} else {
			$uploadedImage = $this->upload->data();
			$this->resizeImage($uploadedImage['file_name'], $path);
			$data = array('data' => $uploadedImage);
			return $data;
		}
	}

	private function resizeImage($filename, $path)
	{
		$source_path = $path . "/" . $filename;
		$target_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 800,
			'height' => 800,
		);
		$this->load->library('image_lib');
		$this->image_lib->initialize($config_manip);

		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// change password

	public function change_password_put()
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

		$old_pass = $this->put('old');
		$new_pass = $this->put('new');

		if ($old_pass == NULL OR $new_pass == NULL OR $old_pass == "" OR $new_pass == "") {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide old or new password",
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		} elseif (strlen($new_pass) < 8) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Password must be at least 8 characters",
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$user_pass = $this->db->get_where("users", array('id' => $res))->row()->password;
		$password_hash_old = hash("SHA512", $old_pass);
		$password_hash_new = hash("sha512", $new_pass);

		if ($password_hash_old != $user_pass) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Your old password does not match the current password",
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		} elseif ($password_hash_new == $user_pass) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Your new password can not be match the current password",
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$this->db->set('password', $password_hash_new);
		$this->db->where('id', $res);
		$this->db->update('users');

		$response = array(
			"success" => true,
			"data" => array(),
			"msg" => "Password successfully changed",
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// get and use claimed offers
	public function coin_offers_get()
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

		$this->db->select("concat('You have claimed 1 free nargile at ', restaurants.name) as description, claimed_offers.coin_offer_id as offer_id,
		concat('Valid until` ', DATE_FORMAT(FROM_UNIXTIME(`coin_offers`.`valid_date`), '%d.%m.%Y')) as date");
		$this->db->join("coin_offers", "coin_offers.id = claimed_offers.coin_offer_id");
		$this->db->join("restaurants", "restaurants.id = coin_offers.restaurant_id");
		$this->db->where("DATE(FROM_UNIXTIME(coin_offers.valid_date)) >= CURDATE()");
		$data = $this->db->get_where("claimed_offers", array("claimed_offers.status" => 1, "user_id" => $res))->result();

		$response = array(
			"success" => true,
			"data" => $data != null ? $data : array(),
			"msg" => ""
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

	public function use_offer_post()
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

		$offer_id = $this->input->post("offer_id");
		if ($offer_id == NULL) {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide Offer ID",
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$this->db->trans_start();

		$this->db->set('user_id', 0);
		$this->db->set('coin_offer_id', 0);
		$this->db->set('status', 0);
		$this->db->where("coin_offer_id", $offer_id);
		$this->db->where("user_id", $res);
		$this->db->update('claimed_offers');

		$this->db->insert("used_offers", array("coin_offer_id" => $offer_id, "user_id" => $res, "time" => strtotime("now")));

		$this->db->trans_complete();
		$response = array(
			"success" => true,
			"data" => array(),
			"msg" => "Offers successfully used"
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

}

