<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Plan extends CI_Model
{
	function __construct()
	{
		parent:: __construct();
	}

	public function select()
	{
		$this->db->select("res_plans.*,restaurants.name");
		$this->db->join("restaurants", 'restaurants.id = res_plans.restaurant_id');
		$data = $this->db->get_where("res_plans", array("res_plans.status" => 1))->result();
		return $data;
	}

	public function selectAll()
	{
		$this->db->select("res_plans.*,restaurants.name");
		$this->db->join("restaurants", 'restaurants.id = res_plans.restaurant_id');
		$data = $this->db->get("res_plans")->result();
		return $data;
	}
}
