<div class="col-sm-12">
	<div class="white-box">
		<h3 class="box-title m-b-0">sliders Table</h3>

		<p class="box-title m-b-30 btn btn-success btn-outline"><a
				href="<?= base_url("admin/sliders/create") ?>" class="text-success">Add New Image </a></p>

		<p class="box-title m-b-30 btn btn-primary btn-outline"><a
				href="<?= base_url("admin/sliders-calendar") ?>" class="text-primary">Calendar</a></p>

		<div class="table-responsive">
			<table id="slider_table" class="table table-striped">
				<thead>
				<tr>
					<th>ID</th>
					<th>Image</th>
					<th>Clients</th>
					<th>City</th>
					<th>Country</th>
					<th>Region</th>
					<th>Link</th>
					<th>Start</th>
					<th>End</th>
					<th>Status</th>
					<th>Options</th>
				</tr>
				</thead>
				<tbody>
				<?php foreach ($sliders as $key => $value) { ?>
					<tr>
						<td><?= $key + 1 ?></td>
						<td><img src="<?= base_url('plugins/images/Slider/') ?><?= $value->image; ?>" style="width: 100px; height: 100px">
						</td>
						<td><?= $value->first_name ." ". $value->last_name ?></td>
						<td><?= $value->area_name ?></td>
						<td><?= $value->country_name ?></td>
						<td><?= $value->region_name ?></td>
						<td><?= $value->link ?></td>
						<td><?= $value->start ?></td>
						<td><?= $value->end ?></td>
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
							<a href="<?= base_url("admin/sliders/edit/$value->id") ?>" data-toggle="tooltip"
							   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
									class="fas fa-pencil-alt"></i> </a>

							<?php if ($value->status == 1) { ?>
								<a href="<?= base_url("admin/sliders/change-status/$value->id") ?>"
								   data-toggle="tooltip"
								   data-placement="top" title="Deactivate"
								   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
							<?php } else { ?>
								<a href="<?= base_url("admin/sliders/change-status/$value->id") ?>"
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

<script>
	$('#slider_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([2, 3, 4, 5, 6]).every(function () {
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
