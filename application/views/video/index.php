<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<h3 class="box-title m-b-15">Video Banner Table</h3>
			<p class="box-title m-b-30 btn btn-success btn-outline"><a href="<?= base_url('admin/video/create') ?>" class="text-success">Add
					new Video</a></p>


			<div class="table-responsive" style="display: block;">
				<table id="video_table" class="table table-striped">
					<thead>
					<tr>
						<th>ID</th>
						<th>Content</th>
						<th>Restaurant</th>
						<th>Country</th>
						<th>Region</th>
						<th>Valid Date</th>
						<th>Show Count</th>
						<th>Link</th>
						<th>status</th>
						<th>Options</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($video as $key => $value) { ?>
						<tr>
							<td><?= $key + 1 ?></td>
							<td>
								<?php
								$mime = finfo_file(finfo_open(FILEINFO_MIME_TYPE), FCPATH."plugins/images/Video/$value->video");
								$type =  explode("/", $mime);
								if ($type[0] == 'image' ){ ?>
									<img src="<?= base_url('plugins/images/Video/').$value->video; ?>" alt="<?= $value->video;?>" style="height: 200px; width: 200px;">
								<?php }
								if ($type[0] == 'video' ){ ?>
									<video width="200" height="200" controls="controls">
										<source src="<?= base_url('plugins/images/Video/').$value->video; ?>">
									</video>
								<?php }?>
							</td>
							<td><?= $value->res_name; ?></td>
							<td><?= $value->country_name; ?></td>
							<td><?= $value->region_name; ?></td>
							<td><?= $value->valid_date; ?></td>
							<td><?= $value->show_count; ?></td>
							<td>
								<?php if ($value->link == "") {
									echo "Empty";
								} else {
									echo $value->link;
								} ?>
							</td>
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
								<a href="<?= base_url("admin/video/edit/$value->id") ?>" data-toggle="tooltip"
								   data-placement="top" title="Edit" class="btn btn-info btn-circle tooltip-info"> <i
										class="fas fa-pencil-alt"></i> </a>
								<?php if ($value->status == 1) { ?>
									<a href="<?= base_url("admin/video/change-status/$value->id") ?>"
									   data-toggle="tooltip"
									   data-placement="top" title="Deactivate"
									   class="btn btn-danger btn-circle tooltip-danger"><i class="fa fa-power-off"></i></a>
								<?php } else { ?>
									<a href="<?= base_url("admin/video/change-status/$value->id") ?>"
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
	$('#video_table').DataTable({})
</script>
