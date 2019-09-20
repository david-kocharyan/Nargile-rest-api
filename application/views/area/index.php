<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Areas Table</h3>
			<p class="text-muted m-b-15">All Areas in 1 place!!</p>
			<p class="box-title m-b-30"><a href="<?= base_url("admin/area/create") ?>" class="text-success">Add new
					Area</a></p>

			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Area name</th>
						<th>Country name</th>
						<th>Status </th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($area as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->area_name; ?></td>
							<td><?= $value->country_name; ?></td>
							<td><?= $value->area_status; ?></td>
							<td>
								<a href="<?= base_url("admin/area/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->area_status == 1) { ?>
									<a href="<?= base_url("admin/area/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/area/change-status/$value->id") ?>"
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
