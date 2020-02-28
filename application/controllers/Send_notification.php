<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require FCPATH . "application/controllers/Firebase.php";

class Send_notification extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		if (($this->session->userdata('user') == NULL OR !$this->session->userdata('user')) OR $this->session->userdata('user')['role'] != "superAdmin") {
			redirect('/admin/login');
		}
//		$this->load->model("Offer");
	}

	public function index()
	{
		$data['user'] = $this->session->userdata('user');
		$data['users'] = $this->db->get_where('users', array('verify' => 1))->result();
		$data['title'] = "Send Notification To Users";

		$this->load->view('layouts/header.php', $data);
		$this->load->view('notification/index.php');
		$this->load->view('layouts/footer.php');
	}

	public function send_message()
	{
		$users = $this->input->post('users[]');
		$title = $this->input->post('title');
		$text = $this->input->post('text');

		$this->form_validation->set_rules('users[]', 'Users', 'required');
		$this->form_validation->set_rules('title', 'Title', 'required');
		$this->form_validation->set_rules('text', 'Message', 'required');

		if ($this->form_validation->run() == FALSE) {
			$this->index();
			return;
		} else {
			$this->send_notif($users, $title, $text);
		}

		return redirect('admin/send-message');
	}

	private function send_notif($users, $title = 'Narguile App', $text = 'Text')
	{
		foreach ($users as $key) {
			$data = array(
				"user_id" => $key,
				"body" => $text,
				"click_action" => 'admin_request',
				"action_id" => 0,
			);
			$this->db->insert('notification', $data);

			$tokens = $this->get_fcm_tokens($key);
			Firebase::send($text, $tokens, 'admin_request', $key, $title);
		}
	}

	private function get_fcm_tokens($user_id)
	{
		$this->db->select("fcm_token, os");
		$this->db->join("users", "users.id = tokens.user_id AND users.notification_status = 1");
		$this->db->where("tokens.fcm_token IS NOT NULL");
		$this->db->where("user_id", $user_id);
		$data = $this->db->get("tokens")->result();
		$result = array();
		if (null != $data) {
			foreach ($data as $d) {
				if ($d->os == Firebase::IS_ANDROID && !empty($d->fcm_token)) {
					$result[Firebase::ANDROID][] = $d->fcm_token;
				} elseif ($d->os == Firebase::IS_IOS && !empty($d->fcm_token)) {
					$result[Firebase::IOS][] = $d->fcm_token;
				}
			}
			return $result;
		} elseif (null == $data) {
			return;
		}
	}


}
