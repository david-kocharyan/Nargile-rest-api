<!-- Date picker plugins css -->
<link href="<?= base_url('/public/')?>plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />

<!--page content-->
<div class="col-sm-12">
	<div class="white-box">
		<form action="<?= base_url("admin/sliders/update/") . $slider->id ?>" method="post"
			  enctype="multipart/form-data">

			<div class="form-group">
				<h3 class="box-title">Image</h3>
				<?php if ($this->session->flashdata('error')) { ?>
					<p class="text-danger">
						<?= $this->session->flashdata('error') ?>
					</p>
				<?php } ?>
				<input type="file" id="input-file-now-custom-1" class="dropify" name="image"
					   data-default-file="<?= base_url("plugins/images/Slider/").$slider->image ?>"/>
			</div>

			<div class="form-group">
				<label for="country">Region</label>
				<div class="input-group col-md-12">
					<select class="form-control select_2_example" id="country" name="region">
						<option value="" selected>Choose Here</option>
						<?php foreach ($region as $key) { ?>
							<option
								value="<?= $key->id ?>" <?php if ($key->id == $slider->region_id) echo "selected"; ?>>
								<?= $key->name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="country">Clients</label>
				<div class="input-group col-md-12">
					<select class="form-control select_2_example" id="clients" name="client">
						<option value="" selected>Choose Clients</option>
						<?php foreach ($clients as $key) { ?>
							<option value="<?= $key->id ?>" <?php if ($key->id == $slider->client_id) echo "selected"; ?>>
								<?= $key->first_name ." ". $key->last_name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="country">Country</label>
				<div class="input-group col-md-12">
					<select class="form-control select_2_example" id="country" name="country">
						<option value="" selected>Choose Country</option>
						<?php foreach ($country as $key) { ?>
							<option value="<?= $key->name ?>" <?php if ($key->name == $slider->country) echo "selected"; ?>>
								<?= $key->name ?>
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
							<option
								value="<?= $key->id ?>" <?php if ($key->id == $slider->region_id) echo "selected"; ?>>
								<?= $key->name ?>
							</option>
						<?php } ?>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">Link</label>
				<input type="text" class="form-control" id="inputUsername" placeholder="aimtech.am" name="link"
					   value="<?= $slider->link ?>">
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">Start Date</label>
				<input type="text" class="form-control" id="start" name="start"
					   value="<?= $slider->start ?>">
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">End Date</label>
				<input type="text" class="form-control" id="end" name="end"
					   value="<?= $slider->end ?>">
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
