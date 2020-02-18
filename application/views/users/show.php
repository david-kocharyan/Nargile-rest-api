
<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-30">User Data</h3>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6">
					<div class="white-box text-center"><img src="<?= base_url('plugins/images/Logo/') . $users->image ?>"
															class="img-responsive"/>
					</div>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-6">
					<h3 class="box-title m-t-0"><?= $users->first_name . " " . $users->last_name ?></h3>

					<ul class="list-icons">
						<li><h4> Username - <?= $users->username ?> </h4></li>
						<li><h4> Phone Number - <?= $users->mobile_number ?> </h4></li>
						<li><h4> Email - <?= $users->email ?> </h4></li>
						<li><h4> Coins - <?= $users->coins ?> </h4></li>
						<li><h4> Date of Birth - <?= date('Y-m-d', strtotime($users->date_of_birth)); ?> </h4></li>
						<li><h4> Gender - <?php if($users->gender == 0) {echo "Female";} else{ echo "Male";}   ?> </h4></li>
						<li><h4> Logged via Facebook - <?php if($users->logged_via_fb == 0) {echo "No";} else{ echo "Yes";}   ?></h4></li>
						<li><h4> Notification status - <?php if($users->notification_status == 0) {echo "No";} else{ echo "Yes";}   ?> </h4></li>
					</ul>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="box-title m-t-40">General Info</h3>
					<div class="table-responsive">
						<table class="table">
							<tbody>
							<tr>
								<td width="390">Favorite</td>
								<td> <?= $favorites->count; ?> </td>
							</tr>
							<tr>
								<td>Rate</td>
								<td> <?= $rates->count; ?> </td>
							</tr>
							<tr>
								<td>Review</td>
								<td> <?= $reviews->count; ?> </td>
							</tr>
							<tr>
								<td>Friends</td>
								<td> <?= $friends; ?> </td>
							</tr>
							<tr>
								<td>Shared</td>
								<td> <?= $share->count; ?> </td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="box-title m-t-40">Badges</h3>
					<?php foreach ($badges as $key) { ?>
						<img src="<?= base_url().$key->image ?>" alt="" class="m-l-10">
					<?php }?>
				</div>
			</div>
		</div>
	</div>
</div>
