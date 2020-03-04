<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Users Table</h3>

			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">Send Notification</button>

			<div class="table-responsive">
				<table id="user_table" class="table">
					<thead>
					<tr>
						<th>
							<button style="border: none; background: transparent; font-size: 14px; width: 100%;"
									id="MyTableCheckAllButton"><i class="far fa-square"></i>
							</button>
						</th>
						<th>ID</th>
						<th>Image</th>
						<th value="Username"></th>
						<th value="First Name"></th>
						<th value="Last Name"></th>
						<th value="Date"></th>
						<th value="Mobile Number"></th>
						<th value="Email"></th>
						<th>Coin</th>
						<th>Favorite</th>
						<th>Rate</th>
						<th>Review</th>
						<th>Share</th>
						<th>Friend</th>
						<th value="Logged via Facebook"></th>
						<th value="Notification status"></th>
						<th>Option</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($users as $key => $value) { ?>
						<tr>
							<td></td>
							<td><?= $value->id ?></td>
							<td>
								<img src="<?= base_url('') . $value->image; ?>"
									 style="border-radius: 50%; height: 80px; width: 80px; ">
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
							<td><?php if ($value->logged_via_fb == 0) {
									echo "No";
								} else {
									echo "Yes";
								} ?></td>
							<td><?php if ($value->notification_status == 0) {
									echo "Off";
								} else {
									echo "On";
								} ?></td>
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


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Notification Content</h4>
			</div>
			<div class="modal-body">
				<input type="text" name="title" placeholder="Title" class="form-control m-b-20 title">
				<textarea name="text" id="" cols="30" rows="10" class="form-control text">Text</textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success send_notif" data-dismiss="modal">Send</button>
			</div>
		</div>

	</div>
</div>


<!-- start - This is for export functionality only -->
<!--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">-->
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">

<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>

<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>


<script>
	let myTable = $('#user_table').DataTable({
		dom: 'Bfirtlp',
		scrollX: true,
		buttons: [
			{
				extend: 'excel',
				text: 'Excel',
				title: 'Users table',
				filename: 'users_table',
				exportOptions: {
					columns: ":visible",
					format: {
						header: function (data, column, row) {
							return data.substring(data.indexOf("value") + 9, data.indexOf("</option"));
						}
					}

				}
			},
		],
		orderable: false,
		columnDefs: [
			{
				'targets': 0,
				'orderable': false,
				"className": 'select-checkbox',
				'checkboxes': {
					'selectRow': false
				}
			},
			{"orderable": false, "targets": [1,0,2,3,4,5,6,7,8,15,16,17]},
		],
		select: {
			style: 'multi',
			selector: 'td:first-child'
		},
		initComplete: function () {
			this.api().columns([3, 4, 5, 6, 7, 8, 15, 16]).every(function () {
				var column = this;
				var eachHeader = $(column.header())[0];
				var headingVal = eachHeader.getAttribute("value");
				var select = $('<select ><option value="">' + headingVal + '</option></select>')
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

	myTable.on('select deselect draw', function () {
		var all = myTable.rows({search: 'applied'}).count(); // get total count of rows
		var selectedRows = myTable.rows({selected: true, search: 'applied'}).count(); // get total count of selected rows
		if (selectedRows < all) {
			$('#MyTableCheckAllButton i').attr('class', 'fa fa-square');
		} else {
			$('#MyTableCheckAllButton i').attr('class', 'fa fa-check-square');
		}
	});

	$('#MyTableCheckAllButton').click(function () {
		var all = myTable.rows({search: 'applied'}).count(); // get total count of rows
		var selectedRows = myTable.rows({selected: true, search: 'applied'}).count(); // get total count of selected rows
		if (selectedRows < all) {
			myTable.rows({search: 'applied'}).deselect();
			myTable.rows({search: 'applied'}).select();
		} else {
			myTable.rows({search: 'applied'}).deselect();
		}
	});

	$(".send_notif").click(function () {
		var users = myTable.rows({selected: true}).data().pluck(1).toArray();
		var title = $(".title").val();
		var text = $(".text").val();

		if (users != null || !empty())
		$.ajax({
			type: "POST",
			url: "<?= base_url('admin/send-message/send')?>",
			data: { users,	title,	text },
			success: function(data){
				location.reload();
			}
		});
	})

</script>
