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
//		$res = $this->verify_get_request();
//		if (gettype($res) != 'string') {
//			$data = array(
//				"success" => false,
//				"data" => array(),
//				"msg" => $res['msg']
//			);
//			$this->response($data, $res['status']);
//			return;
//		}

		$res = 30;

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



	public function slider_get()
	{

		$regions = $this->db->get_where('regions', array("regions.status" => 1))->result();
		$arr = array();
		foreach ($regions as $bin => $key) {
			$this->db->select("regions_coordinates.lat, regions_coordinates.lng");
			$data = $this->db->get_where("regions_coordinates", array("region_id" => $key->id))->result();
			$arr[$bin]["reg"] = $data;
			$arr[$bin]["reg_id"] = $key->id;
		}

		$id = 0;
		foreach ($arr as $key) {
			$in = $this->inside($point, $key["reg"]);
			if ($in == "true") {
				$id = $key["reg_id"];
				break;
			}
		}

		if ($id == 0) {
			$this->db->select("sliders.id, concat('/plugins/images/Slider/', sliders.image) as image, link, restaurant_id");
			$this->db->where("status", 1);
			$this->db->where("region_id is null");
			$data = $this->db->get("sliders")->result();

			foreach ($data as $key) {
				if ($key->link == null) $key->link = "";
				if ($key->restaurant_id == null) $key->restaurant_id = "";
			}

			$response = array(
				"success" => true,
				"data" => array(
					"list" => isset($data) ? $data : array(),
				),
				"msg" => ""
			);
			$this->response($response, REST_Controller::HTTP_OK);
			return;
		} else {
			$this->db->select("sliders.id, concat('/plugins/images/Slider/', sliders.image) as image, link, restaurant_id");
			$this->db->where("DATE_FORMAT(CURRENT_DATE(), '%Y-%m-%d') BETWEEN DATE_FORMAT(start, '%Y-%m-%d')  AND DATE_FORMAT(end, '%Y-%m-%d')");
			$this->db->where("region_id", $id);
			$this->db->where("status", 1);
			$data = $this->db->get("sliders")->result();

			foreach ($data as $key) {
				if ($key->link == null) $key->link = "";
				if ($key->restaurant_id == null) $key->restaurant_idgit  = "";
			}

			$response = array(
				"success" => true,
				"data" => array(
					"list" => isset($data) ? $data : array(),
				),
				"msg" => ""
			);
			$this->response($response, REST_Controller::HTTP_OK);
			return;
		}
	}




	private function inside($point, $fenceArea)
	{
		$x = $point['lat'];
		$y = $point['lng'];

		$inside = false;
		for ($i = 0, $j = count($fenceArea) - 1; $i < count($fenceArea); $j = $i++) {
			$xi = $fenceArea[$i]->lat;
			$yi = $fenceArea[$i]->lat;
			$xj = $fenceArea[$j]->lng;
			$yj = $fenceArea[$j]->lng;

			$intersect = (($yi > $y) != ($yj > $y))
				&& ($x < ($xj - $xi) * ($y - $yi) / ($yj - $yi) + $xi);
			if ($intersect) $inside = !$inside;
		}

		return $inside;
	}

}
