<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<form data-toggle="validator"
				  action="<?= base_url("admin/restaurants/menu/update/") ?><?= $menu->id ?>"
				  method="post">

				<div class="form-group">
					<label for="inputInfo" class="control-label">Name</label>
					<input type="text" class="form-control" id="inputInfo" placeholder=Info name="name"
						   value="<?= $menu->name ?>"
						   required>
					<?php if (!empty(form_error('name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('name'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputInfo" class="control-label">Price</label>
					<input type="text" class="form-control" id="inputInfo" placeholder=Info name="price"
						   value="<?= $menu->price ?>"
						   required>
					<?php if (!empty(form_error('price'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('price'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
					<a href="<?= base_url("admin/restaurants/menu/") ?><?= $menu->restaurant_id ?>">
						<button type="button" class="btn btn-basic">Return</button>
					</a>
				</div>

			</form>
		</div>
	</div>
</div>
