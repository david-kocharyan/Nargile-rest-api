<?php

require FCPATH . "application/controllers/Firebase.php";

class CoinOfferCrons extends CI_Controller
{
	const COIN_OFFER_DATE_NOTIF = "coin_offer";

//	make the coin out of date all the coins besides current day
	public function out_of_date_coin_offers()
	{
		$this->db->query("UPDATE claimed_offers SET user_id = 0, coin_offer_id = 0, status = 0 WHERE coin_offer_id in (
									SELECT id FROM `coin_offers` WHERE DATE_FORMAT(FROM_UNIXTIME(valid_date), '%Y-%m-%d') <= DATE_FORMAT(curdate(), '%Y-%m-%d')
    								)");
	}


	//	send notif to the user about his/her all the coins except current day
	public function send_coin_date_notif()
	{
		$this->db->select("DATEDIFF(DATE_FORMAT(FROM_UNIXTIME(valid_date), '%Y-%m-%d'), DATE_FORMAT(curdate(), '%Y-%m-%d')) as days_left, users.*, restaurants.name as restaurant_name");
		$this->db->join("claimed_offers", "claimed_offers.coin_offer_id = coin_offers.id");
		$this->db->join("users", "users.id = claimed_offers.user_id");
		$this->db->join("restaurants", "restaurants.id = coin_offers.restaurant_id");
		$data = $this->db->get_where("coin_offers", "DATE_FORMAT(FROM_UNIXTIME(valid_date), '%Y-%m-%d') > DATE_FORMAT(curdate(), '%Y-%m-%d')")->result();
		if(null != $data) {
			foreach ($data as $d) {
				$tokens = $this->get_fcm_tokens($d->id);
				Firebase::send("Dear $d->first_name $d->last_name, Your Coin Offer For The Restaurant ' $d->restaurant_name ' Will Be Finished in $d->days_left Days !! ", $tokens, self::COIN_OFFER_DATE_NOTIF );
			}
		}
	}

	private function get_fcm_tokens($user_id)
	{
		$this->db->select("fcm_token, os");
		$this->db->where("tokens.fcm_token IS NOT NULL");
		$this->db->where("user_id", $user_id);
		$data = $this->db->get("tokens")->result();
		$result = array();
		if(null != $data) {
			foreach ($data as $d) {
				if($d->os == Firebase::IS_ANDROID) {
					$result[Firebase::ANDROID][] = $d->fcm_token;
				} else {
					$result[Firebase::IOS][] = $d->fcm_token;
				}
			}
		} elseif(null == $data) {
			return;
		}
	}
}
