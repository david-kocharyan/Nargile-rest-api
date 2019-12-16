<div class="col-md-4 col-sm-12">
	<div class="white-box">
		<h3 class="box-title m-b-0">Edit Service</h3>

		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<form action="<?= base_url("admin/service/update/$service->id") ?>" method="post">

					<div class="form-group">
						<label for="area">Address</label>
						<?php if (!empty(form_error('address'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('addresss'); ?>
							</div>
						<?php } ?>
						<input type="text" class="form-control" id="address"
							   name="address" value="<?= $service->address; ?>">
					</div>

					<div class="form-group">
						<label for="area">Mobile number</label>
						<?php if (!empty(form_error('mobile_number'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('mobile_number'); ?>
							</div>
						<?php } ?>
						<input type="text" class="form-control" id="mobile_number"
							   name="mobile_number" value="<?= $service->mobile_number; ?>">
					</div>

					<div class="form-group">
						<label for="area">Email</label>
						<?php if (!empty(form_error('email'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('email'); ?>
							</div>
						<?php } ?>
						<input type="text" class="form-control" id="email"
							   name="email" value="<?= $service->email; ?>">
					</div>

					<div class="form-group">
						<label for="area">Latitude</label>
						<?php if (!empty(form_error('lat'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('lat'); ?>
							</div>
						<?php } ?>
						<input type="text" class="form-control" id="lat"
							   name="lat" value="<?= $service->lat; ?>">
					</div>

					<div class="form-group">
						<label for="area">Longitude</label>
						<?php if (!empty(form_error('lng'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('lng'); ?>
							</div>
						<?php } ?>
						<input type="text" class="form-control" id="lng"
							   name="lng" value="<?= $service->lng; ?>">
					</div>

			</div>

			<div class="text-right">
				<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
				<a href="<?= base_url("admin/service") ?>">
					<button type="button" class="btn btn-inverse waves-effect waves-light">Return</button>
				</a>
			</div>

			</form>
		</div>
	</div>
</div>
