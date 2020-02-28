<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class CoinOffer extends CI_Model
{
	private $table = 'coin_offers';

	function __construct()
	{
		parent:: __construct();
	}

	public function selectAll($id)
	{
		return $this->db->get_where($this->table, array('restaurant_id' => $id))->result();
	}

	public function select($id)
	{
		return $this->db->get_where($this->table, array('id' => $id))->row();
	}

	public function update($id, $data)
	{
		$this->db->update($this->table, $data, ["id" => $id]);
	}

	public function select_pending_offer()
	{
		$this->db->select('coin_offers.*, restaurants.name');
		$this->db->join('restaurants', 'restaurants.id = coin_offers.restaurant_id');
		return $this->db->get_where($this->table, array('coin_offers.status' => 2))->result();
	}

	public function approve_coin($id)
	{
		$this->db->set('status', 1);
		$this->db->where('id', $id);
		$this->db->update($this->table);
	}


}
