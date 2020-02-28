<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">

			<form data-toggle="validator" action="<?php echo base_url() ?>admin/send-message/send" method="post"
				  enctype="multipart/form-data">

				<div class="form-group">
					<label for="area">Users</label>

					<div class="m-t-10 m-b-10">
						<input type="checkbox" id="selectall">
						<lable for="selectall">Select All</lable>
					</div>

					<?php if (!empty(form_error('users[]'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('users[]'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<select class="form-control users" id="users_notif_select" name="users[]" multiple="multiple">
							<?php foreach ($users as $key) { ?>
								<option value="<?= $key->id ?>">
									<?= $key->username ?>
								</option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="area">Title</label>
					<?php if (!empty(form_error('title'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('title'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<input type="text" class="form-control" name="title" value="Title">
					</div>
				</div>

				<div class="form-group">
					<label for="area">Text</label>
					<?php if (!empty(form_error('text'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('text'); ?>
						</div>
					<?php } ?>
					<div class="input-group col-md-12">
						<textarea cols="30" rows="10" class="form-control" name="text">Text</textarea>
					</div>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-success">Send</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function () {
		$("#selectall").click(function(){
			var checked = $("#selectall").prop("checked");
			if(checked==true){
				$("#users_notif_select > option").prop("selected",true);
				$("#users_notif_select").trigger('change');
			}else{
				$("#users_notif_select > option").prop("selected",false);
				$("#users_notif_select").trigger('change');
			}
		});

	})
</script>
