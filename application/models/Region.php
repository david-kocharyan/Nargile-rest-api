<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Region extends CI_Model
{
	private $table = 'regions';

	function __construct()
	{
		parent:: __construct();
	}

	public function selectAll()
	{
		return $this->db->get($this->table)->result();
	}

	public function insert_region($name)
	{
		$this->db->insert($this->table, array("name" => $name));
		$insert_id = $this->db->insert_id();
		return $insert_id;
	}

	public function insert_coordinate($data)
	{
		$this->db->insert("regions_coordinates", $data);
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

	public function select_by_id($id)
	{
		return $this->db->get_where('regions', array('id' => $id))->row();
	}

	public function select_coordinates($id)
	{
		return $this->db->get_where('regions_coordinates', array('region_id' => $id))->result();
	}

}
