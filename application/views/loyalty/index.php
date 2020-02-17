<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Loyalty cards table</h3>
			<p class="box-title m-b-30 btn btn-success btn-outline">
				<a href="<?= base_url("admin/loyalty/create") ?>" class="text-success">Create new loyalty card</a>
			</p>

			<div class="table-responsive">
				<table id="loyalty_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Description</th>
						<th>Valid Date</th>
						<th>Percent %</th>
						<th>QR</th>
						<th>Status</th>
						<th>Option</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($loyalty as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value ->res_id ?></td>
							<td><?= $value->desc; ?></td>
							<td><?= date('Y-m-d',$value->valid_date) ?></td>
							<td><?= $value->percent; ?></td>
							<td>
								<img src="<?= base_url('plugins/images/QR/') . $value->qr; ?>" alt="" width="200" height="200"
									 class="img-responsive">
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
								<a href="<?= base_url("admin/loyalty/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/loyalty/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/loyalty/change-status/$value->id") ?>"
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
	$('#loyalty_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([1, 2, 3, 4, 6]).every(function () {
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
