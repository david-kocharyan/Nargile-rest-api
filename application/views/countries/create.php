<div class="col-md-4 col-sm-12">
	<div class="white-box">
		<h3 class="box-title m-b-0">Add new countries</h3>

		<?php if (!empty($this->session->flashdata('success'))) { ?>
			<p class="text-muted m-b-30 font-13"> Add new countries quickly and easily! </p>
			<p class="text-mutedv text-success m-b-30">  <?= $this->session->flashdata('success'); ?> </p>
		<?php } else { ?>
			<p class="text-muted m-b-30 font-13"> Add new countries quickly and easily! </p>
		<?php } ?>

		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<form action="<?= base_url("admin/countries/store") ?>" method="post">

					<div class="form-group">
						<label for="country">Country Name</label>
						<?php if (!empty(form_error('country'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('country'); ?>
							</div>
						<?php } ?>
						<div class="input-group">
							<input type="text" class="form-control" id="country" placeholder="Country name"
								   name="country">
							<div class="input-group-addon"><i class="ti-world"></i></div>
						</div>
					</div>

					<div class="text-right">
						<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
						<a href="<?= base_url("admin/countries") ?>">
							<button type="button" class="btn btn-inverse waves-effect waves-light">Return</button>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
