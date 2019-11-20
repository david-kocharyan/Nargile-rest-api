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
						<table class="table table-bordered" id="dynamic_field">
							<tr>
								<td>
									<input type="text" name="price[]" placeholder="Enter price"
										   class="form-control name_list m-b-5"/>
									<input type="date" name="valid[]" placeholder="Enter date Y-m-d"
										   class="form-control m-b-5"/>
									<input type="text" name="desc[]" placeholder="Enter description"
										   class="form-control m-b-5"/>
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
						<th>Price</th>
						<th>Valid date</th>
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
							<td><?= $value->description; ?></td>
							<td><?= $value->status; ?></td>
							<td>
								<a href="<?= base_url("admin/restaurants/coin-offers/edit/$value->id") ?>"
								   data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>

								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/restaurants/coin-offers/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/restaurants/coin-offers/change-status/$value->id") ?>"
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
            $('#dynamic_field').append(`<tr id="row${i}"><td>
			<input type="text" name="price[]" placeholder="Enter narguile price" class="form-control m-b-5" />
			<input type="date" name="valid[]" placeholder="Enter date Y-m-d" class="form-control m-b-5"/>
			<input type="text" name="desc[]" placeholder="Enter description" class="form-control m-b-5"/>
			<td><button type="button" name="remove" id="${i}" class="btn btn-danger btn_remove">X</button></td></tr>`);
        });

        $(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
        });
    });
</script>
