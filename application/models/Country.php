<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Country extends CI_Model
{
	private $table = 'countries';

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
		$data = $this->db->get($this->table)->result();
		return $data;
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

	public function delete($id)
	{
		$this->db->delete($this->table, array('id' => $id));
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
