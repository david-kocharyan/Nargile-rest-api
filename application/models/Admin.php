<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Model
{
	private $table = 'admins';

	function __construct()
	{
		parent:: __construct();
	}

//	check user autenticate
	public function authenticate($username, $password)  {
		$getUser = $this->db->get_where('admins',["username"=>$username])->row();
		if (!$getUser) return false;
		if (!$getUser->active) return false;

		$password_hash = hash("SHA512", $password);
		if ($password_hash == $getUser->password) return $getUser;
		return false;
	}


}
