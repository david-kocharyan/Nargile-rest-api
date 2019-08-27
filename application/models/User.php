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
	}

//	check username for unique
	public function check_username($username)
	{
		$this->db->select("*");
		$this->db->from($this->table);
		$this->db->where("username", $username);
		$checkUsername = $this->db->get()->row();
		if ($checkUsername != NULL) {
			return false;
		}
		return true;
	}

//	selectAll data from users table
	public function selectAll()
	{
		return $this->db->get($this->table)->result();
	}

//	login
	public function login($username, $password)
	{
		$getUser = $this->db->get_where($this->table, ["username" => $username])->row();
		if (!$getUser) return false;

		$password = hash("SHA512", $password);
		if ($password == $getUser->password) return $getUser;
		return false;
	}

}
