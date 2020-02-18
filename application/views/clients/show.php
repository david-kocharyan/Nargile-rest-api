<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-30">Client Data</h3>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6">
					<div class="white-box text-center"><img src="<?= base_url('plugins/images/Logo/') . $client->logo ?>"
															class="img-responsive"/>
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-6">
					<h3 class="box-title m-t-0"><?= $client->first_name . " " . $client->last_name ?></h3>

					<ul class="list-icons">
						<li><h4> Username - <?= $client->username ?> </h4></li>
						<li><h4> Phone Number - <?= $client->mobile_number ?> </h4></li>
						<li><h4> Email - <?= $client->email ?> </h4></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!--choose restaurants-->
<div class="row">
	<div class="col-lg-12 col-sm-12 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">PLEASE CHOOSE A RESTAURANT TO VIEW STATISTICS</h3>
			<select onchange="send($(this))" id="restaurants" style="width: 100%;">
				<?php foreach ($restaurants as $bin => $key) { ?>
					<option class="sel<?= $bin; ?>" value="<?= $key->id ?>"><?= $key->name ?></option>
				<?php } ?>
			</select>
		</div>
	</div>
</div>

<!--name part-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title res_name text-center"
				style="letter-spacing: 0.5em; font-weight: bold; font-size: 27px;"></h3>
		</div>
	</div>
</div>

<!--widget part-->
<div class="row widget">
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Users</h3>
			<ul class="list-inline two-part">
				<li><i class=" icon-share text-purple"></i></li>
				<li class="text-right"><span class="counter users_ajax"></span></li>
			</ul>
		</div>
	</div>
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Rate</h3>
			<ul class="list-inline two-part">
				<li><i class=" icon-trophy text-success"></i></li>
				<li class="text-right"><span class="counter rate_ajax"></span></li>
			</ul>
		</div>
	</div>
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Reviews</h3>
			<ul class="list-inline two-part">
				<li><i class=" icon-folder text-warning"></i></li>
				<li class="text-right"><span class="counter reviews_ajax"></span></li>
			</ul>
		</div>
	</div>
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Favorite</h3>
			<ul class="list-inline two-part">
				<li><i class=" icon-heart text-danger"></i></li>
				<li class="text-right"><span class="counter favorite_ajax"></span></li>
			</ul>
		</div>
	</div>
</div>

<!--silver widget part-->
<div class="row silver_widget">
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title"># of Click on Menu</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-menu text-success"></i></li>
				<li class="text-right"><span class="menu_ajax"></span></li>
			</ul>
		</div>
	</div>
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title"># of Click on Direction</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-directions text-danger"></i></li>
				<li class="text-right"><span class="direction_ajax"></span></li>
			</ul>
		</div>
	</div>
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title"># of Click on Reviews</h3>
			<ul class="list-inline two-part">
				<li><i class=" icon-screen-desktop text-primary"></i></li>
				<li class="text-right"><span class="reviews_ajax"></span></li>
			</ul>
		</div>
	</div>
	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title"># of Calls</h3>
			<ul class="list-inline two-part">
				<li><i class="  icon-phone text-warning"></i></li>
				<li class="text-right"><span class="calls_ajax"></span></li>
			</ul>
		</div>
	</div>
</div>

<!--chart part bronze-->
<div class="row bronze">
	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Rate By Users Age Chart</h3>
			<div class="canvas_father_2">
				<canvas id="chart3" height="150"></canvas>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Rate By Users Gender Chart</h3>
			<div class="canvas_father_3">
				<canvas id="chart4" height="150"></canvas>
			</div>
		</div>
	</div>
</div>

<!--chart part gold-->
<div class="row gold">
	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Users Click on Offers</h3>
			<div class="canvas_father_5">
				<canvas id="chart6" height="150"></canvas>
			</div>
		</div>
	</div>
	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Users Click on Restaurants</h3>
			<div class="canvas_father_top">
				<canvas id="chart_top" height="150"></canvas>
			</div>
		</div>
	</div>

	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Rate Chart</h3>
			<div class="canvas_father_1">
				<canvas id="chart2" height="150"></canvas>
			</div>
		</div>
	</div>

	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Review By Users Gender Chart</h3>
			<div class="canvas_father_4">
				<canvas id="chart5" height="150"></canvas>
			</div>
		</div>
	</div>
</div>

<!--script-->
<script>
	function send(_this) {
		let val = _this.val();
		var name = $("#restaurants option:selected").text();
		if (val != null || val != "") {
			$.ajax({
				type: 'POST',
				dataType: 'json',
				url: "<?= base_url('admin/clients-restaurant-show')?>",
				data: {id: val},
				success: function (data) {
					var res = jQuery.parseJSON(JSON.stringify(data));
					$(".res_name").html(name);

					$('.users_ajax').html(res.all_users);
					$('.rate_ajax').html(res.rate_count);
					$('.reviews_ajax').html(res.review_count);
					$('.favorite_ajax').html(res.favorite);
					$('.menu_ajax').html(res.res_click.menu);
					$('.direction_ajax').html(res.res_click.direction);
					$('.reviews_ajax').html(res.res_click.review);
					$('.calls_ajax').html(res.res_click.call);


					$('#chart3').remove();
					$('.canvas_father_2').append(`<canvas id="chart3" height="150"></canvas>`);
					var chart3 = document.getElementById("chart3").getContext("2d");
					var age_18 = 0, age_31 = 0, age_50 = 0, age_other = 0;
					for (i = 0; i < res.rate_by_age.length; i++) {
						if (res.rate_by_age[i].age >= 18 && res.rate_by_age[i].age <= 30) {
							age_18 += 1;
						} else if (res.rate_by_age[i].age >= 31 && res.rate_by_age[i].age < 50) {
							age_31 += 1;
						} else if (res.rate_by_age[i].age > 50) {
							age_50 += 1;
						} else {
							age_other += 1;
						}
					}
					var rate_by_age = [age_18, age_31, age_50, age_other];
					age_chart = new Chart(
						chart3,
						{
							"type": "pie",
							"data": {
								"labels": ["18-30", "31-50", "50+", "other"],
								"datasets": [{
									"label": "Rate By Users Age",
									"data": rate_by_age,
									"backgroundColor": ["rgb(255, 118, 118)", "rgb(44, 171, 227)", "rgb(255, 205, 86)", "rgb(185, 185, 185)"]
								}
								]
							}
						});
					age_chart.update();

					$('#chart4').remove();
					$('.canvas_father_3').append(`<canvas id="chart4" height="150"></canvas>`);
					var chart4 = document.getElementById("chart4").getContext("2d");
					age_chart = new Chart(
						chart4,
						{
							"type": "doughnut",
							"data": {
								"labels": ["Male", "Female"],
								"datasets": [{
									"label": "Rate By Users Gender",
									"data": [res.rate_by_gender.male, res.rate_by_gender.female],
									"backgroundColor": ["rgb(0, 118, 118)", "rgb(255, 205, 86)"]
								}]
							},
						});
					age_chart.update();


					$('#chart6').remove();
					$('.canvas_father_5').append(`<canvas id="chart6" height="150"></canvas>`);
					var chart6 = document.getElementById("chart6").getContext("2d");
					age_chart = new Chart(
						chart6,
						{
							"type": "pie",
							"data": {
								"labels": ["Featured Offers", "Hour Offers"],
								"datasets": [{
									"label": "Users Click On Offers",
									"data": [res.offers.featured, res.offers.hour],
									"backgroundColor": ["rgb(0, 173, 133)", "rgb(105, 0, 105)"]
								}
								]
							}
						});
					age_chart.update();
					// chart end

					$('#chart_top').remove();
					$('.canvas_father_top').append(`<canvas id="chart_top" height="150"></canvas>`);
					var chart_top = document.getElementById("chart_top").getContext("2d");
					age_chart = new Chart(
						chart_top,
						{
							"type": "pie",
							"data": {
								"labels": ["Top", "Nearest"],
								"datasets": [{
									"label": "Users Click On Restaurant",
									"data": [res.offers.top, res.offers.nearest],
									"backgroundColor": ["rgb(15, 74, 180)", "rgb(150, 7, 88)"]
								}
								]
							}
						});
					age_chart.update();


					var rates = [res.rate.taste, res.rate.charcoal, res.rate.cleanliness, res.rate.staff, res.rate.value_for_money, res.rate.overall]
					$('#chart2').remove();
					$('.canvas_father_1').append(`<canvas id="chart2" height="150"></canvas>`);
					var chart2 = document.getElementById("chart2").getContext("2d");
					var rate_chart = new Chart(
						chart2,
						{
							"type": "bar",
							"data": {
								"labels": ["Taste", "Charcoal", "Cleanliness", "Staff", "Value for money", "Overall"],
								"datasets": [{
									"label": "Rate",
									"data": rates,
									"fill": true,
									"backgroundColor": ["rgba(255, 99, 132, 0.5)", "rgba(255, 159, 64, 0.5)", "rgba(255, 205, 86, 0.5)", "rgba(75, 192, 192, 0.5)", "rgba(54, 162, 235, 0.5)", "rgba(153, 102, 255, 0.5)", "rgba(201, 203, 207, 0.5)"],
									"borderColor": ["rgb(255, 118, 118)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(83, 230, 157)", "rgb(44, 171, 227)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"],
									"borderWidth": 3
								}
								]
							},
							"options": {
								"scales": {
									"yAxes": [{
										"ticks": {
											max: 5,
											min: 0,
											stepSize: 0.5
										}
									}]
								}
							}
						});
					rate_chart.update();

					$('#chart5').remove();
					$('.canvas_father_4').append(`<canvas id="chart5" height="150"></canvas>`);
					var chart5 = document.getElementById("chart5").getContext("2d");
					age_chart = new Chart(
						chart5,
						{
							"type": "doughnut",
							"data": {
								"labels": ["Male", "Female"],
								"datasets": [{
									"label": "Review By Users Gender",
									"data": [res.review_by_gender.male, res.review_by_gender.female],
									"backgroundColor": ["rgb(44, 171, 227)", "rgb(255, 118, 118)"]
								}
								]
							}
						});
					age_chart.update();
				}
			});
		}
	}

	$(document).ready(function () {
		$('#restaurants').select2();
		let a = $('#restaurants').find("option").eq(0);
		if (a.val() != undefined) {
			$("#restaurants").val(a.val());
			send(a);
		}
	})
</script>
