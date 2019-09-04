<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH . '/libraries/REST_Controller.php');

class Restaurants_Api extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * Simple register method.
     * @return Response
     */
    public function index_get()
    {
		$res = $this->verify_get_request();
		if (gettype($res) != 'string') {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => $res['msg']
			);
			$this->response($data, $res['status']);
			return;
		}

        $limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? $this->input->get('limit') : 5;
        $offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;

        $featured_offers = $this->get_featured_offers();
        $hour_offers = $this->get_hour_offers();
        $nearest = $this->get_nearest();
        $top_rated = $this->get_top_rated();

        if($this->input->get("action") == "top") {
            $count_data = $this->get_pages("top");
        } else if($this->input->get("action") == "nearest") {
            $count_data = $this->get_pages("nearest");
        } else if($this->input->get("action") == "featured_offers") {
            $count_data = $this->get_offers_pages("featured_offers");
        } else if($this->input->get("action") == "hour_offers") {
            $count_data = $this->get_offers_pages("hour_offers");
        } else {
            $count_featured_offers = $this->get_offers_pages("featured_offers");
            $count_hour_offers = $this->get_offers_pages("hour_offers");
            $count_nearest = $this->get_pages("nearest");
            $count_top = $this->get_pages("top");
        }
        if(null == $this->input->get('action')) {
            $response = array(
                'success' => true,
                'data' => array(
                    "featured_offers" => array(
                        "list" => $featured_offers,
                        "meta" => array(
                            "limit" => $limit,
                            "offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') : 0,
                            "pages" => ($limit != 0 || null !== $limit) ? ceil($count_featured_offers->pages / $limit) : 1,
                        ),
                        "action" => "featured_offers"
                    ),
                    "hour_offers" => array(
                        "list" => $hour_offers,
                        "meta" => array(
                            "limit" => $limit,
                            "offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') : 0,
                            "pages" => ($limit != 0 || null !== $limit) ? ceil($count_hour_offers->pages / $limit) : 1,
                        ),
                        "action" => "hour_offers"
                    ),
                    "nearest" => array(
                        "list" => $nearest,
                        "meta" => array(
                            "limit" => $limit,
                            "offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') : 0,
                            "pages" => ($limit != 0 || null !== $limit) ? ceil($count_nearest->pages / $limit) : 1,
                        ),
                        "action" => "nearest"
                    ),
                    "top" => array(
                        "list" => $top_rated,
                        "meta" => array(
                            "limit" => $limit,
                            "offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') : 0,
                            "pages" => ($limit != 0 || null !== $limit) ? ceil($count_top->pages / $limit) : 1,
                        ),
                        "action" => "top"
                    ),
                ),
                'msg' => '',
            );
            $this->response($response, REST_Controller::HTTP_OK);
        } else {
            switch ($this->input->get('action')) {
                case "featured_offers":
                    $data = $this->get_featured_offers();
                    break;
                case "hour_offers":
                    $data = $this->get_hour_offers();
                    break;
                case "nearest":
                    $data = $this->get_nearest();
                    break;
                case "top":
                    $data = $this->get_top_rated();
                    break;
            }
            $pages = ($limit != 0 || null !== $limit) ? ceil($count_data->pages / $limit) : 1;
            $response = array(
                "success" => true,
                "data" => array(
                    $this->input->get('action') => array(
                        "list" => isset($data) ? $data : array(),
                        "meta" => array(
                            "limit" => $limit,
                            "offset" => (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') : 0,
                            "pages" => $pages,
                        ),
                    ),
                ),
                "msg" => ""
            );
            $this->response($response, REST_Controller::HTTP_OK);
        }
    }

    private function get_nearest()
    {
        $this->db->select("restaurants.name, area.name as area_name, countries.name as country_name, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, restaurants.id as id");
        $this->limits();
        $this->join();
        ////////////////////////////////////////////
        $this->db->where("restaurants.id <= 15");
        //////////////////////////////////////////
        $this->where();
        $data = $this->db->get("restaurants")->result();
        return $data != null ? $data : "";
    }

    private function get_top_rated()
    {
        $this->db->select("restaurants.name, area.name as area_name, countries.name as country_name, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, restaurants.id as id ");
        $this->limits();
        $this->join();
        ///////////////////////////////////////////
        $this->db->where("restaurants.id > 15");
        ///////////////////////////////////////////
        $this->where();

        $data = $this->db->get("restaurants")->result();
        return $data != null ? $data : "";
    }

    private function get_featured_offers()
    {
        $this->db->select("concat('/plugins/images/Restaurants/', restaurants.logo) as logo, restaurants.id as id, offers.text");
        $this->limits();
        $this->db->join("restaurants", "restaurants.id = offers.restaurant_id");
        $this->join();
        $this->where();

        $this->db->order_by("offers.id DESC");
        $data = $this->db->get_where("offers", array("offers.status" => 1, "type" => 1))->result();
        return $data != null ? $data : "";
    }

    private function get_hour_offers()
    {
        $this->db->select("concat('/plugins/images/Restaurants/', restaurants.logo) as logo, restaurants.id as id, offers.text");
        $this->limits();
        $this->db->join("restaurants", "restaurants.id = offers.restaurant_id");
        $this->join();
        $this->where();

        $this->db->order_by("offers.id DESC");
        $data = $this->db->get_where("offers", array("offers.status" => 1, "type" => 2))->result();
        return $data != null ? $data : "";
    }

    private function get_pages($type = null)
    {
        $this->db->select("count(restaurants.id) as pages");
        $this->join();
        $this->where();
        /////////////////////////////////////////////////////////////////
        if($type == "top") $this->db->where("restaurants.id > 15");
        if($type == "nearest") $this->db->where("restaurants.id <= 15");
        ////////////////////////////////////////////////////////////////
        $data = $this->db->get("restaurants")->row();
        return $data != null ? $data : 0;
    }

    private function get_offers_pages($type)
    {
        $this->db->select("count(offers.id) as pages");
        $this->db->join("restaurants", "restaurants.id = offers.restaurant_id");
        $this->join();
        $this->where();
        if($type == "featured_offers") $this->db->where("offers.type = 1");
        else if($type == "hour_offers") $this->db->where("offers.type = 2");
        $data = $this->db->get_where("offers", array("offers.status" => 1))->row();
        return $data != null ? $data : 0;
    }

    private function limits()
    {
        $limit = (null !== $this->input->get('limit') && is_numeric($this->input->get("limit"))) ? $this->input->get('limit') : 5;
        $offset = (null !== $this->input->get('offset') && is_numeric($this->input->get("offset"))) ? $this->input->get('offset') * $limit : 0;
        $this->db->limit($limit, $offset);
    }

    private function where()
    {
        $this->db->where(array('area.status' => 1, 'countries.status' => 1, 'restaurants.status' => 1));
    }

    private function join()
    {
        $this->db->join("area", "area.id = restaurants.area_id");
        $this->db->join("countries", "countries.id = area.country_id");
    }

    public function search_get()
    {
        if($this->input->get('name') != null) {
            $data  = $this->find($this->input->get('name'));
        }
        $response = array(
            "success" => true,
            "data" => array(
                "list" => isset($data) ? $data : array(),
            ),
            "msg" => ""
        );
        $this->response($response, REST_Controller::HTTP_OK);
    }

    private function find($name)
    {
        $this->db->select("restaurants.name as restaurant_name, restaurants.id as restaurant_id, area.name as area, concat('/plugins/images/Restaurants/', restaurants.logo) as logo, 'Nargile Price Range 10000-16000 LBP' as info, '3.6' as rate ");
        $this->join();
        $this->where();
        $this->db->like('restaurants.name', $name, 'after');
        $this->db->limit(10);
        $this->db->order_by("restaurants.name");
        $data = $this->db->get("restaurants")->result();
        return $data != null ? $data : "";
    }

    public function slider_get()
    {
        $res = $this->verify_get_request();
		if (gettype($res) != 'string') {
			$data = array(
				"success" => false,
				"data" => array(),
				"msg" => $res['msg']
			);
			$this->response($data, $res['status']);
			return;
        }

        $this->db->select("sliders.id, concat('/plugins/images/Slider/', sliders.image) as image");
        $this->db->limit(5);
        $data = $this->db->get("sliders")->result();

        $response = array(
            "success" => true,
            "data" => array(
                "list" => isset($data) ? $data : array(),
            ),
            "msg" => ""
        );
        $this->response($response, REST_Controller::HTTP_OK);

    }
}

