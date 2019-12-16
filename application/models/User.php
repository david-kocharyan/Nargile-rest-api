<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Model
{

	private $table = 'users';

	function __construct()
	{
		parent:: __construct();
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
		} elseif ($checkPartialReg != NULL) {
			return 'partial';
		}
		return 2;
	}

	public function check_partial()
	{
		$checkPartialReg = $this->db->get_where($this->table, ["username" => $username, "verify" => 0])->row();

		if ($checkPartialReg != NULL){
			return 1;
		}
		else{
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

}
