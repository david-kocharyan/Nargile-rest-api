<div class="row">

	<div class="col-lg-3 col-sm-12 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Users</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-people text-info"></i></li>
				<li class="text-right"><span class="counter"><?= $widget['users'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-2 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Restaurants Count</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-folder-alt text-danger"></i></li>
				<li class="text-right"><span class=""><?= $widget['restaurant'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-2 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Share</h3>
			<ul class="list-inline two-part">
				<li><i class="ti-wallet text-success"></i></li>
				<li class="text-right"><span class=""><?= $widget['share'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-2 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Rate</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-trophy text-info"></i></li>
				<li class="text-right"><span class="counter"><?= $widget['rates'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-3 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Total Reviews</h3>
			<ul class="list-inline two-part">
				<li><i class="icon-folder text-purple"></i></li>
				<li class="text-right"><span class="counter"><?= $widget['reviews'] ?></span></li>
			</ul>
		</div>
	</div>

	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title">PLEASE CHOOSE A RESTAURANT TO VIEW STATISTICS</h3>
			<div>
				<select onchange="send($(this))" class="col-md-12" id="restaurants">
					<option value="">Choose Restaurants</option>
					<?php foreach ($restaurants as $bin => $key) { ?>
						<option class="sel<?= $bin; ?>" value="<?= $key->id ?>"><?= $key->name ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
	</div>
</div>


<div class="row chart_part">

	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title res_name text-center" style="letter-spacing: 0.5em; font-weight: bold; font-size: 27px;"></h3>
		</div>
	</div>

	<div class="col-lg-6 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Share</h3>
			<ul class="list-inline two-part">
				<li><i class=" icon-share text-purple"></i></li>
				<li class="text-right"><span class="counter share_ajax"></span></li>
			</ul>
		</div>
	</div>

	<div class="col-lg-6 col-sm-6 col-xs-12">
		<div class="white-box">
			<h3 class="box-title">Favorite</h3>
			<ul class="list-inline two-part">
				<li><i class=" icon-heart text-purple"></i></li>
				<li class="text-right"><span class="counter favorite_ajax"></span></li>
			</ul>
		</div>
	</div>

	<div class="col-sm-6">
		<div class="white-box">
			<h3 class="box-title">Rate Chart</h3>
			<div class="canvas_father_1">
				<canvas id="chart2" height="150"></canvas>
			</div>
		</div>
	</div>

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
</div>


<script>

	function send(_this){
	    let val = _this.val();
        var name = $("#restaurants option:selected").text();
	    if(val != null || val != "") {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                url: "<?= base_url('admin/statistics')?>",
                data: {id: val},
                success: function (data) {
                    var res = jQuery.parseJSON(JSON.stringify(data));

                    var rates = [res.rate.taste, res.rate.charcoal, res.rate.cleanliness, res.rate.staff, res.rate.value_for_money, res.rate.overall]
                    $('#chart2').remove();
                    $('.canvas_father_1').append(`<canvas id="chart2" height="150"></canvas>`);

                    var rate_chart = new Chart(
                        document.getElementById("chart2"),
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
                    // chart end

                    // pie chart
                    $('#chart3').remove();
                    $('.canvas_father_2').append(`<canvas id="chart3" height="150"></canvas>`);

                    var age_18 = 0, age_31 = 0, age_50 = 0, age_other = 0;
                    for (i = 0; i < res.rate_by_age.length; i++){
                        if (res.rate_by_age[i].age >= 18 && res.rate_by_age[i].age <= 30){
                            age_18 += 1;
                        }else if (res.rate_by_age[i].age >= 31 && res.rate_by_age[i].age < 50){
                            age_31 += 1;
                        }else if(res.rate_by_age[i].age > 50){
                            age_50 += 1;
                        }
                        else {
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
							"type": "pie",
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
							"type": "pie",
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

					$(".favorite_ajax").html(res.favorite);
					$(".share_ajax").html(res.share);
                    $(".res_name").html(name);
                }
            });
		}
	}

    $(document).ready(function () {
        $('#restaurants').select2();
        let a = $('#restaurants').find("option").eq(1);
        if(a.val() != undefined) {
            $("#restaurants").val(a.val());
            $('#restaurants').trigger('change.select2');
            send(a);
		}


    })
</script>
