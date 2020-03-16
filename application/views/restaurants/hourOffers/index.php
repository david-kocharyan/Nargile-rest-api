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
					  action="<?php echo base_url() ?>admin/restaurants/hour-offers/store/<?= $id ?>"
					  method="post">

					<div class="form-group">
						<label for="name" class="control-label">Text</label>
						<input type="text" name="name" placeholder="Enter Info about offer"
							   class="form-control"/>
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
								<option value="<?= $key->name ?>"><?= $key->name ?></option>
							<?php } ?>
						</select>
					</div>

					<div class="form-group">
						<label for="region" class="control-label">Region</label>
						<select name="region" id="coin_region" class="form-control">
							<?php foreach ($region as $key) { ?>
								<option value="<?= $key->id ?>"><?= $key->name ?></option>
							<?php } ?>
						</select>
					</div>

					<input type="submit" name="submit" id="submit" class="btn btn-info" value="Submit"/>
					<a href="<?= base_url("admin/restaurants/show/") . $id ?>">
						<button type="button" class="btn btn-basic">Return</button>
					</a>
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
				<table id="hour_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Info</th>
						<th>Country</th>
						<th>Region</th>
						<th>Status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($offers as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->text; ?></td>
							<td><?= $value->country; ?></td>
							<td><?= $value->reg_name; ?></td>
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
								} else {
									echo "Active";
								} ?>
							</td>
							<td>
								<a href="<?= base_url("admin/restaurants/hour-offers/edit/$value->id") ?>"
								   data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/restaurants/hour-offers/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/restaurants/hour-offers/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Activate"
									   class="btn btn-success btn-circle tooltip-success"><i
											class="fa fa-power-off"></i></a>
								<?php } ?>
							</td>

						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<script>
	$('#hour_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([2,3,4]).every(function () {
				var column = this;
				var select = $('<select style="margin-left: 5px;"><option value="">All</option></select>')
					.appendTo($(column.header()))
					.on('change', function () {
						var val = $.fn.dataTable.util.escapeRegex(
							$(this).val()
						);

						column
							.search(val ? '^' + val + '$' : '', true, false)
							.draw();
					});

				column.data().unique().sort().each(function (d, j) {
					select.append('<option value="' + d + '">' + d + '</option>')
				});
			});
		},
	});
</script>
