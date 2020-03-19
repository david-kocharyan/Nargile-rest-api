<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Slider extends CI_Model
{
	private $table = 'sliders';

	function __construct()
	{
		parent:: __construct();
	}

	public function selectAll()
	{
		$this->db->select('sliders.*, admins.first_name, admins.last_name, regions.name as region_name, restaurants.name as res_name');
		$this->db->join('admins', 'admins.id = sliders.client_id', 'left');
		$this->db->join("regions", "regions.id = sliders.region_id", "left");
		$this->db->join("restaurants", "restaurants.id = sliders.restaurant_id", "left");
		return $this->db->get($this->table)->result();
	}

	public function selectAllArea()
	{
		$this->db->select("area.id, area.status as area_status, area.name as area_name, countries.id as country_id, countries.name as country_name ");
		$this->db->join("countries", "countries.id = area.country_id", "left");
		return $this->db->get_where('area', array('countries.status' => 1 ))->result();
	}

	public function get_regions()
	{
		return $this->db->get_where('regions', array("status" => 1 ))->result();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
	}

	public function selectById($id)
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
