<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');


class Restaurants_Api extends REST_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	/**
	 * Simple register method.
	 * @return Response
	 */
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

		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? $this->input->get('limit') : 5;
		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;

		$nearest = $this->get_nearest();
		$top_rated = $this->get_top_rated();
		if($this->input->get("action") == "top") {
			$count_data = $this->get_pages("top");
		} else if($this->input->get("action") == "nearest") {
			$count_data = $this->get_pages("nearest");
		} else {
			$count_nearest = $this->get_pages("nearest");
			$count_top = $this->get_pages("top");
		}

		if(null == $this->input->get('action')) {
			$response = array(
				'success' => true,
				'data' => array(
					"nearest" => array(
						"list" => $nearest,
						"meta" => array(
							"limit" => $limit,
							"offset" => $offset,
							"pages" => ($limit != 0 || null !== $limit) ? ceil($count_nearest->pages / $limit) : 1,
						),
						"action" => "nearest"
					),
					"top" => array(
						"list" => $top_rated,
						"meta" => array(
							"limit" => $limit,
							"offset" => $offset,
							"pages" => ($limit != 0 || null !== $limit) ? ceil($count_top->pages / $limit) : 1,
						),
						"action" => "top"
					),
				),
				'msg' => '',
			);
			$this->response($response, REST_Controller::HTTP_OK);
		} else {
			switch ($this->input->get('action')) {
				case "nearest":
					$data = $this->get_nearest();
					break;
				case "top":
					$data = $this->get_top_rated();
					break;
			}
			$pages = ($limit != 0 || null !== $limit) ? ceil($count_data->pages / $limit) : 1;
			$response = array(
				"success" => true,
				"data" => array(
					$this->input->get('action') => array(
						"list" => isset($data) ? $data : array(),
						"meta" => array(
							"limit" => $limit,
							"offset" => $offset,
							"pages" => $pages,
						),
					),
				),
				"msg" => ""
			);
			$this->response($response, REST_Controller::HTTP_OK);
		}


	}

	private function get_nearest()
	{
		$this->db->select("restaurants.name, area.name as area_name, countries.name as country_name, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, restaurants.id as id");
		$this->limits();
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
		////////////////////////////////////////////
		$this->db->where("restaurants.id <= 15");
		//////////////////////////////////////////
		$this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));

		$data = $this->db->get("restaurants")->result();
		return $data != null ? $data : "";
	}

	private function get_top_rated()
	{
		$this->db->select("restaurants.name, area.name as area_name, countries.name as country_name, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, restaurants.id as id ");
		$this->limits();
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
		///////////////////////////////////////////
		$this->db->where("restaurants.id > 15");
		///////////////////////////////////////////
		$this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));


		$data = $this->db->get("restaurants")->result();
		return $data != null ? $data : "";
	}

	private function get_pages($type = null)
	{
		$this->db->select("count(restaurants.id) as pages");
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
		$this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));
		/////////////////////////////////////////////////////////////////
		if($type == "top") $this->db->where("restaurants.id > 15");
		if($type == "nearest") $this->db->where("restaurants.id <= 15");
		////////////////////////////////////////////////////////////////
		$data = $this->db->get("restaurants")->row();
		return $data != null ? $data : 0;
	}

	private function limits()
	{
		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? $this->input->get('limit') : 5;
		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;
		$this->db->limit($limit, $offset);
	}

}

