<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Video extends CI_Model
{

	function __construct()
	{
		parent:: __construct();
		$this->table = 'video';
	}

	public function select()
	{
		$this->db->select('video.*, restaurants.name as res_name, countries.name as country_name, regions.name as region_name');
		$this->db->join('restaurants', 'video.restaurant_id = restaurants.id');
		$this->db->join('regions', 'video.region_id = regions.id');
		$this->db->join('countries', 'video.country_id = countries.id');
		return $this->db->get('video')->result();
	}

	public function select_video($id)
	{
		return $this->db->get_where('video', array("id" => $id))->row();
	}


	public function get_restaurant()
	{
		return $this->db->get_where('restaurants', array('status' => 1))->result();
	}

	public function get_regions()
	{
		return $this->db->get_where('regions', array("status" => 1 ))->result();
	}

	public function get_country()
	{
		return $this->db->get_where('countries', array("status" => 1 ))->result();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
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
