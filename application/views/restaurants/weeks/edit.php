<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<form data-toggle="validator"
				  action="<?= base_url("admin/restaurants/weeks/update/") ?><?= $weeks->id ?>"
				  method="post">

				<h2><?= $weeks->day ?></h2>

				<div class="form-group">
					<label for="inputOpen" class="control-label">Open</label>
					<input type="text" class="form-control" id="inputOpen" placeholder="Open" name="open"
						   value="<?= $weeks->open ?>"
						   required>
					<?php if (!empty(form_error('open'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('open'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputClose" class="control-label">Close</label>
					<input type="text" class="form-control" id="inputClose" placeholder="Close" name="close"
						   value="<?= $weeks->close ?>"
						   required>
					<?php if (!empty(form_error('close'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('close'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
					<a href="<?= base_url("admin/restaurants/weeks/") ?><?= $weeks->restaurant_id ?>">
						<button type="button" class="btn btn-basic">Return</button>
					</a>
				</div>

			</form>
		</div>
	</div>
</div>
