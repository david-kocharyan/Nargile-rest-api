<!--page content-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <h3 class="box-title m-b-0">Register new Offer</h3>

            <?php if (!empty($this->session->flashdata('success'))) { ?>
                <p class="text-muted m-b-0">Register offers quickly and easily!</p>
                <p class="text-mutedv text-success m-b-30">	<?= $this->session->flashdata('success'); ?> </p>
            <?php } else { ?>
                <p class="text-muted m-b-30">Register offers quickly and easily!</p>
            <?php } ?>

            <form data-toggle="validator" action="<?php echo base_url() ?>admin/offers/update/<?= $offer->id; ?>" method="post"
                  enctype="multipart/form-data">

                <div class="form-group">
                    <label for="input-file-now">Select Restaurant</label>
                    <select name="restaurant_id" required class="form-control" id="">
                        <option value="">Select Restaurant</option>
                        <?php foreach($restaurants as $restaurant) { ?>
                            <option <?php if($offer->restaurant_id == $restaurant->id) echo "selected"; ?> value="<?=$restaurant->id; ?>"><?=$restaurant->name; ?></option>
                        <?php } ?>
                    </select>
                    <?php if (!empty(form_error('type'))) { ?>
                        <div class="help-block with-errors text-danger">
                            <?= form_error('type'); ?>
                        </div>
                    <?php } ?>
                </div>

                <div class="form-group">
                    <label for="input-file-now">Offer Type</label>
                    <select name="type" required class="form-control" id="">
                        <option value="">Select Type</option>
                        <option <?php if($offer->type == 1) echo "selected"; ?> value="1">Featured Offer</option>
                        <option <?php if($offer->type == 2) echo "selected"; ?> value="2">Happy Hour Deal Offer</option>
                    </select>
                    <?php if (!empty(form_error('type'))) { ?>
                        <div class="help-block with-errors text-danger">
                            <?= form_error('type'); ?>
                        </div>
                    <?php } ?>
                </div>

                <div class="form-group">
                    <label for="input-file-now">Text</label>
                    <textarea required name="text" id="" cols="30" class="form-control" rows="10"><?= $offer->text; ?></textarea>
                    <?php if (!empty(form_error('type'))) { ?>
                        <div class="help-block with-errors text-danger">
                            <?= form_error('type'); ?>
                        </div>
                    <?php } ?>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>

