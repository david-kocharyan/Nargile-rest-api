<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Model
{

	function __construct() {
		parent:: __construct();
		$this->table = 'users';
		$this->column_order = array(null, 'username', 'first_name','last_name','email','verify');
		$this->column_search = array('username', 'first_name','last_name','email','verify');
		$this->order = array('username' => 'asc');
	}

	public function getRows($postData){
		$this->_get_datatables_query($postData);
		if($postData['length'] != -1){
			$this->db->limit($postData['length'], $postData['start']);
		}





		return $this->db->get()->result();
	}

	public function countAll(){
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}

	public function countFiltered($postData){
		$this->_get_datatables_query($postData);
		$query = $this->db->get();
		return $query->num_rows();
	}

	private function _get_datatables_query($postData){
		$this->db->from($this->table);

		$i = 0;
		foreach($this->column_search as $item){
			// if datatable send POST for search
			if($postData['search']['value']){
				// first loop
				if($i===0){
					// open bracket
					$this->db->group_start();
					$this->db->like($item, $postData['search']['value']);
				}else{
					$this->db->or_like($item, $postData['search']['value']);
				}

				// last loop
				if(count($this->column_search) - 1 == $i){
					// close bracket
					$this->db->group_end();
				}
			}
			$i++;
		}

		if(isset($postData['order'])){
			$this->db->order_by($this->column_order[$postData['order']['0']['column']], $postData['order']['0']['dir']);
		}else if(isset($this->order)){
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}


































































































//	register
	public function register($data)
	{
		$this->db->insert($this->table, $data);
		$insert_id = $this->db->insert_id();

		return $insert_id;
	}

//	register
	public function register_update($data, $id)
	{
		$this->db->set($data);
		$this->db->where('id', $id);
		$this->db->update($this->table, $data);
	}

//	check username for unique
	public function check_unique($username, $mobile_number, $email)
	{
		$checkUsername = $this->db->get_where($this->table, ["username" => $username, "verify" => 1])->row();
		$checkMobile = $this->db->get_where($this->table, ["mobile_number" => $mobile_number, "verify" => 1])->row();
		$checkEmail = $this->db->get_where($this->table, ["email" => $email, "verify" => 1])->row();

		if ($checkUsername != NULL) {
			return 'username';
		} elseif ($checkMobile != NULL) {
			return 'mobile number';
		} elseif ($checkEmail != NULL) {
			return "email";
		}
		return 2;
	}

	public function check_partial($username)
	{
		$checkPartialReg = $this->db->get_where($this->table, ["username" => $username, "verify" => 0])->row();

		if ($checkPartialReg != NULL) {
			return 1;
		} else {
			return 0;
		}
	}

//	selectAll data from users table
	public function selectAll()
	{
		return $this->db->get($this->table)->result();
	}

//	login
	public function login($username, $password)
	{
		$getUser = $this->db->get_where($this->table, ["username" => $username, "verify" => 1])->row();
		if (!$getUser) return false;

		$password = hash("SHA512", $password);
		if ($password == $getUser->password) return $getUser;
		return false;
	}


//	for show
	public function favorite($id)
	{
		$this->db->select('count(id) as count');
		return $this->db->get_where('favorites', array('user_id' => $id))->row();
	}

	public function rate($id)
	{
		$this->db->select('count(id) as count');
		return $this->db->get_where('rates', array('user_id' => $id))->row();
	}

	public function review($id)
	{
		$this->db->select('count(id) as count');
		return $this->db->get_where('reviews', array('user_id' => $id))->row();
	}

	public function badges($id)
	{
		$this->db->select('COUNT("user_id") as count');
		$review = $this->db->get_where("reviews", array("user_id" => $id))->row();

		$this->db->select('COUNT("user_id") as count');
		$rate = $this->db->get_where("rates", array("user_id" => $id))->row();

		$count = $rate->count + $review->count;

		$this->db->select('count, type, info, concat("/plugins/images/Badge/", image) as image');
		$this->db->where(array('status' => 1, "count <" => $count));
		$data = $this->db->get('badges')->result();

		return $data != null ? $data : array();
	}


	public function friend($id)
	{
		$this->db->select('count(id) as count');
		$friend_1 = $this->db->get_where('friends', array('from_id' => $id))->row()->count;

		$this->db->select('count(id) as count');
		$friend_2 = $this->db->get_where('friends', array('from_id' => $id))->row()->count;

		return $friend_1 + $friend_2;
	}

	public function share($id)
	{
		$this->db->select('count(id) as count');
		return $this->db->get_where('notification', array('action_id' => $id, 'click_action' => 'share_request'))->row();
	}


}
