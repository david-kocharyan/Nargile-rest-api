<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admins extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user'))) {
			redirect('/admin/login');
		}
		$this->load->model("Admin");
	}

	public function index()
	{
		$this->load->model("Statistic");

//		check user type
		if ($this->session->userdata('user')['role'] != 'superAdmin') redirect('admin/home');

		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Home";

		$data['widget'] = array(
			'users' => $this->Statistic->all_users_count(),
			'restaurant' => $this->Statistic->all_restaurant_count(),
			'share' => $this->Statistic->all_share_count(),
			'reviews' => $this->Statistic->all_reviews_count(),
			'rates' => $this->Statistic->all_rates_count(),
		);
		$data['restaurants'] = $this->Statistic->all_restaurants();


		$this->db->select('name, lat ,lng');
		$map_res = $this->db->get_where('restaurants', array('status' => 1))->result();

		$map = array();
		foreach ($map_res as $key => $val){
			$v = array();
			$v[] = $val->name;
			$v[] = floatval($val->lat);
			$v[] = floatval($val->lng);
			$v[] = 2;
			$map[] = $v;
		}
		$data['restaurants_map'] = $map != NULL ? json_encode($map) : array();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('admin/home.php');
		$this->load->view('layouts/footer.php');
	}

//	super admin profile and settings
	public function profile()
	{
		$data['user'] = $this->session->userdata('user');
		$data['admin'] = $this->Admin->getClientById($data['user']["user_id"]);
		$data['title'] = "Admin Profile";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('admin/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function settings()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Admin Settings";
		$data['admin'] = $this->Admin->getClientById($data['user']["user_id"]);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('admin/edit.php');
		$this->load->view('layouts/footer.php');
	}

	public function update($id)
	{
		$user = $this->Admin->getClientById($id);

		$username = $this->input->post('username');
		$first_name = $this->input->post('first_name');
		$last_name = $this->input->post('last_name');
		$email = $this->input->post('email');

		$def_username = $user->username;
		$def_email = $user->email;

		if ($def_username != $username) {
			$this->form_validation->set_rules('username', 'Username', 'required|trim|max_length[30]|is_unique[admins.username]');
		}
		if ($def_email != $email) {
			$this->form_validation->set_rules('email', 'Email', 'required|trim|is_unique[admins.email]');
		}
		$this->form_validation->set_rules('first_name', 'Full Name', 'required|trim');
		$this->form_validation->set_rules('last_name', 'Full Name', 'required|trim');


		if ($this->form_validation->run() == FALSE) {
			$this->settings();
		} else {
			if (!empty($_FILES['logo']['name']) || null != $_FILES['logo']['name']) {
				unlink(FCPATH . "/plugins/images/Logo/" . $user->logo);
				unlink(FCPATH . "/plugins/thumb_images/Logo/Thumb_" . $user->logo);

				$image = $this->uploadImage('logo');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->settings();
					return;
				}
				$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			}

			$admin = array(
				'username' => $username,
				'first_name' => $first_name,
				'last_name' => $last_name,
				'email' => $email,
			);
			if (isset($logo)) $admin['logo'] = $logo;

			$this->Admin->update($id, $admin);

			$this->session->set_flashdata('success', 'You have change the clients successfully');
			redirect("admin/profile");
		}
	}

	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Logo")) {
			mkdir(FCPATH . "/plugins/images/Logo", 0755, true);
		}

		if (!is_dir(FCPATH . "/plugins/thumb_images/Logo")) {
			mkdir(FCPATH . "/plugins/thumb_images/Logo", 0755, true);
		}

		$path = FCPATH . "/plugins/images/Logo";
		$config['upload_path'] = $path;
		$config['file_name'] = 'Logo_' . time() . '_' . rand();
		$config['allowed_types'] = 'jpg|png|jpeg';
		$config['max_size'] = 100000;
		$this->load->library('upload', $config);

		if (!$this->upload->do_upload($image)) {
			$errorStrings = strip_tags($this->upload->display_errors());
			$error = array('error' => $errorStrings, 'image' => $image);
			return $error;
		} else {
			$uploadedImage = $this->upload->data();
			$this->resizeImage($uploadedImage['file_name'], $path);

			$data = array('data' => $uploadedImage);
			return $data;
		}
	}

	private function resizeImage($filename, $path)
	{
		$source_path = $path . "/" . $filename;
		$target_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 800,
			'height' => 800,
		);
		$this->load->library('image_lib');
		$this->image_lib->initialize($config_manip);

		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();

//		second thumb resize
		$source_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => FCPATH . "/plugins/thumb_images/Logo/" . "Thumb_" . $filename,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 300,
			'height' => 300,
		);

		$this->image_lib->initialize($config_manip);
		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}

	private function randomPassword()
	{
		$alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
		$pass = array();
		$alphaLength = strlen($alphabet) - 1;
		for ($i = 0; $i < 8; $i++) {
			$n = rand(0, $alphaLength);
			$pass[] = $alphabet[$n];
		}
		return implode($pass);
	}

//	users list
	public function users_list()
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Users List";

		$this->db->select('username, first_name, last_name, DATE_FORMAT(DATE_ADD(FROM_UNIXTIME(0), interval date_of_birth second),"%Y-%m-%d") as date_of_birth, mobile_number, email, coins, concat("/plugins/images/Logo/", image) as image');
		$data['users'] = $this->db->get_where('users', array('verify' => 1))->result();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('users/index.php');
		$this->load->view('layouts/footer.php');
	}

//	create update or change owner part and request
	public function owner_request()
	{
//		check user type
		if ($this->session->userdata('user')['role'] != 'superAdmin') redirect('admin/home');

		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Home";

		$this->db->select("claim_your_business.*, restaurants.name as restaurant_name");
		$this->db->join('restaurants', 'restaurants.id =  claim_your_business.restaurant_id');
		$this->db->where('claim_your_business.status != ', 2);
		$this->db->order_by('id', 'DESC');
		$data['business'] = $this->db->get('claim_your_business')->result();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('admin/owner_index.php');
		$this->load->view('layouts/footer.php');
	}

	public function change_status($id)
	{
		//	check user type
		if ($this->session->userdata('user')['role'] != 'superAdmin') redirect('404');

		$data = $this->db->get_where('claim_your_business', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('claim_your_business', array("status" => $status), ['id' => $id]);
		redirect("admin/owner-request");
	}

	public function create_owner($id)
	{
		//	check user type
		if ($this->session->userdata('user')['role'] != 'superAdmin') redirect('404');

		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Home";
		$data['restaurants'] = $this->db->get('restaurants')->result();

		$this->db->select("claim_your_business.*, restaurants.id as restaurant_id");
		$this->db->join('restaurants', 'restaurants.id =  claim_your_business.restaurant_id');
		$owner = $this->db->get_where('claim_your_business', ["claim_your_business.id" => $id])->row();
		$data['owner'] = $owner;
		$data['owner']->password = $this->randomPassword();

		$admin = $this->db->get_where('admins', ["email" => $owner->email])->row();

		if ($admin != NULL) {
			$this->db->trans_start();

			$this->db->set('admin_id', $admin->id);
			$this->db->where('restaurants.id', $owner->restaurant_id);
			$this->db->update('restaurants');

			$this->db->set('status', 2);
			$this->db->where('id', $owner->id);
			$this->db->update('claim_your_business');

			$this->db->trans_complete();
			redirect("admin/owner-request");
			return;
		}
		$this->load->view('layouts/header.php', $data);
		$this->load->view('admin/owner/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store_owner($id)
	{
		//	check user type
		if ($this->session->userdata('user')['role'] != 'superAdmin') redirect('404');

		$username = $this->input->post('username');
		$first_name = $this->input->post('first_name');
		$last_name = $this->input->post('last_name');
		$email = $this->input->post('email');
		$mobile_number = $this->input->post('mobile_number');
		$password = $this->input->post('password');
		$restaurant = $this->input->post('restaurant');
		$logo = 'User_default.png';

		$this->form_validation->set_rules('username', 'Username', 'required|trim|max_length[30]|is_unique[admins.username]');
		$this->form_validation->set_rules('first_name', 'First name', 'required|trim|regex_match[/^([a-z ])+$/i]');
		$this->form_validation->set_rules('last_name', 'Last name', 'required|trim|regex_match[/^([a-z ])+$/i]');
		$this->form_validation->set_rules('email', 'Email', 'required|trim|is_unique[admins.email]');
		$this->form_validation->set_rules('mobile_number', 'Mobile Number', 'required|trim|is_unique[admins.mobile_number]');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]');

		if ($this->form_validation->run() == FALSE) {
			$this->create_owner($id);
		} else {
			$password = hash("sha512", $password);
			$user = array(
				'username' => $username,
				'first_name' => $first_name,
				'last_name' => $last_name,
				'email' => $email,
				'mobile_number' => $mobile_number,
				'role' => 'admin',
				'password' => $password,
				'active' => 1,
				'logo' => $logo,
			);


			$this->db->trans_start();

			$this->db->insert('admins', $user);
			$last_id = $this->db->insert_id();

			$this->db->set('admin_id', $last_id);
			$this->db->where('restaurants.id', $restaurant);
			$this->db->update('restaurants');

			$this->db->set('status', 2);
			$this->db->where('id', $id);
			$this->db->update('claim_your_business');

			$this->db->trans_complete();

			$this->session->set_flashdata('success', 'You have stored the clients successfully');
			redirect("admin/owner-request");
		}
	}


//	admin dashboard statistics page
	public function owner_index()
	{
		$this->load->model("Statistic");

		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Home";

		$data['widget'] = array(
			'users' => $this->Statistic->users_count(),
			'restaurant' => $this->Statistic->restaurant_count($data['user']['user_id']),
			'share' => $this->Statistic->share_count($data['user']['user_id']),
			'reviews' => $this->Statistic->reviews_count($data['user']['user_id']),
			'rates' => $this->Statistic->rates_count($data['user']['user_id']),
		);
		$data['restaurants'] = $this->Statistic->my_restaurants($data['user']['user_id']);

		$this->load->view('layouts/header.php', $data);
		$this->load->view('admin/owner/home.php');
		$this->load->view('layouts/footer.php');
	}

	public function owner_chart()
	{
		$id = $this->input->post('id');

		$data['plans'] = $this->db->get_where('res_plans', array('status' => 1, 'restaurant_id' => $id))->row();

//		restaurant rate
		$this->db->select("AVG(overall) as overall, AVG(taste) as taste, AVG(charcoal) as charcoal,
		 AVG(cleanliness) as cleanliness, AVG(staff) as staff, AVG(value_for_money) as value_for_money");
		$rate = $this->db->get('rates')->row();
		$data['rate'] = $rate;

//		rate by age
		$this->db->select("FLOOR (DATEDIFF(CURDATE(),FROM_UNIXTIME(date_of_birth, '%Y-%m-%d'))/365) as age");
		$this->db->join('users', 'rates.user_id = users.id');
		$this->db->group_by('rates.user_id');
		$rate_by_age = $this->db->get_where('rates', array('users.verify' => 1))->result();
		$data['rate_by_age'] = $rate_by_age;

//		rate by gender
		$this->db->select("gender");
		$this->db->join('users', 'rates.user_id = users.id');
		$this->db->group_by('rates.user_id');
		$rate_by_gender = $this->db->get_where('rates', array('users.verify' => 1))->result();

		$male = 0;
		$female = 0;
		foreach ($rate_by_gender as $key=>$value){
			if ($value->gender == 1){
				$male = $male + 1;
			}else{
				$female = $female + 1;
			}
		}
		$data['rate_by_gender'] = array(
			'male' => $male,
			'female' => $female,
		);

//		reviews by gender
		$this->db->select("gender");
		$this->db->join('users', 'reviews.user_id = users.id');
		$this->db->group_by('reviews.user_id');
		$rate_by_gender = $this->db->get_where('reviews', array('users.verify' => 1))->result();

		$male = 0;
		$female = 0;
		foreach ($rate_by_gender as $key=>$value){
			if ($value->gender == 1){
				$male = $male + 1;
			}else{
				$female = $female + 1;
			}
		}
		$data['review_by_gender'] = array(
			'male' => $male,
			'female' => $female,
		);

//		vor res admin///////////////////////////////////////////////////////////////////////////////
//		total favorite
		$this->db->select("count(id) as favorite");
		$favorite = $this->db->get_where('favorites', array("restaurant_id" => $id, 'status' => 1))->row();
		$data['favorite'] = $favorite->favorite;

//		total share
		$this->db->select("count(id) as share");
		$share = $this->db->get_where('notification', array("action_id" => $id, 'click_action' => "share_request"))->row();
		$data['share'] = $share->share;

//		total rate
		$this->db->select("count(id) as rate_count");
		$rate = $this->db->get_where('rates', array("restaurant_id" => $id))->row();
		$data['rate_count'] = $rate->rate_count;

//		total reviews
		$this->db->select("count(id) as review");
		$review = $this->db->get_where('reviews', array("restaurant_id" => $id))->row();
		$data['review_count'] = $review->review;

//		total users
		$this->db->select("count(id) as count");
		$users = $this->db->get_where("users", array("verify" => 1))->row();
		$data['all_users'] = $users->count;

//		click on offers
		$this->db->select("type");
		$offers = $this->db->get_where('offers_click', array("restaurant_id" => $id))->result();

		$featured = 0;
		$hour = 0;
		foreach ($offers as $key=>$value){
			if ($value->type == 1){
				$hour = $hour + 1;
			}else{
				$featured = $featured + 1;
			}
		}
		$data['offers'] = array(
			'hour' => $hour,
			'featured' => $featured,
		);
//		vor res admin end///////////////////////////////////////////////////////////////////////////////

//		all users gender
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
		$data['gender_all'] = array(
			'male' => $male,
			'female' => $female,
		);

		$this->output->set_output(json_encode($data, JSON_PRETTY_PRINT))->_display();
		exit;
	}


}
