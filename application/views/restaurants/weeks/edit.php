<!--page content-->
<div class="row">
	<div class="col-sm-12">
		<div class="white-box">
			<form data-toggle="validator"
				  action="<?= base_url("admin/restaurants/weeks/update/") ?><?= $weeks->id ?>"
				  method="post">

				<h2><?= $weeks->day ?></h2>

				<div class="form-group">
					<label for="type" class="control-label">Open/Close</label>
					<select name="type" class="form-control type">
						<option value="1" class="select_open" <?php if ($weeks->type == 1) echo 'selected'  ?> >Open</option>
						<option value="0" class="select_close" <?php if ($weeks->type == 0) echo 'selected' ?> >Close</option>
					</select>
				</div>

				<div class="form-group">
					<label for="inputOpen" class="control-label">Open</label>
					<input type="text" class="form-control input_open" id="inputOpen" placeholder="Open" name="open"
						   value="<?= $weeks->open ?>"
						   required>
					<?php if (!empty(form_error('open'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('open'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<label for="inputClose" class="control-label">Close</label>
					<input type="text" class="form-control input_close" id="inputClose" placeholder="Close" name="close"
						   value="<?= $weeks->close ?>"
						   required>
					<?php if (!empty(form_error('close'))) { ?>
						<div class="help-block with-errors text-danger">
							<?= form_error('close'); ?>
						</div>
					<?php } ?>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
					<a href="<?= base_url("admin/restaurants/weeks/") ?><?= $weeks->restaurant_id ?>">
						<button type="button" class="btn btn-basic">Return</button>
					</a>
				</div>

			</form>
		</div>
	</div>
</div>


<script>
    $(document).ready(function () {

        var e = document.querySelector(".type");
        var sel = e.options[e.selectedIndex].value;

        if (sel == 1) {
            $('.input_open').attr("readonly", false)
            $('.input_close').attr("readonly", false)
        } else {
            $('.input_open').attr("readonly", true)
            $('.input_close').attr("readonly", true)
        }

        $(document).delegate(".type", "change", function () {
            var $target = $(this).val();

            if ($target == 0) {
                $(this).parents('form').find('.input_open').attr("readonly", true)
                $(this).parents('form').find('.input_close').attr("readonly", true)
            } else {
                $(this).parents('form').find('.input_open').attr("readonly", false)
                $(this).parents('form').find('.input_close').attr("readonly", false)
            }
        });
    })
</script>
