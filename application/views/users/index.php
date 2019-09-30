<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-0">Users Table</h3>

			<div class="table-responsive">
				<table id="myTable" class="table table-striped">
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
