<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Badges Table</h3>
			<p class="box-title m-b-30 btn btn-success btn-outline"><a
					href="<?= base_url("admin/badges/create") ?>" class="text-success">Add
					new Badge</a></p>

			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Image</th>
						<th>Info</th>
						<th>Count</th>
						<th>Type</th>
						<th>Status</th>
						<th>Option</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($badges as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td>
								<img src="<?= base_url('plugins/images/Badge/') . $value->image; ?>" alt="" width="200" height="200"
									 class="img-responsive">
							</td>
							<td><?= $value->info; ?></td>
							<td><?= $value->count; ?></td>
							<td><?= $value->type; ?></td>
							<td><?= $value->status; ?></td>
							<td>
								<a href="<?= base_url("admin/badges/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/badges/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/badges/change-status/$value->id") ?>"
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
