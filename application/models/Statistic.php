<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Statistic extends CI_Model
{
	function __construct()
	{
		parent:: __construct();
	}


//	owner chart
	public function users_count()
	{
		$this->db->select("count(id) as count");
		$data = $this->db->get_where("users", array("verify" => 1))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function restaurant_count($id)
	{
		$this->db->select("count(id) as count");
		$data = $this->db->get_where("restaurants", array("admin_id" => $id))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function share_count($id)
	{
		$this->db->select("count(notification.id) as count");
		$this->db->join('notification', 'restaurants.id = notification.action_id');
		$data = $this->db->get_where("restaurants", array("restaurants.admin_id" => $id, "notification.click_action" => 'share_request'))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function reviews_count($id)
	{
		$this->db->select("count(reviews.id) as count");
		$this->db->join('reviews', 'restaurants.id = reviews.restaurant_id');
		$data = $this->db->get_where("restaurants", array("restaurants.admin_id" => $id))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function my_restaurants($id)
	{
		$this->db->select("restaurants.id, restaurants.name");
		$data = $this->db->get_where("restaurants", array("admin_id" => $id, 'status' => 1))->result();
		return $data != NULL ? $data : array();
	}

//	super admin chart
	public function all_users_count()
	{
		$this->db->select("count(id) as count");
		$data = $this->db->get_where("users", array("verify" => 1))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_restaurant_count()
	{
		$this->db->select("count(id) as count");
		$data = $this->db->get("restaurants")->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_share_count()
	{
		$this->db->select("count(notification.id) as count");
		$data = $this->db->get_where("notification", array("notification.click_action" => 'share_request'))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_reviews_count()
	{
		$this->db->select("count(reviews.id) as count");
		$data = $this->db->get_where("reviews")->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_restaurants()
	{
		$this->db->select("restaurants.id, restaurants.name");
		$data = $this->db->get_where("restaurants", array('status' => 1))->result();
		return $data != NULL ? $data : array();
	}


}
