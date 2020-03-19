<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Restaurants extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user'))) {
			redirect('/admin/login');
		}
		$this->load->model("Restaurant");
		$this->load->model("Statistic");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$type = $this->check_admin();
		if ($type == 2) {
			$data['restaurants'] = $this->Restaurant->selectResForAdmin($data['user']['user_id']);
		} else {
			$data['restaurants'] = $this->Restaurant->selectAll();
		}

		foreach ($data['restaurants'] as $bin => $key) {
			$data['restaurants'][$bin]->region_name = $this->get_region($key->lat, $key->lng);
			$data['restaurants'][$bin]->admin = $this->Restaurant->get_admins($key->id) ?? array();

			$data['restaurants'][$bin]->favorite = $this->Statistic->favorite($key->id)->favorite;
			$data['restaurants'][$bin]->share = $this->Statistic->share($key->id)->share;
			$data['restaurants'][$bin]->rate_count = $this->Statistic->rate($key->id)->rate_count;
			$data['restaurants'][$bin]->review_count = $this->Statistic->reviews($key->id)->review;

			$data['restaurants'][$bin]->rate = $this->Statistic->restaurant_rate($key->id) ?? array();
			$data['restaurants'][$bin]->offers = $this->Statistic->first_page($key->id) ?? array();
			$data['restaurants'][$bin]->res_click = $this->Statistic->res_click($key->id) ?? array();
		}

		$data['title'] = "Restaurants";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function show($id)
	{
		$type = $this->check_admin_restaurant($id);

		$data['user'] = $this->session->userdata('user');
		$data['restaurant'] = $this->Restaurant->show($id);//+
		$data['images'] = $this->Restaurant->show_images($id);//+
		$data['more_info'] = $this->Restaurant->show_more_info($id);//+
		$data['featured'] = $this->Restaurant->show_featured_offers($id);//+
		$data['hour'] = $this->Restaurant->show_hour_offers($id);//+
		$data['menus'] = $this->Restaurant->show_menus($id);//+
		$data['menu_images'] = $this->Restaurant->show_menu_images($id);//+
		$data['reviews'] = $this->Restaurant->show_reviews($id);//+
		$data['weeks'] = $this->Restaurant->show_weeks($id);//+
		$data['rate'] = $this->Restaurant->show_restaurant_rate($id);//+
		$data['plans'] = $this->Restaurant->show_plans($id);//+
		$data['title'] = "Show Restaurant Data";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/show.php');
		$this->load->view('layouts/footer.php');
	}

	public function show_ajax()
	{
		$id = $this->input->post('id');
		$this->db->select("users.*, DATE_FORMAT(FROM_UNIXTIME(users.date_of_birth), '%d %M %Y') AS dob");
		$data = $this->db->get_where("users", array("id" => $id))->row();
		$this->output->set_output(json_encode($data, JSON_PRETTY_PRINT))->_display();
		exit;
	}

	public function create()
	{
		// check user type
		if ($this->session->userdata('user')['role'] != 'superAdmin') redirect('404');

		$data['user'] = $this->session->userdata('user');
		$this->load->model("Area");
		$data['area'] = $this->Area->selectAll();
		$data['owner'] = $this->db->get_where('admins', array('role' => 'admin', 'active' => 1))->result();
		$data['title'] = "Add Restaurant";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/create.php');
		$this->load->view('layouts/footer.php');
	}

	public function store()
	{
		// check user type
		if ($this->session->userdata('user')['role'] != 'superAdmin') redirect('404');

		$name = $this->input->post('name');
		$area = $this->input->post('area');
		$phone_number = $this->input->post('phone_number');
		$type = $this->input->post('type');
		$address = $this->input->post('address');
		$lat = $this->input->post('lat');
		$long = $this->input->post('long');
		$owner = $this->input->post('owner');
		$plan = $this->input->post('plan');
		$daterange = $this->input->post('daterange');

		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('area', 'Area', 'required');
		$this->form_validation->set_rules('phone_number', 'Phone Number', 'required');
		$this->form_validation->set_rules('type', 'Restaurant Type', 'required');
		$this->form_validation->set_rules('address', 'Address', 'required');
		$this->form_validation->set_rules('lat', 'Latitude', 'required');
		$this->form_validation->set_rules('long', 'Longitude', 'required');
		$this->form_validation->set_rules('plan', 'Plan', 'required');
		$this->form_validation->set_rules('daterange', 'Date', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->create();
		} else {
			if (!empty($_FILES['logo']['name']) || null != $_FILES['logo']['name']) {
				$image = $this->uploadImage('logo');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->create();
					return;
				}
				$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			} else {
				$this->session->set_flashdata('error', 'Image was required');
				$this->create();
				return;
			}

			$restaurant = array(
				'name' => $name,
				'area_id' => $area,
				'logo' => $logo,
				'phone_number' => $phone_number,
				'type' => $type,
				'address' => $address,
				'lat' => $lat,
				'lng' => $long,
				'status' => 1
			);
			$restaurant['admin_id'] = is_numeric($owner) ? $owner : NULL;

			$last_res_id = $this->Restaurant->insert($restaurant);
			if ($last_res_id) {
				$originalDate = explode(" - ", $daterange);
				$start = date("Y-m-d", strtotime($originalDate[0]));
				$finish = date("Y-m-d", strtotime($originalDate[1]));

				if ($plan == 1) {
					$data = array(
						'restaurant_id' => $last_res_id,
						'plan' => $plan,
						'start_date' => date('Y-m-d'),
						'finish_date' => null,
						'status' => 1,
					);
				} else {
					$data = array(
						'restaurant_id' => $last_res_id,
						'plan' => $plan,
						'start_date' => $start,
						'finish_date' => $finish,
						'status' => 1,
					);
				}

				$this->Restaurant->insert_plan($data);
			}

			$this->session->set_flashdata('success', 'You have stored the restaurant successfully');
			redirect("admin/restaurants");
		}
	}

	public function edit($id)
	{
		$data['user'] = $this->session->userdata('user');
		$this->load->model("Area");

		$admin_type = $this->check_admin_restaurant($id);

		$data['area'] = $this->Area->selectAll();
		$data['restaurant'] = $this->Restaurant->selectById($id);
		$data['plan'] = $this->get_plan($id);
		$data['restaurant_images'] = $this->db->get_where('restaurants_images', array('restaurant_id' => $id))->result();
		$data['title'] = "Edit Restaurant";
		$data['owner'] = $this->db->get_where('admins', array('role' => 'admin', 'active' => 1))->result();

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/edit.php');
		$this->load->view('layouts/footer.php');
	}

	private function get_plan($id)
	{
		$plan = $this->Restaurant->selectPlanById($id);
		if ($plan != null) {
			$start = explode('-', $plan->start_date);
			$finish = explode('-', $plan->finish_date);
			$plan->start_date = $start[1] . '/' . $start[2] . '/' . $start[0];
			if ($plan->finish_date != null) {
				$plan->finish_date = $finish[1] . '/' . $finish[2] . '/' . $finish[0];
			} else {
				$plan->finish_date = date('m/d/Y');
			}
			return $plan;
		} else {
			$plan = (object)array(
				'restaurant_id' => $id,
				'plan' => 1,
				'start_date' => date('m/d/Y'),
				'finish_date' => date('m/d/Y'),
				'status' => 1,
			);
			return $plan;
		}
	}

	/**
	 * Update client specified resource.
	 * @param int $id
	 */
	public function update($id)
	{
		$admin_type = $this->check_admin_restaurant($id);

		$name = $this->input->post('name');
		$area = $this->input->post('area');
		$phone_number = $this->input->post('phone_number');
		$type = $this->input->post('type');
		$address = $this->input->post('address');
		$lat = $this->input->post('lat');
		$lng = $this->input->post('lng');
		$owner = $this->input->post('owner');

		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('area', 'Area', 'required');
		$this->form_validation->set_rules('phone_number', 'Phone Number', 'required');
		$this->form_validation->set_rules('type', 'Restaurant Type', 'required');
		$this->form_validation->set_rules('address', 'Address', 'required');
		$this->form_validation->set_rules('lat', 'Latitude', 'required');
		$this->form_validation->set_rules('lng', 'Longitude', 'required');

		$user = $this->Restaurant->selectById($id);

		if ($this->form_validation->run() == FALSE) {
			$this->edit($id);
		} else {
			if (!empty($_FILES['logo']['name']) || null != $_FILES['logo']['name']) {
				try {
					unlink(FCPATH . "/plugins/images/Restaurants/" . $user->logo);
					unlink(FCPATH . "/plugins/thumb_images/Restaurants/Thumb_" . $user->logo);
				}catch (Exception $exception){}

				$image = $this->uploadImage('logo');
				if (isset($image['error'])) {
					$this->session->set_flashdata('error', $image['error']);
					$this->edit($id);
					return;
				}
				$logo = isset($image['data']['file_name']) ? $image['data']['file_name'] : "";
			}
			$this->db->trans_start();

			if (!empty($_FILES['images']['name'][0]) || null != $_FILES['images']['name'][0]) {
				$images = $this->upload_files($_FILES['images'], $id);
				if (isset($images['err'])) {
					$this->errors = $images['err'];
					$this->db->trans_rollback();
					$this->edit($this->input->post('id'));
					return;
				} else {
					$this->db->insert_batch('restaurants_images', $images);
				}
			}
			$this->db->trans_complete();

			$restaurant = array(
				'name' => $name,
				'area_id' => $area,
				'phone_number' => $phone_number,
				'type' => $type,
				'address' => $address,
				'lat' => $lat,
				'lng' => $lng,
			);
			$restaurant['admin_id'] = is_numeric($owner) ? $owner : NULL;
			if (isset($logo)) $restaurant['logo'] = $logo;

			$this->Restaurant->update($restaurant, $id);

			redirect("admin/restaurants");
		}
	}


	public function update_plan($id)
	{
		$plan = $this->input->post('plan');
		$daterange = $this->input->post('daterange');

		$old = $this->Restaurant->selectPlanById($id);

		$originalDate = explode(" - ", $daterange);
		$start = date("Y-m-d", strtotime($originalDate[0]));
		$finish = date("Y-m-d", strtotime($originalDate[1]));

		if ($old->plan != null) {
			if ($old->plan != $plan || $old->start_date != $start || $old->finish_date != $finish) {

				$data = array(
					'restaurant_id' => $id,
					'start_date' => $old->start_date,
					'finish_date' => $old->finish_date,
					'status' => 1,
				);
				if ($old->plan != $plan) {
					$data['plan'] = $plan;
				}
				if ($old->start_date != $start) {
					$data['start_date'] = $start;
				}
				if ($old->finish_date != $finish) {
					$data['finish_date'] = $finish;
				}

				if ($plan == 1) {
					$data = array(
						'restaurant_id' => $id,
						'plan' => $plan,
						'start_date' => $start,
						'finish_date' => null,
						'status' => 1,
					);
				}
				$this->Restaurant->update_plan($id, $data);
			}
		} else {
			if ($plan == 1) {
				$data = array(
					'restaurant_id' => $id,
					'plan' => $plan,
					'start_date' => $start,
					'finish_date' => null,
					'status' => 1,
				);
			} else {
				$data = array(
					'restaurant_id' => $id,
					'plan' => $plan,
					'start_date' => $start,
					'finish_date' => $finish,
					'status' => 1,
				);
			}
			$this->Restaurant->insert_plan($data);
		}
		redirect("admin/restaurants");
	}

	/**
	 * Change the clients active status.
	 * @param int $id
	 */
	public function change_status($id)
	{
		$this->Restaurant->changeStatus($id);
		redirect("admin/restaurants");
	}

	public function change_status_image($id)
	{
		$data = $this->db->get_where('restaurants_images', ["id" => $id])->row();
		if (null == $data) {
			return;
		}
		$status = $data->status == 1 ? 0 : 1;
		$this->db->update('restaurants_images', array("status" => $status), ['id' => $id]);
		redirect("admin/restaurants/edit/$data->restaurant_id");
	}

	private function uploadImage($image)
	{
		if (!is_dir(FCPATH . "/plugins/images/Restaurants")) {
			mkdir(FCPATH . "/plugins/images/Restaurants", 0755, true);
		}

		if (!is_dir(FCPATH . "/plugins/thumb_images/Restaurants")) {
			mkdir(FCPATH . "/plugins/thumb_images/Restaurants", 0755, true);
		}

		$path = FCPATH . "/plugins/images/Restaurants";
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
			'new_image' => FCPATH . "/plugins/thumb_images/Restaurants/" . "Thumb_" . $filename,
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

	private function upload_files($files, $id)
	{
		if (!is_dir(FCPATH . "/plugins/images/Restaurant_images")) {
			mkdir(FCPATH . "/plugins/images/Restaurant_images", 0755, true);
		}
		$config = array(
			'upload_path' => FCPATH . "/plugins/images/Restaurant_images",
			'allowed_types' => 'jpg|jpeg|png|jfif',
			'max_size' => 100000000000,
			'overwrite' => 1
		);

		$this->load->library('upload', $config);

		$images = array();

		foreach ($files['name'] as $key => $image) {
			$_FILES['images[]']['name'] = $files['name'][$key];
			$_FILES['images[]']['type'] = $files['type'][$key];
			$_FILES['images[]']['tmp_name'] = $files['tmp_name'][$key];
			$_FILES['images[]']['error'] = $files['error'][$key];
			$_FILES['images[]']['size'] = $files['size'][$key];
			$ext = explode(".", $image)[1];
			$fileName = 'Res_image_' . time() . '_' . uniqid() . "." . $ext;

			$images[$key]['image'] = $fileName;
			$images[$key]['restaurant_id'] = $id;

			$config['file_name'] = $fileName;

			$this->upload->initialize($config);

			if ($this->upload->do_upload('images[]')) {
				$this->upload->data();
				$this->resizeResImage($fileName, $config['upload_path']);
			} else {
				$data['err'] = $this->upload->display_errors() . $image;
				return $data;
			}
		}
		return $images;
	}

	private function resizeResImage($filename, $path)
	{
		$source_path = $path . "/" . $filename;
		$target_path = $path . "/" . $filename;
		$config_manip = array(
			'image_library' => 'gd2',
			'source_image' => $source_path,
			'new_image' => $target_path,
			'maintain_ratio' => TRUE,
			'create_thumb' => FALSE,
			'width' => 1000,
			'height' => 1000,
		);
		$this->load->library('image_lib');
		$this->image_lib->initialize($config_manip);

		if (!$this->image_lib->resize()) {
			echo $this->image_lib->display_errors();
		}
		$this->image_lib->clear();
	}

//	check admin type
	private function check_admin_restaurant($res_id)
	{
		$admin_id = $this->session->userdata('user')['user_id'];

		$type = $this->check_admin();
		if ($type == 2) {
			$res_admin_id = $this->db->get_where('restaurants', array('id' => $res_id))->row()->admin_id;
			if ($res_admin_id != $admin_id) {
				redirect('404_override');
			}
		}
	}

	private function check_admin()
	{
		$admin_role = $this->session->userdata('user')['role'];

		if ($admin_role == 'superAdmin') {
			return 1;
		} elseif ($admin_role == 'admin') {
			return 2;
		} else {
			redirect('404_override');
			return;
		}
	}

	private function get_region($lat = null, $lng = null)
	{
		$point["lat"] = $lat;
		$point["lng"] = $lng;

		$regions = $this->db->get_where('regions', array("regions.status" => 1))->result();
		$arr = array();
		foreach ($regions as $bin => $key) {
			$this->db->select("regions_coordinates.lat, regions_coordinates.lng");
			$data = $this->db->get_where("regions_coordinates", array("region_id" => $key->id))->result();
			$arr[$bin]["reg"] = $data;
			$arr[$bin]["reg_id"] = $key->id;
		}

		$id = 0;
		foreach ($arr as $key) {
			$in = $this->inside($point, $key["reg"]);
			if ($in == "true") {
				$id = $key["reg_id"];
				break;
			}
		}

		$region = "";
		if ($id != 0) {
			$region = $this->db->get_where('regions', array('id' => $id))->row()->name;
		}
		return $region;
	}

	private function inside($point, $fenceArea)
	{
		$x = $point['lat'];
		$y = $point['lng'];

		$inside = false;
		for ($i = 0, $j = count($fenceArea) - 1; $i < count($fenceArea); $j = $i++) {
			$xi = $fenceArea[$i]->lat;
			$yi = $fenceArea[$i]->lat;
			$xj = $fenceArea[$j]->lng;
			$yj = $fenceArea[$j]->lng;

			$intersect = (($yi > $y) != ($yj > $y))
				&& ($x < ($xj - $xi) * ($y - $yi) / ($yj - $yi) + $xi);
			if ($intersect) $inside = !$inside;
		}

		return $inside;
	}

	public function statistics($id)
	{
		$data['user'] = $this->session->userdata('user');
		$data['title'] = "Statistics";

		$this->load->model("Statistic");

		$res_data = (object) array();
		$res_data->favorite = $this->Statistic->favorite($id)->favorite;
		$res_data->share = $this->Statistic->share($id)->share;
		$res_data->rate_count = $this->Statistic->rate($id)->rate_count;
		$res_data->review_count = $this->Statistic->reviews($id)->review;
		$res_data->rate = $this->Statistic->restaurant_rate($id);
		$res_data->review_by_gender = $this->Statistic->review_by_gender($id);
		$res_data->rate_by_age = $this->Statistic->rate_by_age($id);
		$res_data->rate_by_gender = $this->Statistic->rate_by_gender($id);
		$res_data->offers = $this->Statistic->first_page($id);
		$res_data->res_click = $this->Statistic->res_click($id);
		$res_data->all_users = $this->Statistic->users_count()->count;
		$res_data->gender_all = $this->Statistic->gender_all();

		$data['res'] = $res_data;

		$this->load->view('layouts/header.php', $data);
		$this->load->view('restaurants/statistics/index.php');
		$this->load->view('layouts/footer.php');
	}
}
