<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Restaurants Table</h3>
			<p class="text-muted m-b-15">All restaurants in 1 place!!</p>

			<?php if ($user['role'] == 'superAdmin') { ?>
				<p class="box-title m-b-30 btn btn-success btn-outline"><a
						href="<?= base_url("admin/restaurants/create") ?>" class="text-success">Add
						new Restaurants</a></p>
			<?php } ?>

			<div class="table-responsive">
				<table id="res_table" class="table table-striped">
					<thead>
					<tr>
						<th value="ID">ID</th>
						<th value="Logo">Logo</th>
						<th value="Clients Name"></th>
						<th value="Clients Email"></th>
						<th value="Clients Mobile NUmber"></th>
						<th value="Restaurant"></th>
						<th value="City"></th>
						<th value="Country"></th>
						<th value="Region"></th>
						<th value="Address"></th>
						<th value="Type"></th>
						<th value="Phone"></th>
						<th value="Favorite"></th>
						<th value="Share"></th>
						<th value="Rate count"></th>
						<th value="Review count"></th>
						<th value="Rate Overall"></th>
						<th value="Rate Taste"></th>
						<th value="Rate Charcoal"></th>
						<th value="Rate Cleanliness"></th>
						<th value="Rate Staff"></th>
						<th value="Rate Value for money"></th>
						<th value="Offers Hour"></th>
						<th value="Offers Featured"></th>
						<th value="Offers Nearest"></th>
						<th value="Offers Top"></th>
						<th value="Res Click Menu"></th>
						<th value="Res Click Direction"></th>
						<th value="Res Click Review"></th>
						<th value="Res Click Call"></th>

						<th value="Status"></th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($restaurants as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><img src="<?= base_url("plugins/images/Restaurants/" . $value->logo); ?>"
									 style="border-radius: 50%; height: 80px; width: 80px; "></td>
							<td><?php if (!empty($value->admin)) echo $value->admin->first_name . " " . $value->admin->last_name; ?></td>
							<td><?php if (!empty($value->admin)) echo $value->admin->email; ?></td>
							<td><?php if (!empty($value->admin)) echo $value->admin->mobile_number; ?></td>

							<td><?= $value->name; ?></td>
							<td><?= $value->area_name; ?></td>
							<td><?= $value->country_name; ?></td>
							<td><?= $value->region_name; ?></td>
							<td><?= $value->address; ?></td>
							<td><?= $value->type; ?></td>
							<td><?= $value->phone_number; ?></td>

							<td> <?= $value->favorite; ?> </td>
							<td> <?= $value->share; ?> </td>
							<td> <?= $value->rate_count; ?> </td>
							<td> <?= $value->review_count; ?> </td>

							<td> <?php if (!empty($value->rate)) echo $value->rate->overall; ?> </td>
							<td> <?php if (!empty($value->rate)) echo $value->rate->taste; ?> </td>
							<td> <?php if (!empty($value->rate)) echo $value->rate->charcoal; ?> </td>
							<td> <?php if (!empty($value->rate)) echo $value->rate->cleanliness; ?> </td>
							<td> <?php if (!empty($value->rate)) echo $value->rate->staff; ?> </td>
							<td> <?php if (!empty($value->rate)) echo $value->rate->value_for_money; ?> </td>

							<td> <?php if (!empty($value->offers)) echo $value->offers['hour']; ?> </td>
							<td> <?php if (!empty($value->offers)) echo $value->offers['featured']; ?> </td>
							<td> <?php if (!empty($value->offers)) echo $value->offers['nearest']; ?> </td>
							<td> <?php if (!empty($value->offers)) echo $value->offers['top']; ?> </td>

							<td> <?php if (!empty($value->res_click)) echo $value->res_click['menu']; ?> </td>
							<td> <?php if (!empty($value->res_click)) echo $value->res_click['direction']; ?> </td>
							<td> <?php if (!empty($value->res_click)) echo $value->res_click['review']; ?> </td>
							<td> <?php if (!empty($value->res_click)) echo $value->res_click['call']; ?> </td>

							<td style="
									<?php if ($value->status == 0) {
								echo 'color: red;';
							} else {
								echo 'color: green;';
							} ?>">
								<?php if ($value->status == 0) {
									echo "Inactive";
								} else {
									echo "Active";
								} ?>
							</td>
							<td>
								<a href="<?= base_url("admin/restaurants/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($user['role'] == 'superAdmin') { ?>
									<?php if ($value->status == 1) { ?>
										<a href="<?= base_url("admin/restaurants/change-status/$value->id") ?>"
										   data-toggle="tooltip"
										   data-placement="top" title="Deactivate"
										   class="btn btn-danger btn-circle tooltip-danger"><i
												class="fa fa-power-off"></i></a>
									<?php } else { ?>
										<a href="<?= base_url("admin/restaurants/change-status/$value->id") ?>"
										   data-toggle="tooltip"
										   data-placement="top" title="Activate"
										   class="btn btn-success btn-circle tooltip-success"><i
												class="fa fa-power-off"></i></a>
									<?php }
								} ?>

								<a href="<?= base_url("admin/restaurants/show/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="All info about current restaurant"
								   class="btn btn-outline btn-primary btn-circle tooltip-primary"> <i
										class="fas fa-eye"></i> </a>
							</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- start - This is for export functionality only -->
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<!-- end - This is for export functionality only -->

<script>
	$('#res_table').DataTable({
		dom: 'Bfirtlp',
		buttons: [
			{
				extend: 'excel',
				text: 'Excel',
				title: 'Clients table',
				filename: 'restaurants_table',
				exportOptions: {
					columns: ":visible",
					format: {
						header: function (data, column, row) {
							return data.substring(data.indexOf("value") + 9, data.indexOf("</option>"));
						}
					}

				}
			},
		],
		"ordering": false,
		initComplete: function () {
			this.api().columns([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]).every(function () {
				var column = this;
				var eachHeader = $(column.header())[0];
				var headingVal = eachHeader.getAttribute("value");
				var select = $('<select><option value="">' + headingVal + '</option></select>')
					.appendTo($(column.header()))
					.on('change', function () {
						var val = $.fn.dataTable.util.escapeRegex(
							$(this).val()
						);

						column
							.search(val ? '^' + val + '$' : '', true, false)
							.draw();
					});

				column.data().unique().sort().each(function (d, j) {
					select.append('<option value="' + d + '">' + d + '</option>')
				});
			});
		},
	});
	$('.buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel').addClass('btn btn-primary m-r-5 m-t-5');
</script>
