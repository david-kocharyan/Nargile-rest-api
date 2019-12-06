<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

class Notification_Api extends REST_Controller
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

		//get notifications
		$this->db->select('body, click_action, action_id, status, created_at');
		$this->db->order_by('created_at DESC');
		$this->db->limit($limit, $offset);
		$data = $this->db->get_where('notification', array("user_id" => $res))->result();

		//get notifications
		$this->db->select('count(id) as pages');
		$page = $this->db->get_where('notification', array("user_id" => $res))->row();

		$response = array(
			"success" => true,
			'data' => array(
				"notification" => $data != NULL ? $data : array(),
				"meta" => array(
					"limit" => $limit,
					"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
					"pages" => ($limit != 0 || null !== $limit) ? ceil($page->pages / $limit) : 0,
				),
			),
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

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

		if ($this->input->post("action_id") == NULL OR $this->input->post("action_id") == "") {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please provide User"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
			return;
		}
		$action_id = $this->input->post("action_id");

		if ($this->input->post("answer") == 1) {
			$this->db->trans_start();

			$this->db->set("status", 1);
			$this->db->where(array("user_id" => $res, 'action_id' => $action_id, "status" => 1));
			$this->db->update('notification');

			$this->db->set("status", 1);
			$this->db->where(array("to_id" => $res, 'from_id' => $action_id, "status" => 2));
			$this->db->update('friends');

			$this->db->trans_complete();
		} else if ($this->input->post("answer") == 0) {
			$this->db->trans_start();

			$this->db->set("status", 1);
			$this->db->where(array("user_id" => $res, 'action_id' => $action_id, "status" => 1));
			$this->db->update('notification');

			$this->db->set(array("status" => NULL, "to_id" => NULL, "from_id" => NULL));
			$this->db->where(array("to_id" => $res, 'from_id' => $action_id, "status" => 2));
			$this->db->update('friends');

			$this->db->trans_complete();
		}

		if ($this->db->trans_status() == true) {
			$response = array(
				"success" => true,
				"data" => array(),
				"msg" => "Success"
			);
			$this->response($response, REST_Controller::HTTP_OK);
		} else {
			$response = array(
				"success" => false,
				"data" => array(),
				"msg" => "Something Went Wrong. Please Try Again!"
			);
			$this->response($response, REST_Controller::HTTP_UNPROCESSABLE_ENTITY);
		}


	}


}
