<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Edit client</h3>

			<?php if (!empty($this->session->flashdata('success'))) { ?>
				<p class="text-muted m-b-0">Edit client quickly and easily!</p>
				<p class="text-mutedv text-success m-b-30">  <?= $this->session->flashdata('success'); ?> </p>
			<?php } else { ?>
				<p class="text-muted m-b-30">Register clients quickly and easily!</p>
			<?php } ?>

			<form data-toggle="validator"
				  action="<?php echo base_url() ?>admin/restaurants/update/<?= $restaurant->id ?>"
				  method="post"
				  enctype="multipart/form-data">

				<div class="form-group">
					<label for="inputUsername" class="control-label">Name</label>
					<input type="text" class="form-control" id="inputUsername" placeholder=Name name="name"
						   value="<?= $restaurant->name ?>"
						   required>
					<?php if (!empty(form_error('name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('name'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="country">Area</label>
					<?php if (!empty(form_error('area'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('area'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<select class="form-control select_2_example" id="country" name="area">
							<?php foreach ($area as $key) { ?>
								<option value="<?= $key->id ?>"
									<?php if ($key->id == $restaurant->area_id) { ?>
										selected
									<?php } ?>
								>
									<?= $key->area_name ?>
								</option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="inputNumber" class="control-label">Phone Number</label>
					<input type="text" class="form-control" id="inputNumber" placeholder="Phone number" name="phone_number"
						   required value="<?= $restaurant->phone_number ?>">
					<?php if (!empty(form_error('phone_number'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('phone_number'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputAddress" class="control-label">Address</label>
					<input type="text" class="form-control" id="inputAddress" placeholder="Address" name="address"
						   required value="<?= $restaurant->address ?>">
					<?php if (!empty(form_error('address'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('address'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group col-md-6">
					<label for="inputLat" class="control-label">Latitude</label>
					<input type="text" class="form-control" id="inputLat" placeholder="Latitude" name="lat"
						   required value="<?= $restaurant->lat ?>">
					<?php if (!empty(form_error('lat'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('lat'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group col-md-6">
					<label for="inputLong" class="control-label">Longitude</label>
					<input type="text" class="form-control" id="inputLong" placeholder="Longitude" name="lng"
						   required value="<?= $restaurant->lng ?>">
					<?php if (!empty(form_error('lng'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('lng'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="country">Owner</label>
					<?php if (!empty(form_error('owner'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('owner'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<select class="form-control select_2_example" id="country" name="owner">
							<?php foreach ($owner as $key) { ?>
								<option value="<?= $key->id ?>"
									<?php if ($key->id == $restaurant->admin_id) { ?>
										selected
									<?php } ?>
								>
									<?= $key->username ?>
								</option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="input-file-now">Restaurant Logo</label>
					<input type="file" id="input-file-now" name="logo" class="dropify" data-max-file-size="15M">
					<img src="<?= base_url('plugins/images/Restaurants/') ?><?= $restaurant->logo ?> " class="m-t-15"
						 alt="logo" width="200" height="200">
					<?php if (!empty($this->session->flashdata('error'))) { ?>
						<div class=" help-block with-errors text-danger">
							<?= $this->session->flashdata('error') ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<?php if (isset($this->errors)) { ?>
						<div class="alert-danger alert-dismissable">
							<?= $this->errors; ?>
						</div>
					<?php } ?>
					<label>Images (Choose Multiple) </label>
					<br>
					<input type="file" name="images[]" class="form-control" multiple>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
		<div class="white-box">

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
					<?php foreach ($restaurant_images as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><img src="<?= base_url('plugins/images/Restaurant_images/') ?><?= $value->image; ?>" alt=""
									 width="200"
									 height="100" class="img-responsive">
							</td>
							<td><?= $value->status ?></td>
							<td>
								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/restaurants/change-status-image/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/restaurants/change-status-image/$value->id") ?>"
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

