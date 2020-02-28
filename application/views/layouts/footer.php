</div>
<!-- /.container-fluid -->
<footer class="footer text-center"> 2017 &copy; Ample Admin brought to you by themedesigner.in </footer>
</div>
<!-- ============================================================== -->
<!-- End Page Content -->
<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->


<!-- Bootstrap Core JavaScript -->
<script src="<?= base_url('public/') ?>bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="<?= base_url('public/') ?>plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="<?= base_url('public/') ?>js/jquery.slimscroll.js"></script>
<!--Select 2 -->
<script src="<?= base_url('public/') ?>plugins/bower_components/select2/dist/js/select2.min.js"></script>

<!--Wave Effects -->
<script src="<?= base_url('public/') ?>js/waves.js"></script>
<!--Morris JavaScript -->
<script src="<?= base_url('public/') ?>plugins/bower_components/raphael/raphael-min.js"></script>
<script src="<?= base_url('public/') ?>plugins/bower_components/morrisjs/morris.js"></script>
<!-- Calendar JavaScript -->
<script src="<?= base_url('public/') ?>plugins/bower_components/moment/moment.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<?= base_url('public/') ?>js/custom.min.js"></script>
<!-- Custom tab JavaScript -->
<script src="<?= base_url('public/') ?>js/cbpFWTabs.js"></script>

<script src="<?= base_url('public/') ?>plugins/bower_components/toast-master/js/jquery.toast.js"></script>
<!--Style Switcher -->
<script src="<?= base_url('public/') ?>plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>

<script src="<?= base_url('public/') ?>js/custom.min.js"></script>
<script src="<?= base_url('public/') ?>plugins/bower_components/dropify/dist/js/dropify.min.js"></script>

<!-- jQuery for carousel -->
<script src="<?= base_url('public/') ?>plugins/bower_components/owl.carousel/owl.carousel.min.js"></script>
<script src="<?= base_url('public/') ?>plugins/bower_components/owl.carousel/owl.custom.js"></script>

<!--slimscroll JavaScript -->
<script src="<?= base_url('public/') ?>js/jquery.slimscroll.js"></script>

<!-- Chart JS -->
<script src="<?= base_url('public/') ?>plugins/bower_components/Chart.js/Chart.min.js"></script>

<script>
    $(document).ready(function() {
        $('.select_2_example').select2();

        $("#users_notif_select").select2({
			tags: true,
			multiple: true,
		});

        // data table
        $('#myTable').DataTable();

        // Basic
        $('.dropify').dropify();

        (function() {
            [].slice.call(document.querySelectorAll('.sttabs')).forEach(function(el) {
                new CBPFWTabs(el);
            });
        })();

        $('#reviews').slimScroll({
            height: '500px'
        });
		$('#history').slimScroll({
			height: '500px'
		});
        $('#featured_offers').slimScroll({
            height: '200px'
        });
        $('#hour_offers').slimScroll({
            height: '200px'
        });

    });
</script>

</body>

</html>
