<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-15">Attach to user edit</h3>

			<form action="<?= base_url("admin/attach-card/update/") . $attach->id ; ?>" method="post">

				<div class="form-group">
					<label for="inputUsername" class="control-label">Loyalty Card</label>
					<?php if (!empty(form_error('card'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('card'); ?>
						</div>
					<?php } ?>
					<select id="inputUsername" name="card" class="form-control">
						<?php foreach ($loyalty as $key => $val) { ?>
							<option
								value="<?= $val->id ?>" <?php if ($val->id == $attach->card_id) echo "selected"; ?> >
								<?= $val->desc . " - " . $val->percent . "%" ?>
							</option>
						<?php } ?>
					</select>
				</div>

				<div class="form-group">
					<label for="inputUsername" class="control-label">User</label>
					<?php if (!empty(form_error('user'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('user'); ?>
						</div>
					<?php } ?>
					<select id="users" name="user" class="form-control">
						<?php foreach ($users as $key => $val) { ?>
							<option
								value="<?= $val->id ?>" <?php if ($val->id == $attach->user_id) echo "selected"; ?> >
								<?= $val->username ?></option>
						<?php } ?>
					</select>
				</div>

				<div class="text-right">
					<button type="submit" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
				</div>

			</form>
		</div>
	</div>
</div>


<script>
    $(document).ready(function () {
        $("#users").select2({
            closeOnSelect: true
        });
    })
</script>
