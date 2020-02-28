<!--Coins offer-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Coin Offers</h3>

			<div class="table-responsive">
				<table id="coin_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Description</th>
						<th>Valid date</th>
						<th>Price</th>
						<th>Count</th>
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
							<td><?= date("Y-m-d", $value->valid_date); ?></td>
							<td><?= $value->price; ?></td>
							<td><?= $value->count; ?></td>
							<td style="
									<?php if ($value->status == 0) {
								echo 'color: red;';
							} elseif ($value->status == 2) {
								echo 'color: rgb(93,50,50,1);';
							} else {
								echo 'color: green;';
							} ?>">
								<?php if ($value->status == 0) {
									echo "Inactive";
								} elseif ($value->status == 2) {
									echo "Pending";
								} else {
									echo "Active";
								} ?>
							</td>
							<td>

								<a href="<?= base_url("admin/coin-offers/approve-coin/$value->id") ?>"
								   data-toggle="tooltip"
								   data-placement="top" title="Deactivate"
								   class="btn btn-success btn-circle tooltip-success"><i class="fa fa-power-off"></i></a>

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
	$('#coin_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([1, 3, 4, 5, 6]).every(function () {
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
