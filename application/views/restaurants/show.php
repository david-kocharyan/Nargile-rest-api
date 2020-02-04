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

	<div class="col-lg-6">
		<div class="panel panel-default" style="height: 607px;">
			<div class="panel-heading">restaurant slider carousel</div>
			<div class="panel-wrapper p-b-10 collapse in">
				<div id="owl-demo" class="owl-carousel owl-theme">
					<?php foreach ($images as $key => $value) { ?>
						<img src="<?= base_url() . $value->image ?>" alt="image" width="1000" height="500">
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
							<h4><strong><?= $value->first_name . " " . $value->first_name ?></strong></h4>
							<p><?= $value->review ?></p>
							<hr/>
						</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="white-box" style="height: 300px;">
			<h3 class="box-title">Featured Offers</h3>
			<div class="row">
				<div class="col-sm-9" id="featured_offers">
					<?php foreach ($featured as $key => $value) { ?>
						<p><?= $value->text ?></p>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="white-box" style="height: 300px;">
			<h3 class="box-title">Hour Offers</h3>
			<div class="row">
				<div class="col-sm-9" id="hour_offers">
					<?php foreach ($hour as $key => $value) { ?>
						<p><?= $value->text ?></p>
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

<script src="https://maps.google.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyDsz2KPO5FSf6PDx2YwCTtB1HBt2DkXFrY"
		type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function () {
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
	})
</script>
