<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<form data-toggle="validator"
				  action="<?= base_url("admin/restaurants/coin-offers/update/") ?><?= $coins->id ?>"
				  method="post">

				<div class="form-group">
					<label for="inputInfo" class="control-label">Info</label>
					<input type="text" class="form-control" id="inputInfo" name="price"
						   value="<?= $coins->price ?>"
						   required>
					<?php if (!empty(form_error('price'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('price'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
					<a href="<?= base_url("admin/restaurants/coin-offers/") ?><?= $coins->restaurant_id ?>">
						<button type="button" class="btn btn-basic">Return</button>
					</a>
				</div>

			</form>
		</div>
	</div>
</div>
