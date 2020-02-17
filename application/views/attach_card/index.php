<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-15">Attach to user</h3>

			<?php if (!empty($this->session->flashdata('success'))) { ?>
				<p class="text-mutedv text-success m-b-30">  <?= $this->session->flashdata('success'); ?> </p>
			<?php } ?>

			<form action="<?= base_url("admin/attach-card/store") ?>" method="post">

				<div class="form-group">
					<label for="inputUsername" class="control-label">Loyalty Card</label>
					<?php if (!empty(form_error('card'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('card'); ?>
						</div>
					<?php } ?>
					<select id="inputUsername" name="card" class="form-control">
						<?php foreach ($loyalty as $key => $val) { ?>
							<option value="<?= $val->id ?>"><?= $val->desc . " - " . $val->percent . "%" ?></option>
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
							<option value="<?= $val->id ?>"><?= $val->username ?></option>
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


<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Users cards table</h3>

			<div class="table-responsive">
				<table id="attace_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>User Name</th>
						<th>Card description</th>
						<th>Percent</th>
						<th>Status</th>
						<th>Option</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($attach as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->username; ?></td>
							<td><?= $value->desc ?></td>
							<td><?= $value->percent."%" ; ?></td>
							<td style = "
									<?php if ($value->status == 0) {
								echo 'color: red;';
							} else {
								echo 'color: green;';
							} ?>"
							>
								<?php if ($value->status == 0) {
									echo "Inactive";
								} else {
									echo "Active";
								} ?>
							</td>
							<td>
								<a href="<?= base_url("admin/attach-card/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/attach-card/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/attach-card/change-status/$value->id") ?>"
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
	$(document).ready(function () {
		$("#users").select2({
            closeOnSelect: true
        });
    })

	$('#attace_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([1, 2, 3, 4]).every(function () {
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
