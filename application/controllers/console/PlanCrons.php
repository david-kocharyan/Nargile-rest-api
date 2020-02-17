<?php

class PlanCrons extends CI_Controller
{
	public function check_plan()
	{
		$this->db->where('CURDATE() + INTERVAL 1 DAY >= finish_date ');
		$this->db->where('status', 1);
		$data = $this->db->get("res_plans")->result();

		foreach ($data as $key) {
			$this->db->set('start_date', date('Y-m-d', time() + 86400));
			$this->db->set('finish_date', null);
			$this->db->set('status', 1);
			$this->db->where('id', $key->id);
			$this->db->update('res_plans');
		}
	}
}
