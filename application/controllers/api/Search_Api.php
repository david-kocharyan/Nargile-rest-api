<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

class Search_Api extends REST_Controller
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
		$pages = ($limit != 0 || null !== $limit) ? ceil($this->get_pages()->pages / $limit) : 0;

		$data = $this->find();
		$response = array(
			"success" => true,
			"data" => array(
				"list" => isset($data) ? $data : array(),
				"meta" => array(
					"limit" => $limit,
					"offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? intval($this->input->get('offset')) : 0,
					"pages" => ($limit != 0 || null !== $limit) ? $pages : 0,
				),
			),
			"msg" => ""
		);
		$this->response($response, REST_Controller::HTTP_OK);
	}

	private function find()
	{
		$this->db->select("restaurants.name as restaurant_name, restaurants.id as restaurant_id, 
		area.name as area, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, 
		concat('/plugins/thumb_images/Restaurants/Thumb_', restaurants.logo) as thumb,
		'Nargile Price Range 10000-16000 LBP' as info, '3.6' as rate ");
		$this->join();
		$this->where();
		$this->limits();
		$this->filters();
		$this->db->order_by("restaurants.name");
		$data = $this->db->get("restaurants")->result();
		return $data != null ? $data : array();
	}

	private function where()
	{
		$this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));
	}

	private function filters()
	{
		if ($this->input->get("name") != null) $this->db->like('restaurants.name', $this->input->get("name"), 'both');
		if ($this->input->get("rate") != null) $this->db->where('restaurants.rate >=', $this->input->get("rate"));
		if ($this->input->get("country") != null) {
			$this->db->where('countries.id', $this->input->get("country"));
		}
		if ($this->input->get("area") != null) $this->db->where('restaurants.area_id', $this->input->get("area"));

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		if ($this->input->get("price_from") != null) $this->db->where('restaurants.price_from >=', $this->input->get("price_from"));
		if ($this->input->get("price_to") != null) $this->db->where('restaurants.price_to <=', $this->input->get("price_to"));
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	}

	private function join()
	{
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
	}

	private function get_pages($type = null)
	{
		$this->db->select("count(restaurants.id) as pages");
		$this->join();
		$this->where();
		$data = $this->db->get("restaurants")->row();
		return $data != null ? $data : 0;
	}

	private function limits()
	{
		$limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? $this->input->get('limit') : 10;
		$offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;
		$this->db->limit($limit, $offset);
	}

}
