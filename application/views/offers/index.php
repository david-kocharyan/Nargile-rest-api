<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Offers Table</h3>
			<p class="text-muted m-b-30">All offers in 1 place!!</p>
            <p class="box-title m-b-30"><a href="<?= base_url("admin/offers/create") ?>" class="text-success">Add new Offer</a></p>
			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant</th>
						<th>Offer Type</th>
						<th>Text</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($offers as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->restaurant_name; ?></td>
							<td><?= $value->type == 1 ? 'Featured Offer' : 'Happy Hour Deals'; ?></td>
							<td><?= $value->text; ?></td>
							<td>
								<a href="<?= base_url("admin/offers/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>
								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/offers/change-status/$value->id") ?>" data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/offers/change-status/$value->id") ?>" data-toggle="tooltip"
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































