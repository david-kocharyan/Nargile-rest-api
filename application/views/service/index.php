<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<div class="m-b-30">
				<h3 class="box-title" style="display: inline-block;">Service</h3>
				<a href="<?= base_url("admin/service/edit/$service->id") ?>" data-toggle="tooltip"
				   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
						class="fas fa-pencil-alt"></i> </a>
			</div>

			<div class="table-responsive">
				<table class="table">
					<tbody>
					<tr>
						<td>Address</td>
						<td><?= $service->address ?></td>
					</tr>
					<tr>
						<td>Mobile Number</td>
						<td><?= $service->mobile_number ?></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><?= $service->email ?></td>
					</tr>
					<tr>
						<td>Latitude</td>
						<td><?= $service->lat ?></td>
					</tr>
					<tr>
						<td>Longitude</td>
						<td><?= $service->lng ?></td>
					</tr>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
