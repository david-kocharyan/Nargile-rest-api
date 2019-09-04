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
		return $this->db->get($this->table)->result();
	}

	public function SelectById($id)
	{
		return $this->db->get_where($this->table, array("id" => $id))->row();
	}

	public function insert($data)
	{
		$this->db->insert($this->table, $data);
	}

	public function delete($id)
	{
		$this->db->delete($this->table, array('id' => $id));
	}


}
