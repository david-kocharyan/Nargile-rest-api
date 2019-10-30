<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

class Coins_Api extends REST_Controller
{
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

		$user_coins = $user->coins;
		$my_coins = $this->db->get_where('users', array('id' => $res))->row()->coins;

		if ($coin_count > $my_coins){
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Not enough coins in your account"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}

		$this->db->trans_start();

		$this->db->set('coins', $user_coins + $coin_count);
		$this->db->where('id', $user_id);
		$this->db->update('users');

		$this->db->set('coins', $my_coins - $coin_count);
		$this->db->where('id', $res);
		$this->db->update('users');

		$this->db->trans_complete();

		$response = array(
			"success" => true,
			"data" => array(),
			"msg" => "Coins sent successfully"
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}
}
