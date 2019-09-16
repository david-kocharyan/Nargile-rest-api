<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" type="image/png" sizes="16x16" href="<?= base_url('public/') ?>plugins/images/favicon.png">
	<title>Ample Admin Template - The Ultimate Multipurpose admin template</title>
	<!-- Bootstrap Core CSS -->
	<link href="<?= base_url('public/') ?>bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Datatables CSS -->
	<link href="<?= base_url('public/') ?>plugins/bower_components/datatables/media/css/dataTables.bootstrap.css"
		  rel="stylesheet" type="text/css"/>
	<!-- Menu CSS -->
	<link href="<?= base_url('public/') ?>plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
		  rel="stylesheet">
	<!--Select 2-->
	<link href="<?= base_url('public/') ?>plugins/bower_components/select2/dist/css/select2.min.css" rel="stylesheet"/>
	<!--dropify-->
	<link rel="stylesheet" href="<?= base_url('public/') ?>plugins/bower_components/dropify/dist/css/dropify.min.css">
	<!-- toast CSS -->
	<link href="<?= base_url('public/') ?>plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
	<!-- morris CSS -->
	<link href="<?= base_url('public/') ?>plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
	<!-- chartist CSS -->
	<link href="<?= base_url('public/') ?>plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet">
	<link
		href="<?= base_url('public/') ?>plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css"
		rel="stylesheet">
	<!-- Calendar CSS -->
	<link href="<?= base_url('public/') ?>plugins/bower_components/calendar/dist/fullcalendar.css" rel="stylesheet"/>
	<!-- animation CSS -->
	<link href="<?= base_url('public/') ?>css/animate.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="<?= base_url('public/') ?>css/style.css" rel="stylesheet">
	<!-- color CSS -->
	<link href="<?= base_url('public/') ?>css/colors/default.css" id="theme" rel="stylesheet">

	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="<?= base_url('public/') ?>plugins/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body class="fix-header">
<!-- ============================================================== -->
<!-- Preloader -->
<!-- ============================================================== -->
<div class="preloader">
	<svg class="circular" viewBox="25 25 50 50">
		<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
	</svg>
</div>
<!-- ============================================================== -->
<!-- Wrapper -->
<!-- ============================================================== -->
<div id="wrapper">
	<!-- ============================================================== -->
	<!-- Topbar header - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<nav class="navbar navbar-default navbar-static-top m-b-0">
		<div class="navbar-header">
			<div class="top-left-part">
				<!-- Logo -->
				<a class="logo" href="<?= base_url('admin/dashboard') ?>">
					<!-- Logo icon image, you can use font-icon also --><b>
						<!--This is dark logo icon--><img src="<?= base_url('public/') ?>plugins/images/admin-logo.png"
														  alt="home" class="dark-logo"/>
					</b>
					<!-- Logo text image you can use text also --><span class="hidden-xs">
                        <!--This is dark logo text--><img src="<?= base_url('public/') ?>plugins/images/admin-text.png"
														  alt="home" class="dark-logo"/>
                     </span> </a>
			</div>
			<!-- /Logo -->

			<!-- Search input and Toggle icon -->
			<ul class="nav navbar-top-links navbar-left">
				<li><a href="javascript:void(0)" class="open-close waves-effect waves-light visible-xs"><i
							class="ti-close ti-menu"></i></a></li>
				<li class="dropdown">
					<a class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="#"> <i
							class="mdi mdi-gmail"></i>
						<div class="notify"><span class="heartbit"></span> <span class="point"></span></div>
					</a>
					<ul class="dropdown-menu mailbox animated bounceInDown">
						<li>
							<div class="drop-title">You have 4 new messages</div>
						</li>
						<li>
							<div class="message-center">
								<a href="#">
									<div class="user-img"><img
											src="<?= base_url('public/') ?>plugins/images/users/pawandeep.jpg"
											alt="user" class="img-circle"> <span
											class="profile-status online pull-right"></span></div>
									<div class="mail-contnet">
										<h5>Pavan kumar</h5> <span class="mail-desc">Just see the my admin!</span> <span
											class="time">9:30 AM</span></div>
								</a>
							</div>
						</li>
						<li>
							<a class="text-center" href="javascript:void(0);"> <strong>See all notifications</strong> <i
									class="fa fa-angle-right"></i> </a>
						</li>
					</ul>
				</li>
				<!-- /.dropdown-messages -->

				<!-- .Task dropdown -->
				<li class="dropdown">
					<a class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="#"> <i
							class="mdi mdi-check-circle"></i>
						<div class="notify"><span class="heartbit"></span><span class="point"></span></div>
					</a>
					<ul class="dropdown-menu dropdown-tasks animated slideInUp">
						<li>
							<a href="#">
								<div>
									<p><strong>Task 1</strong> <span class="pull-right text-muted">40% Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success" role="progressbar"
											 aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
											 style="width: 40%"><span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a class="text-center" href="#"> <strong>See All Tasks</strong> <i
									class="fa fa-angle-right"></i> </a>
						</li>
					</ul>
				</li>
			</ul>
			<!--dropdown icon end-->

			<!--search-->
			<ul class="nav navbar-top-links navbar-right pull-right">
				<li>
					<form role="search" class="app-search hidden-sm hidden-xs m-r-10">
						<input type="text" placeholder="Search..." class="form-control"> <a href=""><i
								class="fa fa-search"></i></a></form>
				</li>
			</ul>
			<!--search end-->
		</div>
		<!-- /.navbar-header -->
		<!-- /.navbar-top-links -->
		<!-- /.navbar-static-side -->
	</nav>
	<!-- End Top Navigation -->
	<!-- ============================================================== -->

	<!-- Left Sidebar - style you can find in sidebar.scss  -->
	<!-- ============================================================== -->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav slimscrollsidebar">
			<ul class="nav" id="side-menu">
				<li class="user-pro">
					<a href="#" class="waves-effect"><i class="mdi mdi-account-circle"></i>
						<span class="hide-menu"><?= $user['full_name'] ?><span class="fa arrow"></span></span>
					</a>

					<ul class="nav nav-second-level collapse" aria-expanded="false" style="">
						<li><a href="<?= base_url('admin/profile') ?>"><i class="ti-user"></i> <span
									class="hide-menu">My Profile</span></a></li>
						<li><a href="<?= base_url('admin/settings') ?>"><i class="ti-settings"></i> <span
									class="hide-menu">Account Setting</span></a>
						</li>
						<li><a href="<?= base_url('admin/logout') ?>"><i class="fa fa-power-off"></i> <span
									class="hide-menu">Logout</span></a></li>
					</ul>
				</li>

				<li class="devider"></li>
				<li><a href="javascript:void(0)" class="waves-effect"><i class="mdi mdi-face-profile  fa-fw"></i> <span
							class="hide-menu">Users</span></a></li>
				<li><a href="<?= base_url('admin/clients') ?>" class="waves-effect"><i
							class="mdi mdi-account fa-fw"></i> <span class="hide-menu">Clients</span></a></li>
				<li><a href="<?= base_url('admin/clients/create') ?>" class="waves-effect"><i
							class="mdi mdi-account-plus fa-fw"></i> <span class="hide-menu">Add New Clients</span></a>
				</li>

				<!--restaurants, offers, slider-->
				<li class="devider"></li>
				<li><a href="<?= base_url('admin/restaurants') ?>" class="waves-effect"><i
							class="mdi mdi-apps fa-fw"></i> <span class="hide-menu">Restaurants</span></a>
				</li>
				<li><a href="<?= base_url('admin/sliders') ?>" class="waves-effect"><i
							class="mdi mdi-google-photos fa-fw"></i> <span class="hide-menu">Sliders</span></a>
				</li>
				<li><a href="javascript:void(0)" class="waves-effect"><i data-icon="&#xe008;"
																		 class="mdi mdi-google-maps fa-fw"></i><span
							class="hide-menu">Location</span><span class="fa arrow"></span></a>
					<ul class="nav nav-third-level">
						<li><a href="<?= base_url('admin/countries') ?>"><i class=" fa-fw">C</i><span class="hide-menu">Countries</span></a>
						</li>
						<li><a href="<?= base_url('admin/area') ?>"><i class=" fa-fw">A</i><span
									class="hide-menu">Area</span></a></li>
					</ul>
				</li>
				<li class="devider"></li>
				<!-- END restaurants, offers, slider-->

				<li><a href="javascript:void(0)" class="waves-effect"><i class="mdi mdi-evernote fa-fw"></i> <span
							class="hide-menu">Acounting</span></a></li>
				<li><a href="javascript:void(0)" class="waves-effect"><i class="mdi mdi-settings fa-fw"></i> <span
							class="hide-menu">Settings</span></a></li>


			</ul>
			<div class="sidebar-head">
				<h3><span class="fa-fw open-close"><i class="ti-menu hidden-xs"></i><i class="ti-close visible-xs"></i></span>
					<span class="hide-menu">Navigation</span></h3></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Left Sidebar -->

	<!-- Page Content -->
	<!-- ============================================================== -->
	<div id="page-wrapper">
		<div class="container-fluid">


			<!--page title-->
			<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h4 class="page-title"><?= $title; ?></h4></div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
					<ol class="breadcrumb">
						<li><a href="<?= base_url('admin/dashboard') ?>">Dashboard</a></li>
						<li class="active"><?= $title; ?></li>
					</ol>
				</div>
			</div>
