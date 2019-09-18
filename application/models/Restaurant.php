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
		return  $insert_id;
	}

	public function selectAll()
	{
		$this->db->select("restaurants.*, area.name as area_name, countries.name as country_name ");
		$this->db->join("area", "area.id = restaurants.area_id", "left");
		$this->db->join("countries", "countries.id = area.country_id", "left");
		$data = $this->db->get_where($this->table, array('area.status' => 1, 'countries.status' => 1))->result();
		return $data;
	}

	public function selectById($id)
	{
		$data = $this->db->get_where($this->table,["id" => $id])->row();
		return $data ;
	}


	public function select($id)
	{
		$data = $this->db->get_where($this->table,["id" => $id])->row();
		return $data ;
	}

	public function update($data, $id)
	{
		$this->db->update($this->table, $data, ["id" => $id]);
	}

	public function changeStatus($id)
	{
		$data = $this->db->get_where($this->table, ["id" => $id])->row();
		if(null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update($this->table, array("status" => $status), ['id' => $id] );
	}

//	show current restaurant data
	public function show($id)
	{
		$this->db->select("restaurants.name as restaurant_name, restaurants.id as restaurant_id, 
		area.name as area, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, 
		concat('/plugins/thumb_images/Restaurants/Thumb_', restaurants.logo) as thumb, lat, lng, rate, address");
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
		return $this->db->get_where("featured_offers", array("restaurant_id" => $id, "status" => 1))->result();
	}

	public function show_hour_offers($id)
	{
		return $this->db->get_where("hour_offers", array("restaurant_id" => $id, "status" => 1))->result();
	}

	public function show_menus($id)
	{
		return $this->db->get_where("menus", array("restaurant_id" => $id, "status" => 1))->result();
	}

	public function show_reviews($id)
	{
		return $this->db->get_where("reviews", array("restaurant_id" => $id))->result();
	}

}

