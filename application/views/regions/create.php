<div class="col-md-12">
	<div class="white-box">
		<h3 class="box-title m-b-30">Create Regions</h3>
		<div class="row">
			<div class="col-sm-12 col-xs-12">

				<div class="row map_part form-group">
					<div id="map" class="col-md-12" style="height: 500px;"></div>
				</div>

				<div class="form-group">
					<label>Region Name</label>
					<div>
						<input type="text" class="form-control" placeholder="Please enter region name" required>
					</div>
				</div>

				<div class="text-right">
					<button type="button" class="btn btn-success waves-effect waves-light m-r-10">Submit</button>
					<a href="<?= base_url("admin/regions") ?>">
						<button type="button" class="btn btn-inverse waves-effect waves-light">Return</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="http://maps.google.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyDsz2KPO5FSf6PDx2YwCTtB1HBt2DkXFrY"
		type="text/javascript"></script>

<script type="text/javascript">

    function initialize() {
        // Map Center
        var myLatLng = new google.maps.LatLng(33.89, 35.50);
        // General Options
        var mapOptions = {
            zoom: 14,
            center: myLatLng,
            mapTypeId: google.maps.MapTypeId.RoadMap
        };
        var map = new google.maps.Map(document.getElementById('map'), mapOptions);

        // Polygon Coordinates
        var triangleCoords = [
            new google.maps.LatLng(33.8816269, 35.5250569),
            new google.maps.LatLng(33.888940, 35.505366),
            new google.maps.LatLng(33.883133, 35.484460)
        ];
        // Styling & Controls
        myPolygon = new google.maps.Polygon({
            paths: triangleCoords,
            draggable: true, // turn off if it gets annoying
            editable: true,
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.35
        });

        myPolygon.setMap(map);
        //google.maps.event.addListener(myPolygon, "dragend", getPolygonCoords);
        google.maps.event.addListener(myPolygon.getPath(), "insert_at", getPolygonCoords);
        //google.maps.event.addListener(myPolygon.getPath(), "remove_at", getPolygonCoords);
        google.maps.event.addListener(myPolygon.getPath(), "set_at", getPolygonCoords);
    }

    initialize();

    //Display Coordinates below map
    function getPolygonCoords() {
        arr_latlng = [];
        var len = myPolygon.getPath().getLength();
        var paths = myPolygon.getPath().getArray();
        for (var i = 0; i < len; i++) {
            arr = [];
            lat = paths[i].lat();
            lng = paths[i].lng();
            arr = [lat, lng];
            arr_latlng.push(arr);
        }
        console.log(arr_latlng);

    }


</script>
