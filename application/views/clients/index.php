<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-15">Clients Table</h3>
			<p class="box-title m-b-30 btn btn-success btn-outline"><a href="<?= base_url('admin/clients/create') ?>" class="text-success">Add
					new Clients</a></p>

			<div class="table-responsive" style="display: block;">
				<table id="client_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Logo</th>
						<th value="Username"></th>
						<th value="First Name"></th>
						<th value="Last Name"></th>
						<th value="Email"></th>
						<th value="Mobile Number"></th>
						<th>Restaurants Name</th>
						<th value="Active"></th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($clients as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td><img src="<?= base_url("plugins/images/Logo/" . $value->logo); ?>" style="border-radius: 50%; height: 80px; width: 80px; ">
							</td>
							<td><?= $value->username; ?></td>
							<td><?= $value->first_name; ?></td>
							<td><?= $value->last_name; ?></td>
							<td><?= $value->email; ?></td>
							<td><?= $value->mobile_number; ?></td>

							<td>
								<?php foreach ($value->restaurants as $bin => $val) { ?>
									<strong><?= $val->name ?></strong> <br />
								<?php } ?>
							</td>

							<td style = "
									<?php if ($value->active == 0) {
								echo 'color: red;';
							} else {
								echo 'color: green;';
							} ?>"
							>
								<?php if ($value->active == 0) {
									echo "Inactive";
								} else {
									echo "Active";
								} ?>
							</td>
							<td>
								<a href="<?= base_url("admin/clients/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>
								<?php if ($value->active == 1) { ?>
									<a href="<?= base_url("admin/clients/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/clients/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Activate"
									   class="btn btn-success btn-circle tooltip-success"><i
											class="fa fa-power-off"></i></a>
								<?php } ?>

								<a href="<?= base_url("admin/clients/show/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Show" class="btn btn-success btn-circle tooltip-success"> <i
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
	$('#client_table').DataTable({
		dom: 'Bfirtlp',
		buttons: [
			{
				extend: 'excel',
				text: 'Excel',
				title: 'Clients table',
				filename: 'clients_table',
				exportOptions: {
					columns: ":visible",
					format: {
						header: function ( data, column, row )
						{
							return data.substring(data.indexOf("value")+9,data.indexOf("</option>"));
						}
					}

				}
			},
		],
		"ordering": false,
		initComplete: function () {
			this.api().columns([2, 3, 4, 5,6,8]).every(function () {
				var column = this;
				var eachHeader = $(column.header())[0];
				var headingVal = eachHeader.getAttribute("value");
				var select = $('<select><option value="">'+ headingVal +'</option></select>')
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
