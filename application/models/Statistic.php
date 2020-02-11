<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Statistic extends CI_Model
{
	function __construct()
	{
		parent:: __construct();
	}

	public function my_restaurants($id)
	{
		$this->db->select("restaurants.id, restaurants.name");
		$data = $this->db->get_where("restaurants", array("admin_id" => $id, 'status' => 1))->result();
		return $data != NULL ? $data : array();
	}

//	owner chart
	public function users_count()
	{
		$this->db->select("count(id) as count");
		return $this->db->get_where("users", array("verify" => 1))->row();
	}

	public function favorite($id)
	{
		$this->db->select("count(id) as favorite");
		return $this->db->get_where('favorites', array("restaurant_id" => $id, 'status' => 1))->row();
	}

	public function share($id)
	{
		$this->db->select("count(id) as share");
		return $this->db->get_where('notification', array("action_id" => $id, 'click_action' => "share_request"))->row();
	}

	public function rate($id)
	{
		$this->db->select("count(id) as rate_count");
		return $this->db->get_where('rates', array("restaurant_id" => $id))->row();
	}

	public function reviews($id)
	{
		$this->db->select("count(id) as review");
		return $this->db->get_where('reviews', array("restaurant_id" => $id))->row();
	}

	public function restaurant_rate($id)
	{
		$this->db->select("AVG(overall) as overall, AVG(taste) as taste, AVG(charcoal) as charcoal,
		 AVG(cleanliness) as cleanliness, AVG(staff) as staff, AVG(value_for_money) as value_for_money");
		return $this->db->get_where('rates', array('restaurant_id' => $id))->row();
	}

	public function review_by_gender($id = null)
	{
		$this->db->select("*");
		$this->db->join('users', 'reviews.user_id = users.id');
		if ($id != null || $id != "") $this->db->where('reviews.restaurant_id', $id);
		$this->db->group_by('reviews.user_id');
		$rate_by_gender = $this->db->get_where('reviews')->result();
		$male = 0;
		$female = 0;
		foreach ($rate_by_gender as $key => $value) {
			if ($value->gender == 1) {
				$male = $male + 1;
			} elseif ($value->gender == 0) {
				$female = $female + 1;
			}
		}
		$data = array(
			'male' => $male,
			'female' => $female,
		);
		return $data;
	}

	public function rate_by_age($id = null)
	{
		$this->db->select("FLOOR (DATEDIFF(CURDATE(),FROM_UNIXTIME(date_of_birth, '%Y-%m-%d'))/365) as age");
		$this->db->join('users', 'rates.user_id = users.id');
		if ($id != null || $id != "") $this->db->where('rates.restaurant_id', $id);
		$this->db->group_by('rates.user_id');
		$rate_by_age = $this->db->get_where('rates', array('users.verify' => 1))->result();
		return $rate_by_age;
	}

	public function rate_by_gender($id = null){
		$this->db->select("gender");
		$this->db->join('users', 'rates.user_id = users.id');
		if ($id != null || $id != "") $this->db->where('rates.restaurant_id', $id);
		$this->db->group_by('rates.user_id');
		$rate_by_gender = $this->db->get_where('rates', array('users.verify' => 1))->result();

		$male = 0; $female = 0;
		foreach ($rate_by_gender as $key=>$value){
			if ($value->gender == 1){
				$male = $male + 1;
			}else{
				$female = $female + 1;
			}
		}
		$data =  array(
			'male' => $male,
			'female' => $female,
		);
		return $data;
	}

	public function first_page($id = null)
	{
		$this->db->select("type");
		$offers = $this->db->get_where('offers_click', array("restaurant_id" => $id))->result();

		$featured = 0; $nearest = 0; $top = 0; $hour = 0;
		foreach ($offers as $key=>$value){
			if ($value->type == 1){
				$hour = $hour + 1;
			}elseif($value->type == 0){
				$featured = $featured + 1;
			}
			elseif($value->type == 2){
				$nearest = $nearest + 1;
			}
			elseif($value->type == 3){
				$top = $top + 1;
			}
		}
		$data = array(
			'hour' => $hour,
			'featured' => $featured,
			'nearest' => $nearest,
			'top' => $top,
		);
		return $data;
	}

	public function res_click($id = null)
	{
		$this->db->select("type");
		$offers = $this->db->get_where('restaurant_click', array("restaurant_id" => $id))->result();

		$menu = 0; $direction = 0; $review = 0; $call = 0;
		foreach ($offers as $key=>$value){
			if ($value->type == 1){
				$direction = $direction + 1;
			}elseif($value->type == 0){
				$menu = $menu + 1;
			}
			elseif($value->type == 2){
				$review = $review + 1;
			}
			elseif($value->type == 3){
				$call = $call + 1;
			}
		}
		$data = array(
			'menu' => $menu,
			'direction' => $direction,
			'review' => $review,
			'call' => $call,
		);
		return $data;
	}

	public function gender_all()
	{
		$this->db->select("gender");
		$gender_all = $this->db->get_where('users', array("verify" => 1))->result();

		$male = 0;
		$female = 0;
		foreach ($gender_all as $key=>$value){
			if ($value->gender == 1){
				$male = $male + 1;
			}else{
				$female = $female + 1;
			}
		}
		$data = array(
			'male' => $male,
			'female' => $female,
		);
		return $data;
	}













//	super admin chart
	public function all_users_count()
	{
		$this->db->select("count(id) as count");
		$data = $this->db->get_where("users", array("verify" => 1))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_restaurant_count()
	{
		$this->db->select("count(id) as count");
		$data = $this->db->get("restaurants")->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_share_count()
	{
		$this->db->select("count(notification.id) as count");
		$data = $this->db->get_where("notification", array("notification.click_action" => 'share_request'))->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_reviews_count()
	{
		$this->db->select("count(reviews.id) as count");
		$data = $this->db->get_where("reviews")->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_rates_count()
	{
		$this->db->select("count(rates.id) as count");
		$data = $this->db->get("rates")->row();
		return $data != NULL ? $data->count : 0;
	}

	public function all_restaurants()
	{
		$this->db->select("restaurants.id, restaurants.name");
		$data = $this->db->get_where("restaurants", array('status' => 1))->result();
		return $data != NULL ? $data : array();
	}


}
