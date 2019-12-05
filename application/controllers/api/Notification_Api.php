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
		$this->db->order_by('created_at DESC');
		$this->db->limit($limit, $offset);
		$data = $this->db->get_where('notification', array("user_id" => $res))->result();

		//get notifications
		$this->db->select('count(id) as pages');
		$page = $this->db->get_where('notification', array("user_id" => $res))->row();

		$response = array(
			"success" => true,
			'data' => $data != NULL ? $data : array(),
			"meta" => array(
				"limit" => $limit,
				"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
				"pages" => ($limit != 0 || null !== $limit) ? ceil($page->pages / $limit) : 0,
			),
			"msg" => "",
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}
}
