<div class="row">
	<div class="col-lg-4 col-sm-12 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Users</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-people text-info"></i></li>
				<li class="text-right"><span class="counter"><?= $widget['users'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-2 col-sm-12 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Share</h3>
			<ul class="list-inline two-part">
				<li><i class="ti-wallet text-success"></i></li>
				<li class="text-right"><span class=""><?= $widget['share'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-2 col-sm-12 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Rate</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-trophy text-info"></i></li>
				<li class="text-right"><span class="counter"><?= $widget['rates'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-4 col-sm-12 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Reviews</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-folder text-purple"></i></li>
				<li class="text-right"><span class="counter"><?= $widget['reviews'] ?></span></li>
			</ul>
		</div>
	</div>
</div>

<div class="row chart_part">

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

	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Review By Users Gender Chart</h3>
			<div class="canvas_father_4">
				<canvas id="chart5" height="150"></canvas>
			</div>
		</div>
	</div>

	<div class="col-lg-6">
		<div class="white-box">
			<h3 class="box-title">Gender Range Male vs Female of all users </h3>
			<div class="canvas_father_6">
				<canvas id="chart7" height="150"></canvas>
			</div>
		</div>
	</div>
</div>

<div class="row map_part">
	<div id="map" class="col-md-12" style="height: 500px;"></div>
</div>

<script src="https://maps.google.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyDsz2KPO5FSf6PDx2YwCTtB1HBt2DkXFrY"
		type="text/javascript"></script>

<script type="text/javascript">

	var locations = <?php echo json_encode($restaurants_map); ?>;
	locations = JSON.parse(locations)

	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 14,
		center: new google.maps.LatLng(33.89, 35.50),
		mapTypeId: google.maps.MapTypeId.ROADMAP
	});

	var infowindow = new google.maps.InfoWindow();

	var marker, i;

	for (i = 0; i < locations.length; i++) {
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			map: map
		});

		google.maps.event.addListener(marker, 'click', (function (marker, i) {
			return function () {
				infowindow.setContent(locations[i][0]);
				infowindow.open(map, marker);
			}
		})(marker, i));
	}

</script>

<script>
	$(document).ready(function ()  {
		let val = 1;
		if (val != null || val != "") {
			$.ajax({
				type: 'POST',
				dataType: 'json',
				url: "<?= base_url('admin/statistics')?>",
				data: {id: val},
				success: function (data) {
					var res = jQuery.parseJSON(JSON.stringify(data));

					// pie chart
					$('#chart3').remove();
					$('.canvas_father_2').append(`<canvas id="chart3" height="150"></canvas>`);

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
						document.getElementById("chart3"),
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
					// chart end

					// pie chart rate by gender
					$('#chart4').remove();
					$('.canvas_father_3').append(`<canvas id="chart4" height="150"></canvas>`);
					age_chart = new Chart(
						document.getElementById("chart4"),
						{
							"type": "doughnut",
							"data": {
								"labels": ["Male", "Female"],
								"datasets": [{
									"label": "Rate By Users Gender",
									"data": [res.rate_by_gender.male, res.rate_by_gender.female],
									"backgroundColor": ["rgb(255, 118, 118)", "rgb(255, 205, 86)"]
								}
								]
							}
						});
					age_chart.update();
					// chart end

					// pie chart reviews by gender
					$('#chart5').remove();
					$('.canvas_father_4').append(`<canvas id="chart5" height="150"></canvas>`);
					age_chart = new Chart(
						document.getElementById("chart5"),
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
					// chart end

					// doughnut chart offers click
					$('#chart7').remove();
					$('.canvas_father_6').append(`<canvas id="chart7" height="150"></canvas>`);
					age_chart = new Chart(
						document.getElementById("chart7"),
						{
							"type": "pie",
							"data": {
								"labels": ["Male", "Female"],
								"datasets": [{
									"label": "Gender",
									"data": [res.gender_all.male, res.gender_all.female],
									"backgroundColor": ["rgb(0, 80, 133)", "rgb(180, 30, 105)"]
								}
								]
							}
						});
					age_chart.update();
					// chart end

					$(".favorite_ajax").html(res.favorite);
					$(".share_ajax").html(res.share);
					$(".rate_ajax").html(res.rate_count);
					$(".reviews_ajax").html(res.review_count);
					$(".res_name").html(name);
				}
			});
		}
	})

	$(document).ready(function () {
		$('#restaurants').select2();
		let a = $('#restaurants').find("option").eq(1);
		if (a.val() != undefined) {
			$("#restaurants").val(a.val());
			$('#restaurants').trigger('change.select2');
			send(a);
		}


	})
</script>
