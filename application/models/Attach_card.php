<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Attach_card extends CI_Model
{
	private $table = 'user_loyalty_card';

	function __construct()
	{
		parent:: __construct();
	}

	public function select()
	{
		$this->db->select('user_loyalty_card.id as id, user_loyalty_card.status as status, users.username, loyalty_card.desc, loyalty_card.percent');
		$this->db->join('users', 'users.id = user_loyalty_card.user_id');
		$this->db->join('loyalty_card', 'loyalty_card.id = user_loyalty_card.card_id');
		return $this->db->get($this->table)->result();
	}

	public function my_loyalty($id)
	{
		$this->db->select('loyalty_card.*');
		$this->db->join('restaurants', 'restaurants.id = loyalty_card.res_id');
		return $this->db->get_where('loyalty_card', array("admin_id" => $id))->result();
	}

	public function all_users()
	{
		return $this->db->get_where('users', array("verify" => 1))->result();
	}


	public function insert($data)
	{
		return $this->db->insert($this->table, $data);
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

	public function selectById($id)
	{
		return $this->db->get_where($this->table, array("user_loyalty_card.id" => $id))->row();
	}

	public function update($data, $id)
	{
		$this->db->update($this->table, $data, ["id" => $id]);
	}
}
