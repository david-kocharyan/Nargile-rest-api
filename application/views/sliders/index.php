<div class="col-sm-12">
	<div class="white-box">
		<h3 class="box-title m-b-0">sliders Table</h3>

		<p class="box-title m-b-30 btn btn-success btn-outline"><a
				href="<?= base_url("admin/sliders/create") ?>" class="text-success">Add New Image </a></p>

		<div class="table-responsive">
			<table id="myTable" class="table table-striped">
				<thead>
				<tr>
					<th>ID</th>
					<th>Image</th>
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
						<td><img src="<?= base_url('plugins/images/Slider/') ?><?= $value->image; ?>" alt="" width="200"
								 height="100" class="img-responsive">
						</td>
						<td><?= $value->region_id ?></td>
						<td><?= $value->link ?></td>
						<td><?= $value->start ?></td>
						<td><?= $value->end ?></td>
						<td><?= $value->status ?></td>
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

