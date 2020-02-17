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
						<th>ID</th>
						<th>Restaurant name</th>
						<th>Area name</th>
						<th>Country name</th>
						<th>Logo</th>
						<th>Address</th>
						<th>Type</th>
						<th>Phone Number</th>
						<th>Status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($restaurants as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->name; ?></td>
							<td><?= $value->area_name; ?></td>
							<td><?= $value->country_name; ?></td>
							<td><img src="<?= base_url("plugins/images/Restaurants/" . $value->logo); ?>" width="200"
									 height="200" alt=""></td>
							<td><?= $value->address; ?></td>
							<td><?= $value->type; ?></td>
							<td><?= $value->phone_number; ?></td>
							<td style = "
									<?php if ($value->status == 0) {
								echo 'color: red;';
							} else {
								echo 'color: green;';
							} ?>"
							>
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

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/restaurants/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/restaurants/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Activate"
									   class="btn btn-success btn-circle tooltip-success"><i
											class="fa fa-power-off"></i></a>
								<?php } ?>

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
<script>
	$('#res_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([1, 2, 3, 5, 6, 7, 8]).every(function () {
				var column = this;
				var select = $('<select style="margin-left: 5px;"><option value="">All</option></select>')
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
</script>
