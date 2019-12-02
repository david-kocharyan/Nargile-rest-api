<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Loyalty_card extends CI_Model
{
	private $table = 'loyalty_card';

	function __construct()
	{
		parent:: __construct();
	}

	public function select()
	{
		return $this->db->get($this->table)->result();
	}

	public function selectById($id)
	{
		return $this->db->get_where($this->table, array("id" => $id))->row();
	}

	public function insert($data)
	{
		return $this->db->insert($this->table, $data);
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

	public function update($data, $id)
	{
		$this->db->update($this->table, $data, ["id" => $id]);
	}



}
