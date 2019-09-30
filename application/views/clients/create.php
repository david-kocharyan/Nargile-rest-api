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
						   required value="<?= $this->input->post('username'); ?>">
					<?php if (!empty(form_error('username'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('username'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputFirst_name" class="control-label">First Name</label>
					<input type="text" class="form-control" id="inputFirst_name" placeholder="First Name" name="first_name"
						   required value="<?= $this->input->post('first_name'); ?>">
					<?php if (!empty(form_error('first_name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('first_name'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputLast_name" class="control-label">Last Name</label>
					<input type="text" class="form-control" id="inputLast_name" placeholder="Last Name" name="last_name"
						   required value="<?= $this->input->post('last_name'); ?>">
					<?php if (!empty(form_error('last_name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('last_name'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputEmail" class="control-label">Email</label>
					<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" required value="<?= $this->input->post('email'); ?>">
					<?php if (!empty(form_error('email'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('email'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputMobile" class="control-label">Mobile Number</label>
					<input type="text" class="form-control" id="inputMobile" placeholder="Mobile Number" name="mobile_number"
						   required value="<?= $this->input->post('mobile_number'); ?>">
					<?php if (!empty(form_error('last_name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('last_name'); ?>
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
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>
	</div>
</div>

