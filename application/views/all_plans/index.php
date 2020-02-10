<!--Featured offers-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">ALL RESTAURANT PLANS</h3>

			<div class="table-responsive">
				<table id="plans_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Plan</th>
						<th>Start Date</th>
						<th>Finish Date</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($plans as $key => $value) { ?>
						<?php if ($value->plan != 1) { ?>
							<tr>
								<td><?= $key + 1 ?></td>
								<td><?= $value->name; ?></td>
								<td>
									<?php if ($value->plan == 2) {
										echo "Bronze";
									} elseif ($value->plan == 3) {
										echo "Silver";
									} elseif ($value->plan == 4) {
										echo "Gold";
									} ?>
								</td>
								<td><?= $value->start_date; ?></td>
								<td><?= $value->finish_date; ?></td>
							</tr>
						<?php } ?>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!--Featured offers-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">ALL RESTAURANT PLANS History</h3>

			<div class="table-responsive">
				<table id="all_plans_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Plan</th>
						<th>Start Date</th>
						<th>Finish Date</th>
						<th>Status</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($all_plans as $key => $value) { ?>
						<?php if ($value->plan != 1) { ?>
							<tr>
								<td><?= $key + 1 ?></td>
								<td><?= $value->name; ?></td>
								<td>
									<?php if ($value->plan == 2) {
										echo "Bronze";
									} elseif ($value->plan == 3) {
										echo "Silver";
									} elseif ($value->plan == 4) {
										echo "Gold";
									} ?>
								</td>
								<td><?= $value->start_date; ?></td>
								<td><?= $value->finish_date; ?></td>
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
							</tr>
						<?php } ?>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<button class="ref">s</button>

<script>
	var all_plans = $('#all_plans_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([1, 2, 3, 4,5]).every(function () {
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
		}
	});

	$('#plans_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([1, 2, 3, 4]).every(function () {
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

