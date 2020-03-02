<!-- Date picker plugins css -->
<link href="<?= base_url('/public/')?>plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />

<!--page content-->
<div class="col-sm-12">
	<div class="white-box">
		<form action="<?= base_url("admin/sliders/store") ?>" method="post" enctype="multipart/form-data">

			<div class="form-group">
				<h3 class="box-title">Image</h3>
				<?php if ($this->session->flashdata('error')) { ?>
					<p class="text-danger">
						<?= $this->session->flashdata('error') ?>
					</p>
				<?php } ?>
				<input type="file" id="input-file-now-custom-1" class="dropify" name="image"/>
			</div>

			<div class="form-group">
				<label for="country">Region</label>
				<div class="input-group col-md-12">
					<select class="form-control region_slide" id="country" name="region">
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
				<label for="country">Clients</label>
				<div class="input-group col-md-12">
					<select class="form-control clients_slider" id="clients" name="client">
						<option value="" selected>Choose Clients</option>
						<?php foreach ($clients as $key) { ?>
							<option value="<?= $key->id ?>">
								<?= $key->first_name ." ". $key->last_name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="area">Area</label>
				<div class="input-group col-md-12">
					<select class="form-control area_slider" id="area" name="area">
						<option value="" selected>Choose Area</option>
						<?php foreach ($area as $key) { ?>
							<option value="<?= $key->id ?>">
								<?= $key->area_name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="restaurant">Restaurants</label>
				<div class="input-group col-md-12">
					<select class="form-control restaurant_slider" id="restaurant" name="restaurant">
						<option value="" selected>Choose Restaurant</option>
						<?php foreach ($restaurants as $key) { ?>
							<option value="<?= $key->id ?>">
								<?= $key->name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">Link</label>
				<input type="text" class="form-control" id="inputUsername" placeholder="www.aimtech.am" name="link"
					   value="<?= $this->input->post('link'); ?>">
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">Start Date</label>
				<input type="text" class="form-control" id="start" name="start"
					   value="<?= $this->input->post('start'); ?>">
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">End Date</label>
				<input type="text" class="form-control" id="end" name="end"
					   value="<?= $this->input->post('end'); ?>">
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
	$('#start, #end').datepicker({
		format: 'yyyy-mm-dd'
	});
</script>
