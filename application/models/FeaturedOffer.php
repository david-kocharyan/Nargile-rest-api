<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class FeaturedOffer extends CI_Model
{
	private $table = 'featured_offers';

	function __construct()
	{
		parent:: __construct();
	}

	public function selectAll($id)
	{
		$this->db->select('featured_offers.*, regions.name as reg_name');
		$this->db->join('regions','regions.id = featured_offers.region', 'left');
		return $this->db->get_where($this->table, array('restaurant_id' => $id))->result();
	}

	public function select($id)
	{
		$this->db->select('featured_offers.*, regions.name as reg_name');
		$this->db->join('regions','regions.id = featured_offers.region', 'left');
		return $this->db->get_where($this->table, array('featured_offers.id' => $id))->row();
	}

	public function update($id, $data)
	{
		$this->db->update($this->table, $data, ["id" => $id]);
	}


}
