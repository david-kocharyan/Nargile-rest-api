<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Notification</h3>

			<div class="table-responsive">
				<table id="notification" class="table table-striped">
					<thead>
					<tr>
						<th>Date</th>
						<th>Message</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($notification as $key => $value) { ?>
						<tr>
							<td><?= $value->date ?></td>
							<td><?= $value->message ?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
	$('#notification').DataTable({
		columnDefs: [
			{"orderable": false, "targets": [1]},
		],
	});
</script>
