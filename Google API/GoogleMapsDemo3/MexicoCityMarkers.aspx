<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MexicoCityMarkers.aspx.vb" Inherits="MexicoCityMarkers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Mexico City, Mexico</title>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    
    <script type="text/javascript">
        var markers =
            [
                {
                    title: "National Art Museum",
                    position: new google.maps.LatLng(19.4351262, -99.1334024)
                },
                {
                    title: "Viceroyal Painting Gallery",
                    position: new google.maps.LatLng(19.4331008, -99.1492114)
                },
                {
                    title: "Carmelitan Museum",
                    position: new google.maps.LatLng(19.3028860, -99.2352628)
                },
                {
                    title: "San Carlos Museum",
                    position: new google.maps.LatLng(19.3201515, -99.2265153)
                }
            ];
    
        function init_map(map_canvas_id, lat, lng, zoomLevel) {
            var myLatLng = new google.maps.LatLng(lat, lng);

            var options = {
                zoom: zoomLevel,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var map_canvas = document.getElementById(map_canvas_id);

            var map = new google.maps.Map(map_canvas, options);

            // Place markers
            var bounds = new google.maps.LatLngBounds();

            for (var i = 0; i < markers.length; i++) {
                var marker = new google.maps.Marker(markers[i]);
                marker.setMap(map);

                bounds.extend(marker.getPosition());
            }

            map.fitBounds(bounds);
            map.setCenter(bounds.getCenter());
        }
    </script>
</head>
<body>
    <h2>Museums in Mexico City, Mexico</h2>
    
    <div id="my_map" style="width:500px;height:400px;border:solid 1px #333"></div>
    
    <p>
        The markers below highlight some of Mexico City's fine museums.
    </p>
    
    <script type="text/javascript">
        init_map('my_map', 19.4270499, -99.1275711, 14);
    </script>
</body>
</html>
