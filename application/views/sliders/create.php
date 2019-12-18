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
					<select class="form-control select_2_example" id="country" name="region">
						<option value="" selected>Choose Here</option>
						<?php foreach ($region as $key) { ?>
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
				<label for="inputUsername" class="control-label">Start Date</label>
				<input type="date" class="form-control" id="inputUsername" name="start"
					   value="<?= $this->input->post('start'); ?>">
			</div>

			<div class="form-group">
				<label for="inputUsername" class="control-label">End Date</label>
				<input type="date" class="form-control" id="inputUsername" name="end"
					   value="<?= $this->input->post('end'); ?>">
			</div>

			<div class="text-right">
				<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
			</div>
		</form>
	</div>
</div>
