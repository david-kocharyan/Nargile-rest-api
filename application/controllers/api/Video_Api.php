<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

// Required if your environment does not handle autoloading
require FCPATH . '/vendor/autoload.php';

class Video_Api extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->load->model("Video");
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

		$user = $this->db->get_where('users', array('id' => $res))->row();

		if ($user->region_id != NULL){
			$this->db->select('show_count, link, concat("/plugins/images/Video/", video) as media, type');
			$this->db->where("valid_date >= CURDATE()");
			$video = $this->db->get_where('video', array('region_id' => $user->region_id, 'status' => 1))->result();
		}
		else{
			$this->db->select('show_count, link, concat("/plugins/images/Video/", video) as media, type');
			$this->db->where("valid_date >= CURDATE()");
			$video = $this->db->get_where('video', array('country' => $user->country, 'status' => 1))->result();
		}


		$data = array(
			"success" => true,
			"data" => $video ?? array(),
			"msg" => ""
		);
		$this->response($data, self::HTTP_OK);
	}
}
