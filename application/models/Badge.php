<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Badge extends CI_Model
{
	private $table = 'badges';

	function __construct()
	{
		parent:: __construct();
	}

	public function selectAll()
	{
		return $this->db->get($this->table)->result();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
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

	public function select($id)
	{
		$data = $this->db->get_where($this->table,["id" => $id])->row();
		return $data ;
	}

	public function update($data, $id)
	{
		$this->db->update($this->table, $data, ["id" => $id]);
	}

}
