<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<form data-toggle="validator"
				  action="<?= base_url("admin/restaurants/featured-offers/update/") ?><?= $offers->id ?>"
				  method="post">

				<div class="form-group">
					<label for="inputInfo" class="control-label">Text</label>
					<input type="text" class="form-control" id="inputInfo" placeholder=Info name="name"
						   value="<?= $offers->text ?>"
						   required>
					<?php if (!empty(form_error('name'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('name'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="country" class="control-label">Country</label>
					<select name="country" id="coin_country" class="form-control">
						<?php foreach ($country as $key) { ?>
							<option value="<?= $key->name ?>" <?php if($key->name == $offers->country) echo "selected"; ?>><?= $key->name ?></option>
						<?php } ?>
					</select>
				</div>

				<div class="form-group">
					<label for="region" class="control-label">Region</label>
					<select name="region" id="coin_region" class="form-control">
						<?php foreach ($region as $key) { ?>
							<option value="<?= $key->id ?>" <?php if($key->id == $offers->region) echo "selected"; ?>><?= $key->name ?></option>
						<?php } ?>
					</select>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
					<a href="<?= base_url("admin/restaurants/featured-offers/") ?><?= $offers->restaurant_id ?>">
						<button type="button" class="btn btn-basic">Return</button>
					</a>
				</div>

			</form>
		</div>
	</div>
</div>
