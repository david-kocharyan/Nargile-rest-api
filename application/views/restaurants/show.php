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
				<div class="col-lg-3 col-md-3 col-sm-6">
					<h3 class="box-title m-t-0">Restaurant description</h3>
					<ul class="list-icons">
						<li><h4> Name - <?= $restaurant->restaurant_name ?>    </h4></li>
						<li><h4> Phone Number - <?= $restaurant->phone_number ?>  </h4></li>
						<li><h4> Address - <?= $restaurant->address ?>            </h4></li>
						<li><h4> Latitude - <?= $restaurant->lat ?>            </h4></li>
						<li><h4> Longitude - <?= $restaurant->lng ?>            </h4></li>
						<li><h4> Rate - <?= $restaurant->rate ?>                </h4></li>
					</ul>

					<h3 class="box-title m-t-20">More Info</h3>
					<ul class="list-icons">
						<?php foreach ($more_info as $key => $value) { ?>
							<li><h4> <?= $value->name ?> </h4></li>
						<?php } ?>
					</ul>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6">

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
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-6">
		<div class="panel panel-default" style="height: 607px;">
			<div class="panel-heading">Slide show with owl Carousel</div>
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
						<p><?= $value->review ?></p>
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
