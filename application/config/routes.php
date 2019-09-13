<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'Admins';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

//users Api
$route['api/users/register'] = 'api/Users_Api/register';
$route['api/users/login'] = 'api/Users_Api/login';
$route['api/users/refresh-token'] = 'api/Users_Api/refresh_token';
$route['api/users/get-user'] = 'api/Users_Api/getUser';
$route['api/users/logout'] = 'api/Users_Api/logout';

//facebook login Api
$route['api/users/facebook/login'] = 'api/Facebook_Api/login';

//restaurants Api
$route['api/restaurants'] = 'api/Restaurants_Api';
$route['api/restaurants/slider'] = 'api/Restaurants_Api/slider';

//restaurant profile Api
$route['api/restaurant/profile'] = 'api/Restaurant_Profile_Api';

//search Api
$route['api/restaurants/search'] = 'api/Search_Api';
$route['api/restaurants/price'] = 'api/Search_Api/price';

//location api
$route['api/locations'] = 'api/Location_Api';
$route['api/locations/geolocation'] = 'api/Location_Api/geolocation';

//rate
$route['api/rate'] = 'api/Rate_Api';

//admin panel
$route['admin'] = 'Admins';
$route['admin/dashboard'] = 'Admins';
$route['admin/register'] = 'Admins/register';
$route['admin/login'] = 'Login';
$route['admin/logout'] = 'Login/logout';
$route['admin/profile'] = 'Admins/profile';
$route['admin/settings'] = 'Admins/settings';
$route['admin/settings/update/(:any)'] = 'Admins/update/$1';

//Client
$route['admin/clients'] = 'Clients';
$route['admin/clients/create'] = 'Clients/create';
$route['admin/clients/store'] = 'Clients/store';
$route['admin/clients/edit/(:any)'] = 'Clients/edit/$1';
$route['admin/clients/update/(:any)'] = 'Clients/update/$1';
$route['admin/clients/change-status/(:any)'] = 'Clients/change_status/$1';

//Country
$route['admin/countries'] = 'Countries';
$route["admin/countries/create"] = 'Countries/create';
$route["admin/countries/store"] = 'Countries/store';
$route["admin/countries/edit/(:any)"] = 'Countries/edit/$1';
$route["admin/countries/update/(:any)"] = 'Countries/update/$1';
$route["admin/countries/change-status/(:any)"] = 'Countries/change_status/$1';

//Area
$route['admin/area'] = 'Areas';
$route["admin/area/create"] = 'Areas/create';
$route["admin/area/store"] = 'Areas/store';
$route["admin/area/edit/(:any)"] = 'Areas/edit/$1';
$route["admin/area/update/(:any)"] = 'Areas/update/$1';
$route["admin/area/change-status/(:any)"] = 'Areas/change_status/$1';

//Restaurants
$route['admin/restaurants'] = 'Restaurants';
$route["admin/restaurants/create"] = 'Restaurants/create';
$route["admin/restaurants/store"] = 'Restaurants/store';
$route["admin/restaurants/edit/(:any)"] = 'Restaurants/edit/$1';
$route["admin/restaurants/update/(:any)"] = 'Restaurants/update/$1';
$route["admin/restaurants/change-status/(:any)"] = 'Restaurants/change_status/$1';
$route["admin/restaurants/change-status-image/(:any)"] = 'Restaurants/change_status_image/$1/$2';

//Restaurant More Info
$route["admin/restaurants/info/(:any)"] = 'MoreInfos/index/$1';
$route["admin/restaurants/info/store/(:any)"] = 'MoreInfos/store/$1';
$route["admin/restaurants/info/edit/(:any)"] = 'MoreInfos/edit/$1';
$route["admin/restaurants/info/update/(:any)"] = 'MoreInfos/update/$1';
$route["admin/restaurants/info/change-status/(:any)"] = 'MoreInfos/change_status/$1';

//Restaurant More Info
//$route["admin/restaurants/menu/(:any)"] = 'MoreInfos/index/$1';
//$route["admin/restaurants/menu/create/(:any)"] = 'MoreInfos/index/$1';
//$route["admin/restaurants/menu/store/(:any)"] = 'MoreInfos/store/$1';
//$route["admin/restaurants/menu/edit/(:any)"] = 'MoreInfos/edit/$1';
//$route["admin/restaurants/menu/update/(:any)"] = 'MoreInfos/update/$1';
//$route["admin/restaurants/menu/change-status/(:any)"] = 'MoreInfos/change_status/$1';

//Slider
$route['admin/sliders'] = 'Sliders';
$route["admin/sliders/store"] = 'Sliders/store';
$route["admin/sliders/change-status/(:any)"] = 'Sliders/change_status/$1';

//Featured Offers
$route['admin/offers'] = 'Offers';
$route["admin/offers/create"] = 'Offers/create';
$route["admin/offers/store"] = 'Offers/store';
$route["admin/offers/edit/(:any)"] = 'Offers/edit/$1';
$route["admin/offers/update/(:any)"] = 'Offers/update/$1';
$route["admin/offers/change-status/(:any)"] = 'Offers/change_status/$1';

