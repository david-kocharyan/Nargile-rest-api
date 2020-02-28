<!-- Calendar CSS -->
<!--<link href="../plugins/bower_components/calendar/dist/fullcalendar.css" rel="stylesheet" />-->
<!--body-->
<div class="row">
	<div class="col-md-12">
		<div class="white-box">
			<div id="calendar"></div>
		</div>
	</div>
</div>

<!-- Calendar JavaScript -->
<script src="<?= base_url('public/') ?>plugins/bower_components/moment/moment.js"></script>
<script src='<?= base_url('public/') ?>plugins/bower_components/calendar/dist/fullcalendar.min.js'></script>

<script>

	var CalendarApp = function () {
		this.$body = $("body")
		this.$calendar = $('#calendar'),
			this.$event = ('#calendar-events div.calendar-events'),
			this.$categoryForm = $('#add-new-event form'),
			this.$extEvents = $('#calendar-events'),
			this.$modal = $('#my-event'),
			this.$saveCategoryBtn = $('.save-category'),
			this.$calendarObj = null
	};

	CalendarApp.prototype.init = function () {
		var sliders = '<?php echo json_encode($sliders); ?>';
		sliders = JSON.parse(sliders)

		var bg = ['bg-primary', 'bg-secondary', 'bg-success', 'bg-danger', 'bg-warning', 'bg-info', 'bg-dark'];

		var defaultEvents = [];
		for (i = 0; i < sliders.length; i++) {
			var back = bg[Math.floor(Math.random() * bg.length)];

			if (sliders[i].first_name != null && sliders[i].last_name != null) {
				var name = sliders[i].first_name + " " + sliders[i].last_name +",";
			} else {
				var name = "";
			}

			if (sliders[i].area_name != null && sliders[i].country_name != null && sliders[i].region_name != null) {
				var text = sliders[i].area_name + " - " + sliders[i].country_name + " - " + sliders[i].region_name+"."
			} else {
				var text = "";
			}

			defaultEvents.push({
				title: `${name} ${text}`,
				start: new Date(sliders[i].start),
				end: new Date(sliders[i].end),
				className: back,
			})
		}

		var $this = this;
		$this.$calendarObj = $this.$calendar.fullCalendar({
			handleWindowResize: true,
			header: {
				left: 'prev,next',
				center: 'title',
				right: ''
			},
			events: defaultEvents,
		});
	},
		//init CalendarApp
		$.CalendarApp = new CalendarApp, $.CalendarApp.Constructor = CalendarApp


	$(document).ready(function () {
		$.CalendarApp.init()
	})
</script>
