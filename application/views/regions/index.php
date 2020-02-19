<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Regions Table</h3>
			<p class="box-title m-b-30"><a href="<?= base_url("admin/regions/create") ?>" class="text-success">Add new
					Regions</a></p>


			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Region name</th>
						<th>Status </th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($region as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->name; ?></td>
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
									<a href="<?= base_url("admin/regions/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/regions/change-status/$value->id") ?>"
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
