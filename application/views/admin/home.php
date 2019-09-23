<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-15">Request for the owner of restaurant</h3>

			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Restaurant ID</th>
						<th>Restaurant Name</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Mobile Number</th>
						<th>Email</th>
						<th>Position</th>
						<th>Owner First Name</th>
						<th>Owner Last Name</th>
						<th>Owner mobile</th>
						<th>Owner Email</th>
						<th>Report</th>
						<th>Status</th>
						<th>How to contact the owner</th>
						<th>Created At</th>
						<th>Option</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($business as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->restaurant_id; ?></td>
							<td><?= $value->restaurant_name; ?></td>
							<td><?= $value->first_name; ?></td>
							<td><?= $value->last_name; ?></td>
							<td><?= $value->mobile_number; ?></td>
							<td><?= $value->email; ?></td>
							<td><?= $value->position; ?></td>
							<td><?= $value->owner_first; ?></td>
							<td><?= $value->owner_last; ?></td>
							<td><?= $value->owner_mobile; ?></td>
							<td><?= $value->owner_email; ?></td>
							<td><?= $value->report; ?></td>

							<td>
								<?php if ($value->status == 0) { ?>
									<strong>Reject</strong>
								<?php } ?>

								<?php if ($value->status == 1) { ?>
									<strong>Not watching yet</strong>
								<?php } ?>
							</td>

							<td>
								<?php if ($value->via_mobile == 1) { ?>
									<strong>Mobile</strong> <br/>
								<?php } ?>

								<?php if ($value->via_whatsapp == 1) { ?>
									<strong>Whatsapp</strong> <br/>
								<?php } ?>

								<?php if ($value->via_email == 1) { ?>
									<strong>Email</strong> <br/>
								<?php } ?>
							</td>

							<td><?= $value->created_at; ?></td>

							<td>
								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/owner/create/$value->id") ?>"
									   data-toggle="tooltip" data-placement="top" title="Approve"
									   class="btn btn-primary btn-circle tooltip-primary"><i
											class="fas fa-paint-brush"></i></a>
								<?php } ?>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/owner/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Reject"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/owner/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Resolve"
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
