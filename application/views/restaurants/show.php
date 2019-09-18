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
					<ul class="list-icons">
						<li><h4> Name - <?= $restaurant->restaurant_name ?>    </h4></li>
						<li><h4> Adress - <?= $restaurant->address ?>            </h4></li>
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
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-6">
		<div class="panel panel-default">
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
			<h3 class="box-title m-b-0">Restaurants Table</h3>
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
