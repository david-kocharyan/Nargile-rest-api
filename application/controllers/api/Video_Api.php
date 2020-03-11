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
		$time = $this->input->get('time');

		if ($time == null) {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => "Please Send Correct Time"
			);
			$this->response($data, self::HTTP_UNPROCESSABLE_ENTITY);
		}

		$user = $this->get_show_count($time, $res);

		if ($user->region_id != NULL) {
			$this->db->select('show_count, link, concat("/plugins/images/Video/", video) as media, type, restaurant_id');
			$this->db->where("valid_date >= CURDATE()");
			$this->db->where("(show_count-$user->banner_show) > 0");
			$video = $this->db->get_where('video', array('region_id' => $user->region_id, 'status' => 1))->result();
		} else {
			$this->db->select("show_count, link, concat('/plugins/images/Video/', video) as media, type, restaurant_id");
			$this->db->where("valid_date >= CURDATE()");
			$this->db->where("(show_count-$user->banner_show) > 0");
			$video = $this->db->get_where('video', array('country' => $user->country, 'status' => 1))->result();
		}

		$data = array(
			"success" => true,
			"data" => $video ?? array(),
			"msg" => ""
		);
		$this->response($data, self::HTTP_OK);
	}

	private function get_show_count($time, $res)
	{
		$update_date = date('Y-m-d', intval($time/1000));
		$user = $this->db->get_where('users', array('id' => $res))->row();

		if ($user->banner_update == null) {
			$this->db->set('banner_update', $update_date);
			$this->db->set('banner_show', $user->banner_show + 1);
			$this->db->where('id', $res);
			$this->db->update('users');

		} elseif ($user->banner_update == $update_date) {
			$this->db->set('banner_update', $update_date);
			$this->db->set('banner_show', $user->banner_show + 1);
			$this->db->where('id', $user->id);
			$this->db->update('users');

		} else {
			$this->db->set('banner_update', null);
			$this->db->set('banner_show', null);
			$this->db->where('id', $user->id);
			$this->db->update('users');
		}

		return $user = $this->db->get_where('users', array('id' => $res))->row();
	}

}
