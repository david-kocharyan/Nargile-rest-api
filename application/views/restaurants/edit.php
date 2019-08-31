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
					<input type="text" class="form-control" id="inputUsername" placeholder=Name name="name" value="<?= $restaurant->name ?>"
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
					<label for="input-file-now">Clients Logo</label>
					<input type="file" id="input-file-now" name="logo" class="dropify" data-max-file-size="15M">
					<img src="<?= base_url('plugins/images/Restaurants/') ?><?= $restaurant->logo ?> " class="m-t-15" alt="logo" width="200" height="200">
					<?php if (!empty($this->session->flashdata('error'))) { ?>
						<div class=" help-block with-errors text-danger">
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

