<div class="col-md-4 col-sm-12">
	<div class="white-box">
		<h3 class="box-title m-b-0">Create Badges</h3>

		<?php if (!empty($this->session->flashdata('success'))) { ?>
			<p class="text-muted m-b-30 font-13"> Create new badges quickly and easily!</p>
			<p class="text-mutedv text-success m-b-30">  <?= $this->session->flashdata('success'); ?> </p>
		<?php } else { ?>
			<p class="text-muted m-b-30 font-13"> Create new bages quickly and easily! </p>
		<?php } ?>

		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<form action="<?= base_url("admin/badges/store") ?>" method="post" enctype="multipart/form-data">

					<div class="form-group">
						<label for="count">Count</label>
						<?php if (!empty(form_error('count'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('count'); ?>
							</div>
						<?php } ?>
						<div class="input-group">
							<input type="text" class="form-control" id="count" placeholder="Count"
								   name="count" required>
							<div class="input-group-addon"><i class=" ti-stats-up"></i></div>
						</div>
					</div>

					<div class="form-group">
						<label for="count">Type</label>
						<?php if (!empty(form_error('type'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('type'); ?>
							</div>
						<?php } ?>
						<div class="input-group">
							<select name="type" id="type" class="form-control">
								<option value="Explorer">Explorer</option>
								<option value="Famous">The famous</option>
								<option value="Accurate">The accurate</option>
							</select>
							<div class="input-group-addon"><i class="ti-fullscreen"></i></div>
						</div>
					</div>

					<div class="form-group">
						<label for="area">Info</label>
						<?php if (!empty(form_error('info'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= form_error('info'); ?>
							</div>
						<?php } ?>
						<div class="input-group">
							<textarea name="info" class="form-control" id="info" cols="70" rows="5"
									  style="resize: none;" required></textarea>
						</div>
					</div>

					<div class="form-group">
						<label for="area">Badge image</label>
						<?php if (!empty($this->session->flashdata('error'))) { ?>
							<div class="help-block with-errors text-danger">
								<?= $this->session->flashdata('error'); ?>
							</div>
						<?php } ?>
						<div class="input-group">
							<input type="file" class="form-control" id="image"
								   name="image">
							<div class="input-group-addon"><i class="ti-image"></i></div>
						</div>
					</div>

					<div class="text-right">
						<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
						<a href="<?= base_url("admin/badges") ?>">
							<button type="button" class="btn btn-inverse waves-effect waves-light">Return</button>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
