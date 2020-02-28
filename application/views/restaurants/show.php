<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<a href="<?= base_url("admin/restaurants/edit/$restaurant->restaurant_id") ?>" class="btn btn-info">
				<span class="btn-label">
					<i class="fas fa-pencil-alt"></i>
				</span>
				Edit
			</a>

			<a href="<?= base_url("admin/restaurants/menu/$restaurant->restaurant_id") ?>"
			   class="btn btn-success">
				<span class="btn-label">
					<i class="fas fas fa-book"></i>
				</span>
				Add Menu
			</a>

			<a href="<?= base_url("admin/restaurants/info/$restaurant->restaurant_id") ?>"
			   class="btn btn-primary">
				<span class="btn-label">
					<i class="fas fa-info"></i>
				</span>
				Add More Info
			</a>

			<a href="<?= base_url("admin/restaurants/featured-offers/$restaurant->restaurant_id") ?>"
			   class="btn btn-warning">
				<span class="btn-label">
					<i class="fas fa-tags"></i>
				</span>
				Add Featured Offers
			</a>

			<a href="<?= base_url("admin/restaurants/hour-offers/$restaurant->restaurant_id") ?>"
			   class="btn btn-danger">
				<span class="btn-label">
					<i class="fas fa-hourglass-half"></i>
				</span>
				Add Hour Offers
			</a>

			<a href="<?= base_url("admin/restaurants/weeks/$restaurant->restaurant_id") ?>"
			   class="btn btn-basic">
				<span class="btn-label">
					<i class="fas fa-calendar-alt"></i>
				</span>
				Add Working hours
			</a>

			<a href="<?= base_url("admin/restaurants/coin-offers/$restaurant->restaurant_id") ?>"
			   class="btn btn-basic">
				<span class="btn-label">
					<i class="fab fa-bitcoin"></i>
				</span>
				Add Coin Offers
			</a>
		</div>
	</div>
</div>

<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-30">Restaurant Data</h3>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6">
					<div class="white-box text-center"><img src="<?= base_url() . $restaurant->logo ?>"
															class="img-responsive"/>
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-6">
					<h3 class="box-title m-t-0">Restaurant description</h3>
					<button data-toggle="modal" data-target=".bs-example-modal-sm" class="btn btn-outline btn-primary">
						Working Hours
					</button>
					<ul class="list-icons">
						<li><h4 class="name"> Name - <?= $restaurant->restaurant_name ?>    </h4></li>
						<li><h4> Phone Number - <?= $restaurant->phone_number ?>  </h4></li>
						<li><h4> Address - <?= $restaurant->address ?>            </h4></li>
					</ul>
					<hr>

					<h3 class="box-title m-t-20">More Info</h3>
					<ul class="list-icons">
						<?php foreach ($more_info as $key => $value) { ?>
							<li><h4> <?= $value->name ?> </h4></li>
						<?php } ?>
					</ul>
					<hr>

					<h3 class="box-title">Rate</h3>
					<ul class="list-icons">
						<li><h4>Overall - <?= $rate->overall ?></h4></li>
						<li><h4>Taste - <?= $rate->taste ?></h4></li>
						<li><h4>Charcoal - <?= $rate->charcoal ?></h4></li>
						<li><h4>Cleanliness - <?= $rate->cleanliness ?></h4></li>
						<li><h4>Staff - <?= $rate->staff ?></h4></li>
						<li><h4>Value for money - <?= $rate->value_for_money ?></h4></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="white-box">
			<h3 class="box-title">Map</h3>
			<div id="map" style="height: 500px;"></div>
		</div>
	</div>

	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Restaurant slider carousel</div>
			<div class="panel-wrapper p-b-10 collapse in">
				<div id="owl-demo" class="owl-carousel owl-theme">
					<?php foreach ($images as $key => $value) { ?>
						<img src="<?= base_url() . $value->image ?>" alt="image" class="img-responsive">
					<?php } ?>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="white-box" style="height: 607px;">
			<h3 class="box-title">Reviews</h3>
			<div class="row">
				<div class="col-sm-9" id="reviews">
					<?php foreach ($reviews as $key => $value) { ?>
						<div class="col-md-12">
							<h4>
								<strong data-id="<?= $value->user_id; ?>" data-toggle="modal" data-target="#myModal"
										class="open_modal_by_name" style="cursor: pointer;">
									<img src="<?= base_url('plugins/images/Logo/') . $value->image; ?>" alt=""
										 style="border-radius: 50%; height: 50px; width: 50px;">
									<?= " " . $value->first_name . " " . $value->first_name . "" ?>
								</strong>
								<span
									style="font-size: 15px;margin-left: 5%;"><?= date('d/m/Y H:i', strtotime($value->created_at)); ?></span>
							</h4>
							<p><?= $value->review ?></p>
							<hr/>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="white-box" style="height: 607px;">
			<h3 class="box-title">Restaurant plan history</h3>
			<div class="row">
				<div class="col-sm-9" id="history">
					<?php foreach ($plans as $key => $value) { ?>
						<div class="col-md-12">
							<?php if ($value->plan != 1) { ?>
								<h4>
									<?php if ($value->plan == 2) {
										echo "Bronze";
									} elseif ($value->plan == 3) {
										echo "Silver";
									} elseif ($value->plan == 4) {
										echo "Gold";
									} ?>
								</h4>
								<p><?= $value->start_date . " - " . $value->finish_date ?></p>
								<hr/>
							<?php } ?>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Restaurant Menu Table</h3>
			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Price</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($menus as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->name ?></td>
							<td><?= $value->price ?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Food and bar menu</div>
			<div class="panel-wrapper p-b-10 collapse in">
				<div id="owl-demo2" class="owl-carousel owl-theme owl-loaded owl-drag">
					<div class="owl-stage-outer">
						<div class="owl-stage"
							 style="transform: translate3d(-362px, 0px, 0px); transition: all 0.25s ease 0s; width: 2176px;">

							<?php foreach ($menu_images as $key) { ?>
								<div class="owl-item" style="width: 342.6px; margin-right: 20px;">
									<div class="item"><img src="<?= base_url('plugins/images/Menu/') . $key->image ?>"
														   alt="Menu Image"></div>
								</div>
							<?php } ?>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	 aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="mySmallModalLabel">Working Hours</h4></div>
			<div class="modal-body">
				<ul>
					<?php foreach ($weeks as $key => $value) { ?>
						<?php if ($value->type == 0) { ?>
							<li>
								<strong><?= $value->day . ": " . 'Close' ?></strong>
							</li>
						<?php } else { ?>
							<li>
								<strong><?= $value->day . ": " . $value->open . " - " . $value->close ?></strong>
							</li>
						<?php } ?>
					<?php } ?>
				</ul>
			</div>
		</div>
	</div>
</div>

<!--modal part-->
<div id="user_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<input type="hidden" class="url" value="<?= base_url('plugins/images/Logo/') ?>">
				<div class="image" style="display: inline-block;"></div>
				<h4 class="modal-title" id="modal_name" style="display: inline-block;"></h4></div>
			<div class="modal-body form-group">
				<div class="form-group">
					<div class="col-md-4" data-height="50" align="center">
						Date of Birth
						<p class="dob m-t-10 m-b-20"></p>
					</div>
					<div class="col-md-4" data-height="50" align="center">
						Phone
						<p class="phone m-t-10 m-b-20"></p>
					</div>
					<div class="col-md-4" data-height="50" align="center">
						Email
						<p class="email m-t-10 m-b-20"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--offers click quantity-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Featured Offers click quantity</h3>
			<div class="table-responsive">
				<table id="feature_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Description</th>
						<th>Restaurant Name</th>
						<th>Quantity</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($featured as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->text ?></td>
							<td><?= $value->name ?></td>
							<td><?= $value->quantity ?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Happy Hour Deals click quantity</h3>
			<div class="table-responsive">
				<table id="hour_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Description</th>
						<th>Restaurant Name</th>
						<th>Quantity</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($hour as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->text ?></td>
							<td><?= $value->name ?></td>
							<td><?= $value->quantity ?></td>
						</tr>
						<p></p>
					<?php } ?>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<scripts></scripts>
<script src="https://maps.google.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyDsz2KPO5FSf6PDx2YwCTtB1HBt2DkXFrY"
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function () {
		$('#feature_table').DataTable();
		$('#hour_table').DataTable();

		geocoder = new google.maps.Geocoder();

		var latitude = <?php echo json_encode($restaurant->lat); ?>;
		var longitude = <?php echo json_encode($restaurant->lng); ?>;
		var lat = JSON.parse(latitude);
		var lng = JSON.parse(longitude);


		var infowindow = new google.maps.InfoWindow({
			content: $(".name").html(),
		});

		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 16,
			center: new google.maps.LatLng(lat, lng),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		});

		var marker = new google.maps.Marker({
			map: map,
			animation: google.maps.Animation.DROP,
			position: new google.maps.LatLng(lat, lng),
		});

		marker.addListener('click', function () {
			infowindow.open(map, marker);
		});


		$(".open_modal_by_name").click(function () {
			var id = $(this).attr('data-id');

			$.ajax({
				type: 'POST',
				dataType: 'json',
				url: "<?= base_url('admin/restaurants/show-ajax')?>",
				data: {id},
				success: function (data) {
					console.log(data);
					var url = $(".url").val();
					$(".image").empty();
					$(".image").append('<img src="' + url + data.image + '" style="width: 50px; height: 50px; border-radius: 50%;"/>');

					if (data.dob == null) data.dob = "13 December 1994";
					$(".dob").html('<strong>' + data.dob + '</strong>');
					$(".phone").html('<strong>' + data.mobile_number + '</strong>');
					$(".email").html('<strong>' + data.email + '</strong>');
					$("#modal_name").html(data.first_name + " " + data.last_name);

					$("#user_modal").modal('show');
				}
			})
		})


	})
</script>
