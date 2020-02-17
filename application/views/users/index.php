<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Users Table</h3>

			<div class="table-responsive">
				<table id="user_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Date Of Birth</th>
						<th>Mobile Number</th>
						<th>Email</th>
						<th>Coins</th>
						<th>Image</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($users as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><?= $value->username; ?></td>
							<td><?= $value->first_name; ?></td>
							<td><?= $value->last_name; ?></td>
							<td><?= $value->date_of_birth; ?></td>
							<td><?= $value->mobile_number; ?></td>
							<td><?= $value->email; ?></td>
							<td><?= $value->coins; ?></td>
							<td>
								<img src="<?= base_url('') . $value->image; ?>" alt="" width="200" height="200"
									 class="img-responsive">
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
	$('#user_table').DataTable({
		"ordering": false,
		initComplete: function () {
			this.api().columns([1, 2, 3, 4, 5, 6]).every(function () {
				var column = this;
				var select = $('<select style="margin-left: 5px; width: 40%;"><option value="">All</option></select>')
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
