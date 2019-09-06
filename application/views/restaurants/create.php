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
					<input type="text" class="form-control" id="inputUsername" placeholder="Username" name="name"
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
					<label for="input-file-now">Clients Logo</label>
					<input type="file" id="input-file-now" name="logo" class="dropify" data-max-file-size="15M"/>
					<?php if (!empty($this->session->flashdata('error'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= $this->session->flashdata('error') ?>
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


