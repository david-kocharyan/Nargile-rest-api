<!-- Date picker plugins css -->
<link href="<?= base_url('/public/')?>plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />

<!--page content-->
<div class="col-sm-12">
	<div class="white-box">
		<form action="<?= base_url("admin/video/store") ?>" method="post" enctype="multipart/form-data">

			<div class="form-group">
				<h3 class="box-title">Video</h3>
				<?php if ($this->session->flashdata('error')) { ?>
					<p class="text-danger">
						<?= $this->session->flashdata('error') ?>
					</p>
				<?php } ?>
				<input type="file" id="input-file-now-custom-1" name="video"/>
			</div>

			<div class="form-group">
				<label for="country">Region</label>
				<?php if (!empty(form_error('region'))) { ?>
					<div class="help-block with-errors text-danger">
						<?= form_error('region'); ?>
					</div>
				<?php } ?>
				<div class="input-group col-md-12">
					<select class="form-control region_slide" id="region" name="region">
						<option value="" selected>Choose Region</option>
						<?php foreach ($region as $key) { ?>
							<option value="<?= $key->id ?>">
								<?= $key->name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="area">Country</label>
				<?php if (!empty(form_error('country'))) { ?>
					<div class="help-block with-errors text-danger">
						<?= form_error('country'); ?>
					</div>
				<?php } ?>
				<div class="input-group col-md-12">
					<select class="form-control area_slider" id="country" name="country">
						<option value="" selected>Choose Country</option>
						<?php foreach ($country as $key) { ?>
							<option value="<?= $key->name ?>">
								<?= $key->name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="restaurant">Restaurants</label>
				<?php if (!empty(form_error('restaurant'))) { ?>
					<div class="help-block with-errors text-danger">
						<?= form_error('restaurant'); ?>
					</div>
				<?php } ?>
				<div class="input-group col-md-12">
					<select class="form-control restaurant_slider" id="restaurant" name="restaurant">
						<option value="" selected>Choose Restaurant</option>
						<?php foreach ($restaurant as $key) { ?>
							<option value="<?= $key->id ?>">
								<?= $key->name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">Link</label>
				<input type="text" class="form-control" id="inputUsername" placeholder="aimtech.am" name="link"
					   value="<?= $this->input->post('link'); ?>">
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">Show count</label>
				<?php if (!empty(form_error('show'))) { ?>
					<div class="help-block with-errors text-danger">
						<?= form_error('show'); ?>
					</div>
				<?php } ?>
				<input type="number" class="form-control" id="inputShow" name="show"
					   value="<?= $this->input->post('show'); ?>">
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">Valid Date</label>
				<?php if (!empty(form_error('date'))) { ?>
					<div class="help-block with-errors text-danger">
						<?= form_error('date'); ?>
					</div>
				<?php } ?>
				<input type="text" class="form-control" id="date" name="date"
					   value="<?= $this->input->post('date'); ?>">
			</div>

			<div class="text-right">
				<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
			</div>
		</form>
	</div>
</div>

<!-- Date Picker Plugin JavaScript -->
<script src="<?= base_url('/public/')?>plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script>
	$('#date').datepicker({
		format: 'yyyy-mm-dd'
	});
</script>
