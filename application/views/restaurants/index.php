<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Restaurants Table</h3>
			<p class="text-muted m-b-15">All clients in 1 place!!</p>
			<p class="box-title m-b-30"><a href="<?= base_url("admin/restaurants/create")?>" class="text-success">Add new Restaurants</a></p>

			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant name</th>
						<th>Area name</th>
						<th>Country name</th>
						<th>Logo</th>
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
							<td><img src="<?= base_url("plugins/images/Restaurants/".$value->logo); ?>"  width="200" height="200" alt=""></td>
							<td><?= $value->status; ?></td>
							<td>
								<a href="<?= base_url("admin/restaurants/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/restaurants/change-status/$value->id") ?>" data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/restaurants/change-status/$value->id") ?>" data-toggle="tooltip"
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
