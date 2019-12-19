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
					  action="<?php echo base_url() ?>admin/restaurants/weeks/store/<?= $id ?>"
					  method="post">

					<div class="table-responsive">
						<table class="table table-bordered" id="dynamic_field">
							<tr>
								<td>
									<div class="col-xs-4">
										<select name="day[]" class="form-control">
											<option value="1">Monday</option>
											<option value="2">Tuesday</option>
											<option value="3">Wednesday</option>
											<option value="4">Thursday</option>
											<option value="5">Friday</option>
											<option value="6">Saturday</option>
											<option value="7">Sunday</option>
										</select>
									</div>

									<div class="col-xs-2">
										<select name="type[]" class="form-control type">
											<option value="1" class="select_open">Open</option>
											<option value="0" class="select_close">Close</option>
										</select>
									</div>

									<div class="col-xs-3">
										<input type="text" name="open[]" placeholder="Open (8:00am)"
											   class="form-control input-md input_open"/>
									</div>

									<div class="col-xs-3">
										<input type="text" name="close[]" placeholder="Close (12:00pm)"
											   class="form-control input_close"/>
									</div>
								</td>

								<td>
									<button type="button" name="add" id="add" class="btn btn-success">Add More</button>
								</td>
							</tr>
						</table>
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
						<th>Day</th>
						<th>Open/Close</th>
						<th>Open</th>
						<th>Close</th>
						<th>Status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($week as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->day; ?></td>
							<td>
								<?php if ($value->type == 1) { ?>
									<strong class="text-success">Open</strong>
								<?php } else { ?>
									<strong class="text-danger">Close</strong>
								<?php } ?>
							</td>
							<td><?= $value->open; ?></td>
							<td><?= $value->close; ?></td>
							<td><?= $value->status; ?></td>
							<td>
								<a href="<?= base_url("admin/restaurants/weeks/edit/$value->id") ?>"
								   data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/restaurants/weeks/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/restaurants/weeks/change-status/$value->id") ?>"
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
        var i = 1;
        $('#add').click(function () {
            i++;
            $('#dynamic_field').append(`<tr id="row${i}">
			<td>
				<div class="col-xs-4">
					<select name="day[]" class="form-control m-b-5">
						<option value="1">Monday</option>
						<option value="2">Tuesday</option>
						<option value="3">Wednesday</option>
						<option value="4">Thursday</option>
						<option value="5">Friday</option>
						<option value="6">Saturday</option>
						<option value="7">Sunday</option>
					</select>
				</div>
				<div class="col-xs-2">
					<select name="type[]" class="form-control type">
						<option value="1" class="select_open">Open</option>
						<option value="0" class="select_close">Close</option>
					</select>
				</div>
				<div class="col-xs-3">
					<input type="text" name="open[]" placeholder="Open (8:00am)" class="form-control input_open"/>
				</div>

				<div class="col-xs-3">
					<input type="text" name="close[]" placeholder="Close (12:00pm)" class="form-control input_close"/>
				</div>
			</td>
			<td><button type="button" name="remove" id="${i}" class="btn btn-danger btn_remove">X</button></td>
			</tr>`);
        });

        $(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
        });

        $(document).delegate(".type", "change", function () {
            var $target = $(this).val();
            if ($target == 0) {
                $(this).parents('td').find('.input_open').attr("readonly", true)
                $(this).parents('td').find('.input_close').attr("readonly", true)
            } else {
                $(this).parents('td').find('.input_open').attr("readonly", false)
                $(this).parents('td').find('.input_close').attr("readonly", false)
            }
        });


    });
</script>


