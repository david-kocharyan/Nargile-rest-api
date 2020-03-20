<!--Featured offers-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Featured Offers</h3>

			<div class="table-responsive">
				<table id="featured_table" class="table table-striped text-nowrap">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Featured offer text</th>
						<th>Click Quantity</th>
						<th>Country</th>
						<th>Region</th>
						<th>Status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($featured as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->name; ?></td>
							<td><?= $value->text; ?></td>
							<td><?= $value->quantity; ?></td>
							<td>
								<?php if ($value->country) {
									echo $value->country;
								} else {
									echo "Empty";
								} ?>
							</td>

							<td>
								<?php if ($value->reg_name) {
									echo $value->reg_name;
								} else {
									echo "Empty";
								} ?>
							</td>
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
								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/offers/change-status-featured/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/offers/change-status-featured/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Activate"
									   class="btn btn-success btn-circle tooltip-success"><i
											class="fa fa-power-off"></i></a>
								<?php } ?>
							</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!--Hour offers-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Hour Offers</h3>

			<div class="table-responsive">
				<table id="hour_table" class="table table-striped text-nowrap">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Hour offer text</th>
						<th>Click Quantity</th>
						<th>Country</th>
						<th>Region</th>
						<th>Status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($hour as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->name; ?></td>
							<td><?= $value->text; ?></td>
							<td><?= $value->quantity; ?></td>
							<td>
								<?php if ($value->country) {
									echo $value->country;
								} else {
									echo "Empty";
								} ?>
							</td>
							<td>
								<?php if ($value->reg_name) {
									echo $value->reg_name;
								} else {
									echo "Empty";
								} ?>
							</td>

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
								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/offers/change-status-hour/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/offers/change-status-hour/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Activate"
									   class="btn btn-success btn-circle tooltip-success"><i
											class="fa fa-power-off"></i></a>
								<?php } ?>
							</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!--Coins offer-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Coin Offers</h3>

			<div class="table-responsive">
				<table id="coin_table" class="table table-striped text-nowrap">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Description</th>
						<th>Valid date</th>
						<th>Price</th>
						<th>Count</th>
						<th>Country</th>
						<th>Region</th>
						<th>Status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($coins as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->name; ?></td>
							<td><?= $value->description; ?></td>
							<td><?= date( "Y-m-d", $value->valid_date ); ?></td>
							<td><?= $value->price; ?></td>
							<td><?= $value->count; ?></td>

							<td>
								<?php if ($value->country) {
									echo $value->country;
								} else {
									echo "Empty";
								} ?>
							</td>

							<td>
								<?php if ($value->reg_name) {
									echo $value->reg_name;
								} else {
									echo "Empty";
								} ?>
							</td>
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
								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/offers/change-status-coins/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/offers/change-status-coins/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Activate"
									   class="btn btn-success btn-circle tooltip-success"><i
											class="fa fa-power-off"></i></a>
								<?php } ?>
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
	// offers table
	$('#featured_table').DataTable({
		columnDefs: [
			{"orderable": false, "targets": [1,2,4,5,6,7]},
		],
		initComplete: function () {
			this.api().columns([1, 4,5,6]).every(function () {
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

	$('#coin_table').DataTable({
		columnDefs: [
			{"orderable": false, "targets": [1,2,6,7,8,9]},
		],
		initComplete: function () {
			this.api().columns([1,6,7,8]).every(function () {
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

	$('#hour_table').DataTable({
		columnDefs: [
			{"orderable": false, "targets": [1,2,4,5,6,7]},
		],
		initComplete: function () {
			this.api().columns([1, 4, 5, 6]).every(function () {
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
