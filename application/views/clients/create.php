<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Register new client</h3>

			<?php if (!empty($this->session->flashdata('success'))) { ?>
				<p class="text-muted m-b-0">Register clients quickly and easily!</p>
				<p class="text-mutedv text-success m-b-30">	<?= $this->session->flashdata('success'); ?> </p>
			<?php } else { ?>
				<p class="text-muted m-b-30">Register clients quickly and easily!</p>
			<?php } ?>

			<form data-toggle="validator" action="<?php echo base_url() ?>admin/clients/store" method="post"
				  enctype="multipart/form-data">

				<div class="form-group">
					<label for="inputUsername" class="control-label">Username</label>
					<input type="text" class="form-control" id="inputUsername" placeholder="Username" name="username"
						   required>
					<?php if (!empty(form_error('username'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('username'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputFull_name" class="control-label">Full Name</label>
					<input type="text" class="form-control" id="inputFull_name" placeholder="Full Name" name="full_name"
						   required>
					<?php if (!empty(form_error('full_name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('full_name'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputEmail" class="control-label">Email</label>
					<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" required>
					<?php if (!empty(form_error('email'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('email'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="control-label">Password</label>
					<input type="text" class="form-control" id="inputPassword" placeholder="Password" name="password"
						   required>
					<?php if (!empty(form_error('password'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('password'); ?>
						</div>
					<?php } ?>
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

