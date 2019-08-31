<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Offer extends CI_Model
{
	private $table = 'offers';

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
		$this->db->select("offers.*, restaurants.name as restaurant_name");
        $this->db->join("restaurants", "restaurants.id = offers.restaurant_id", "left");
        $this->db->join("area", "area.id = restaurants.area_id", "left");
        $this->db->join("countries", "countries.id = area.country_id", "left");
		$data = $this->db->get_where($this->table, array('area.status' => 1, 'countries.status' => 1, "restaurants.status" => 1))->result();
		return $data;
	}

	public function getRestaurants()
    {
        $this->db->select("restaurants.id, restaurants.name");
        $this->db->join("area", "area.id = restaurants.area_id", "left");
        $this->db->join("countries", "countries.id = area.country_id", "left");
        $data = $this->db->get_where('restaurants', array('area.status' => 1, 'countries.status' => 1, "restaurants.status" => 1))->result();
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

}
