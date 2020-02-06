<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Register new restaurant</h3>
			<?php if (!empty($this->session->flashdata('success'))) { ?>
				<p class="text-muted m-b-0">Register restaurant quickly and easily!</p>
				<p class="text-mutedv text-success m-b-30">    <?= $this->session->flashdata('success'); ?> </p>
			<?php } else { ?>
				<p class="text-muted m-b-30">Register restaurant quickly and easily!</p>
			<?php } ?>

			<form data-toggle="validator" action="<?php echo base_url() ?>admin/restaurants/store" method="post"
				  enctype="multipart/form-data">

				<div class="form-group">
					<label for="inputUsername" class="control-label">Name</label>
					<input type="text" class="form-control" id="inputUsername" placeholder="Restaurant Name" name="name"
						   required value="<?= $this->input->post('name'); ?>">
					<?php if (!empty(form_error('name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('name'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="area">Area</label>
					<?php if (!empty(form_error('area'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('area'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<select class="form-control select_2_example" id="area" name="area">
							<option value="" selected>Choose Here</option>
							<?php foreach ($area as $key) { ?>
								<option value="<?= $key->id ?>">
									<?= $key->area_name ?>
								</option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="inputType" class="control-label">Restaurant Type</label>
					<input type="text" class="form-control" id="inputType"
						   placeholder="Restaurant Type (resto-cafe, cafe, restaurant, hookah-cafe)" name="type"
						   required value="<?= $this->input->post('type'); ?>">
					<?php if (!empty(form_error('type'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('type'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputNumber" class="control-label">Phone Number</label>
					<input type="text" class="form-control" id="inputNumber" placeholder="Phone number"
						   name="phone_number"
						   required value="<?= $this->input->post('phone_number'); ?>">
					<?php if (!empty(form_error('phone_number'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('phone_number'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputAddress" class="control-label">Address</label>
					<input type="text" class="form-control" id="inputAddress" placeholder="Address" name="address"
						   required value="<?= $this->input->post('address'); ?>">
					<?php if (!empty(form_error('address'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('address'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group col-md-6">
					<label for="inputLat" class="control-label">Latitude</label>
					<input type="text" class="form-control" id="inputLat" placeholder="Latitude" name="lat"
						   required value="<?= $this->input->post('lat'); ?>">
					<?php if (!empty(form_error('lat'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('lat'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group col-md-6">
					<label for="inputLong" class="control-label">Longitude</label>
					<input type="text" class="form-control" id="inputLong" placeholder="Longitude" name="long"
						   required value="<?= $this->input->post('long'); ?>">
					<?php if (!empty(form_error('long'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('long'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="owner">Owner</label>
					<?php if (!empty(form_error('owner'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('owner'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<select class="form-control" id="owner" name="owner">
							<option>Choose owner</option>
							<?php foreach ($owner as $key) { ?>
								<option value="<?= $key->id ?>">
									<?= $key->username ?>
								</option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="input-file-now">Restaurant Logo</label>
					<input type="file" id="input-file-now" name="logo" class="dropify" data-max-file-size="15M"/>
					<?php if (!empty($this->session->flashdata('error'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= $this->session->flashdata('error') ?>
						</div>
					<?php } ?>
				</div>
				<hr>

				<div class="form-group">
					<label for="plan">Plans</label>
					<?php if (!empty(form_error('plan'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('plan'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<select class="form-control" id="plan" name="plan">
							<option value="1">No Plan</option>
							<option value="2">Bronze</option>
							<option value="3">Silver</option>
							<option value="4">Gold</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="daterange">Plans start and end date</label>
					<input class="form-control input-daterange-datepicker" type="text" name="daterange"
						   value=""/>
					<?php if (!empty(form_error('daterange'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('daterange'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!--daterangepicker-->
<link href="<?= base_url('public/plugins/bower_components/bootstrap-daterangepicker/daterangepicker.css')?>" rel="stylesheet">
<script src="<?= base_url('public/plugins/bower_components/moment/moment.js')?>"></script>
<script src="<?= base_url('public/plugins/bower_components/bootstrap-daterangepicker/daterangepicker.js')?>"></script>

<script>
	// Daterange picker
	$('.input-daterange-datepicker').daterangepicker({
		buttonClasses: ['btn', 'btn-sm'],
		applyClass: 'btn-danger',
		cancelClass: 'btn-inverse',
	});
</script>
