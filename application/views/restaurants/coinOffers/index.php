<!-- Date picker plugins css -->
<link href="<?= base_url('/public/')?>plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />

<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<?php if (!empty($this->session->flashdata('success'))) { ?>
				<p class="text-mutedv text-success m-b-30">    <?= $this->session->flashdata('success'); ?> </p>
			<?php } ?>
			<?php if (!empty($this->session->flashdata('error'))) { ?>
				<p class="text-mutedv text-danger m-b-30">    <?= $this->session->flashdata('error'); ?> </p>
			<?php } ?>
			<div class="form-group">
				<form data-toggle="validator"
					  action="<?php echo base_url() ?>admin/restaurants/coin-offers/store/<?= $id ?>"
					  method="post">
					<div class="table-responsive">

						<div class="form-group">
							<label for="price" class="control-label">Price</label>
							<input type="text" name="price" placeholder="Enter price"
								   class="form-control"/>
							<?php if (!empty(form_error('price'))) { ?>
								<div class="help-block with-errors text-danger">
									<?= form_error('price'); ?>
								</div>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="valid" class="control-label">Valid Date</label>
							<input type="text" name="valid" id="valid" placeholder="Enter date Y-m-d"
								   class="form-control"/>
							<?php if (!empty(form_error('valid'))) { ?>
								<div class="help-block with-errors text-danger">
									<?= form_error('valid'); ?>
								</div>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="desc" class="control-label">Description</label>
							<input type="text" name="desc" placeholder="Enter description"
								   class="form-control"/>
							<?php if (!empty(form_error('desc'))) { ?>
								<div class="help-block with-errors text-danger">
									<?= form_error('desc'); ?>
								</div>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="count" class="control-label">Offers quantity</label>
							<input type="number" name="count" placeholder="Offers quantity"
								   class="form-control"/>
							<?php if (!empty(form_error('count'))) { ?>
								<div class="help-block with-errors text-danger">
									<?= form_error('count'); ?>
								</div>
							<?php } ?>
						</div>

						<div class="form-group">
							<label for="country" class="control-label">Country</label>
							<select name="country" id="coin_country" class="form-control">
								<?php foreach ($country as $key){?>
									<option value="<?= $key->id?>"><?= $key->name?></option>
								<?php }?>
							</select>
						</div>

						<div class="form-group">
							<label for="region" class="control-label">Region</label>
							<select name="region" id="coin_region" class="form-control">
								<?php foreach ($region as $key){?>
									<option value="<?= $key->id?>"><?= $key->name?></option>
								<?php }?>
							</select>
						</div>

						<input type="submit" name="submit" id="submit" class="btn btn-info" value="Submit"/>
						<a href="<?= base_url("admin/restaurants/show/") . $id ?>">
							<button type="button" class="btn btn-basic">Return</button>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Price</th>
						<th>Valid date</th>
						<th>Count</th>
						<th>Description</th>
						<th>Status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($coins as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->price; ?></td>
							<td><?= date('Y-m-d', $value->valid_date); ?></td>
							<td><?= $value->count; ?></td>
							<td><?= $value->description; ?></td>

							<td style="
									<?php if ($value->status == 0) {
								echo 'color: red;';
							} elseif ($value->status == 2) {
								echo 'color: rgb(93,50,50,1);';
							} else {
								echo 'color: green;';
							} ?>">
								<?php if ($value->status == 0) {
									echo "Inactive";
								} elseif ($value->status == 2) {
									echo "Pending";
								} else {
									echo "Active";
								} ?>
							</td>

							<td>
								<?php if ($user['role'] != 'admin' OR $value->status != 2) { ?>
									<a href="<?= base_url("admin/restaurants/coin-offers/edit/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info">
										<i
											class="fas fa-pencil-alt"></i> </a>

									<?php if ($value->status == 1) { ?>
										<a href="<?= base_url("admin/restaurants/coin-offers/change-status/$value->id") ?>"
										   data-toggle="tooltip"
										   data-placement="top" title="Deactivate"
										   class="btn btn-danger btn-circle tooltip-danger"><i
												class="fa fa-power-off"></i></a>
									<?php } else { ?>
										<a href="<?= base_url("admin/restaurants/coin-offers/change-status/$value->id") ?>"
										   data-toggle="tooltip"
										   data-placement="top" title="Activate"
										   class="btn btn-success btn-circle tooltip-success"><i
												class="fa fa-power-off"></i></a>
									<?php }
								} ?>
							</td>

						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<!-- Date Picker Plugin JavaScript -->
<script src="<?= base_url('/public/')?>plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script>
	$('#valid').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true,
	});
</script>

