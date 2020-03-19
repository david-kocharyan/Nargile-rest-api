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
		$this->db->select('coin_offers.*, regions.name as reg_name');
		$this->db->join('regions', 'regions.id = coin_offers.region', 'left');
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
		$this->db->select('coin_offers.*, restaurants.name, regions.name as reg_name');
		$this->db->join('restaurants', 'restaurants.id = coin_offers.restaurant_id');
		$this->db->join('regions', 'regions.id = coin_offers.region', 'left');
		return $this->db->get_where($this->table, array('coin_offers.status' => 2))->result();
	}

	public function approve_coin($id)
	{
		$this->db->set('status', 1);
		$this->db->where('id', $id);
		$this->db->update($this->table);
	}

//	other offers
	public function select_featured()
	{
		$this->db->select('featured_offers.*, restaurants.name, regions.name as reg_name');
		$this->db->join('restaurants', 'restaurants.id = featured_offers.restaurant_id');
		$this->db->join('regions', 'regions.id = featured_offers.region', 'left');
		return $this->db->get_where('featured_offers', array('featured_offers.status' => 2))->result();
	}

	public function approve_featured($id)
	{
		$this->db->set('status', 1);
		$this->db->where('id', $id);
		$this->db->update('featured_offers');
	}

//	---------------
	public function select_hour()
	{
		$this->db->select('hour_offers.*, restaurants.name, regions.name as reg_name');
		$this->db->join('restaurants', 'restaurants.id = hour_offers.restaurant_id');
		$this->db->join('regions', 'regions.id = hour_offers.region', 'left');
		return $this->db->get_where('hour_offers', array('hour_offers.status' => 2))->result();
	}

	public function approve_hour($id)
	{
		$this->db->set('status', 1);
		$this->db->where('id', $id);
		$this->db->update('hour_offers');
	}


}
