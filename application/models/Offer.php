<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Offer extends CI_Model
{
	function __construct()
	{
		parent:: __construct();
	}

//	select
	public function select_featured()
	{
		$this->db->select('featured_offers.*, restaurants.name');
		$this->db->join('restaurants','restaurants.id = featured_offers.restaurant_id');
		$this->db->order_by("featured_offers.id DESC");
		$data =  $this->db->get_where("featured_offers", array("featured_offers.status" => 1))->result();
		foreach ($data as $bin=>$key)
		{
			$this->db->select('count(id) as count');
			$data[$bin]->quantity = $this->db->get_where("offers_click", array("offer_id" => $key->id))->row()->count ?? 0;
		}
		return $data;
	}

	public function select_hour()
	{
		$this->db->select('hour_offers.*, restaurants.name');
		$this->db->join('restaurants','restaurants.id = hour_offers.restaurant_id');
		$this->db->order_by("hour_offers.id DESC");
		$data =$this->db->get_where("hour_offers", array("hour_offers.status" => 1))->result();
		foreach ($data as $bin=>$key)
		{
			$this->db->select('count(id) as count');
			$data[$bin]->quantity = $this->db->get_where("offers_click", array("offer_id" => $key->id))->row()->count ?? 0;
		}
		return $data;
	}

	public function select_coins()
	{
		$this->db->select("coin_offers.*, restaurants.name, regions.name as reg_name");
		$this->db->join("restaurants", 'restaurants.id = coin_offers.restaurant_id');
		$this->db->join('regions', 'regions.id = coin_offers.region', 'left');
		$this->db->order_by("coin_offers.id DESC");
		$data = $this->db->get("coin_offers")->result();
		return $data;
	}

//	change status
	public function changeStatusFeatured($id)
	{
		$table = "featured_offers";

		$data = $this->db->get_where($table, ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update($table, array("status" => $status), ['id' => $id]);
	}

	public function changeStatusHour($id)
	{
		$table = "hour_offers";

		$data = $this->db->get_where($table, ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update($table, array("status" => $status), ['id' => $id]);
	}

	public function changeStatusCoins($id)
	{
		$table = "coin_offers";

		$data = $this->db->get_where($table, ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update($table, array("status" => $status), ['id' => $id]);
	}
}
