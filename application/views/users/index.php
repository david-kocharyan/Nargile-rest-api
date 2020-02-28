<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Users Table</h3>

			<div class="table-responsive">
				<table id="user_table" class="table table-striped ">
					<thead>
					<tr>
						<th value="ID">ID</th>
						<th value="Image">Image</th>
						<th value="Username"></th>
						<th value="First Name"></th>
						<th value="Last Name"></th>
						<th value="Date"></th>
						<th value="Mobile Number"></th>
						<th value="Email"></th>
						<th>Coins</th>
						<th>Favorite</th>
						<th>Rate</th>
						<th>Review</th>
						<th>Share</th>
						<th>Friends</th>
						<th value="Logged via Facebook"></th>
						<th value="Notification status"></th>
						<th value="Option">Option</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($users as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td>
								<img src="<?= base_url('') . $value->image; ?>" style="border-radius: 50%; height: 80px; width: 80px; ">
							</td>
							<td><?= $value->username; ?></td>
							<td><?= $value->first_name; ?></td>
							<td><?= $value->last_name; ?></td>
							<td><?= $value->date_of_birth; ?></td>
							<td><?= $value->mobile_number; ?></td>
							<td><?= $value->email; ?></td>
							<td><?= $value->coins; ?></td>
							<td><?= $value->favorites; ?></td>
							<td><?= $value->rates; ?></td>
							<td><?= $value->reviews; ?></td>
							<td><?= $value->share; ?></td>
							<td><?= $value->friends; ?></td>
							<td><?php if ($value->logged_via_fb == 0){echo "No"; }else{echo "Yes"; } ?></td>
							<td><?php if ($value->notification_status == 0){echo "Off"; }else{echo "On"; } ?></td>

							<td>
								<a href="<?= base_url("admin/users/show/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Show" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-eye"></i> </a>
							</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- start - This is for export functionality only -->
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<!-- end - This is for export functionality only -->

<script>
	$('#user_table').DataTable({
		"scrollX": true,
		dom: 'Bfirtlp',
		buttons: [
			{
				extend: 'excel',
				text: 'Excel',
				title: 'Users table',
				filename: 'users_table',
				exportOptions: {
					columns: ":visible",
					format: {
						header: function ( data, column, row )
						{
							return data.substring(data.indexOf("value")+9,data.indexOf("</option"));
						}
					}

				}
			},
		],
		"ordering": true,
		"columnDefs": [
			{ "orderable": false, "targets": 1 },
			{ "orderable": false, "targets": 2 },
			{ "orderable": false, "targets": 3 },
			{ "orderable": false, "targets": 4 },
			{ "orderable": false, "targets": 5 },
			{ "orderable": false, "targets": 6 },
			{ "orderable": false, "targets": 7 },
			{ "orderable": false, "targets": 14 },
			{ "orderable": false, "targets": 15 },
			{ "orderable": false, "targets": 16 }
		],
		initComplete: function () {
			this.api().columns([2, 3, 4, 5, 6, 7, 14, 15]).every(function () {
				var column = this;
				var eachHeader = $(column.header())[0];
				var headingVal = eachHeader.getAttribute("value");
				var select = $('<select ><option value="">'+ headingVal +'</option></select>')
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
	$('.buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel').addClass('btn btn-primary m-r-5 m-t-5');
</script>
