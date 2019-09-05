<!--page content-->
<div class="col-sm-12">
	<div class="white-box">
		<form action="<?= base_url("admin/sliders/store") ?>" method="post" enctype="multipart/form-data">

			<div class="col-md-12">
				<?php if (isset($this->errors)) { ?>
					<div class="alert-danger alert-dismissable">
						<?= $this->errors; ?>
					</div>
				<?php } ?>
				<div class="form-group">
					<label>Images (Choose Multiple) </label>
					<br>
					<input type="file" name="images[]" class="form-control" multiple>
				</div>
			</div>

			<div class="text-right">
				<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
			</div>
		</form>
	</div>
</div>

<div class="col-sm-12">
	<div class="white-box">
		<h3 class="box-title m-b-0">sliders Table</h3>
		<p class="text-muted m-b-15">All sliders in 1 place!!</p>

		<div class="table-responsive">
			<table id="myTable" class="table table-striped">
				<thead>
				<tr>
					<th>ID</th>
					<th>Image</th>
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
						<td><?= $value->status ?></td>
						<td>
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

