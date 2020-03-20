<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Restaurant extends CI_Model
{
	private $table = 'restaurants';

	function __construct()
	{
		parent:: __construct();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
	}

	public function insert_plan($data)
	{
		$this->db->insert('res_plans', $data);
		$insert_id = $this->db->insert_id();
		return $insert_id;
	}

	public function selectAll($limit, $start)
	{
		$this->db->select("restaurants.*, area.name as area_name, countries.name as country_name ");
		$this->db->join("area", "area.id = restaurants.area_id", "left");
		$this->db->join("countries", "countries.id = area.country_id", "left");
		$this->db->limit($limit, $start);
		$data = $this->db->get_where($this->table, array('area.status' => 1, 'countries.status' => 1))->result();
		return $data;
	}

	public function get_count() {
		$data = $this->db->count_all($this->table, array('area.status' => 1, 'countries.status' => 1));
		return $data;
	}

	public function selectResForAdmin($limit, $start, $id)
	{
		$this->db->select("restaurants.*, area.name as area_name, countries.name as country_name ");
		$this->db->join("area", "area.id = restaurants.area_id", "left");
		$this->db->join("countries", "countries.id = area.country_id", "left");
		$this->db->limit($limit, $start);
		$data = $this->db->get_where($this->table, array('area.status' => 1, 'countries.status' => 1, 'restaurants.admin_id' => $id))->result();
		return $data;
	}

	public function selectById($id)
	{
		$data = $this->db->get_where($this->table, ["id" => $id])->row();
		return $data;
	}

	public function selectPlanById($id)
	{
		$data = $this->db->get_where('res_plans', ["restaurant_id" => $id, 'status' => 1])->row();
		return $data;
	}

	public function select($id)
	{
		$data = $this->db->get_where($this->table, ["id" => $id])->row();
		return $data;
	}

	public function update($data, $id)
	{
		$this->db->update($this->table, $data, ["id" => $id]);
	}

	public function update_plan($id, $data)
	{
		$this->db->trans_start();

		$this->db->set('status', 0);
		$this->db->where('restaurant_id', $id);
		$this->db->update('res_plans');

		$this->db->insert('res_plans', $data);

		$this->db->trans_complete();
	}

	public function changeStatus($id)
	{
		$data = $this->db->get_where($this->table, ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update($this->table, array("status" => $status), ['id' => $id]);
	}

//	show current restaurant data
	public function show($id)
	{
		$this->db->select("restaurants.name as restaurant_name, restaurants.id as restaurant_id, 
		area.name as area, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, 
		concat('/plugins/thumb_images/Restaurants/Thumb_', restaurants.logo) as thumb, lat, lng, ROUND(rate, 1) as rate, address, phone_number");
		$this->db->join("area", "area.id = restaurants.area_id");
		$this->db->join("countries", "countries.id = area.country_id");
		return $this->db->get_where("restaurants", array("restaurants.id" => $id))->row();
	}

	public function show_images($id)
	{
		$this->db->select("*, concat('/plugins/images/Restaurant_images/', image) as image");
		return $this->db->get_where("restaurants_images", array("restaurant_id" => $id, "status" => 1))->result();
	}

	public function show_more_info($id)
	{
		return $this->db->get_where("more_infos", array("restaurant_id" => $id, "status" => 1))->result();
	}

	public function show_featured_offers($id)
	{
		$this->db->select('featured_offers.*, restaurants.name');
		$this->db->join('restaurants','restaurants.id = featured_offers.restaurant_id');
		$data =  $this->db->get_where("featured_offers", array("restaurant_id" => $id, "featured_offers.status" => 1))->result();
		foreach ($data as $bin=>$key)
		{
			$this->db->select('count(id) as count');
			$data[$bin]->quantity = $this->db->get_where("offers_click", array("offer_id" => $key->id))->row()->count ?? 0;
		}
		return $data;
	}

	public function show_hour_offers($id)
	{
		$this->db->select('hour_offers.*, restaurants.name');
		$this->db->join('restaurants','restaurants.id = hour_offers.restaurant_id');
		$data =$this->db->get_where("hour_offers", array("restaurant_id" => $id, "hour_offers.status" => 1))->result();
		foreach ($data as $bin=>$key)
		{
			$this->db->select('count(id) as count');
			$data[$bin]->quantity = $this->db->get_where("offers_click", array("offer_id" => $key->id))->row()->count ?? 0;
		}
		return $data;
	}

	public function show_menus($id)
	{
		return $this->db->get_where("menus", array("restaurant_id" => $id, "status" => 1))->result();
	}

	public function show_menu_images($id)
	{
		return $this->db->get_where("menu_images", array("restaurant_id" => $id))->result();
	}

	public function show_reviews($id)
	{
		$this->db->select("reviews.*, users.first_name, users.last_name, users.id as user_id, users.image");
		$this->db->join('users', 'users.id = reviews.user_id');
		return $this->db->get_where("reviews", array("restaurant_id" => $id))->result();
	}

	public function show_weeks($id)
	{
		$this->db->join('weeks', 'weeks.day_id = restaurant_weeks.day');
		return $this->db->get_where("restaurant_weeks", array("restaurant_id" => $id))->result();
	}

	public function show_restaurant_rate($id)
	{
		$this->db->select("
		CASE WHEN ROUND(AVG(overall),1) IS NULL THEN 0 ELSE ROUND(AVG(overall),1) END AS overall,
		CASE WHEN ROUND(AVG(taste),1) IS NULL THEN 0 ELSE ROUND(AVG(taste),1) END AS taste,
		CASE WHEN ROUND(AVG(charcoal),1) IS NULL THEN 0 ELSE ROUND(AVG(charcoal),1) END AS charcoal,
		CASE WHEN ROUND(AVG(cleanliness),1) IS NULL THEN 0 ELSE ROUND(AVG(cleanliness),1) END AS cleanliness,
		CASE WHEN ROUND(AVG(staff),1) IS NULL THEN 0 ELSE ROUND(AVG(staff),1) END AS staff,
		CASE WHEN ROUND(AVG(value_for_money),1) IS NULL THEN 0 ELSE ROUND(AVG(value_for_money),1) END AS value_for_money,
		");
		$this->db->where("restaurant_id", $id);
		return $this->db->get("rates")->row();
	}

	public function show_plans($id)
	{
		return $this->db->get_where("res_plans", array("restaurant_id" => $id))->result();
	}

	public function get_admins($id)
	{
		$admin_id = $this->db->get_where("restaurants", array("id" => $id))->row()->admin_id;
		$admin = $this->db->get_where("admins", array("id" => $admin_id))->row();
		return $admin;
	}

}

