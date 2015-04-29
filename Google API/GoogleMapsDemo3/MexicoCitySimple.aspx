<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MexicoCitySimple.aspx.vb" Inherits="MexicoCitySimple" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Mexico City, Mexico</title>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    
    <script type="text/javascript">
        function init_map(map_canvas_id, lat, lng, zoomLevel) {
            var myLatLng = new google.maps.LatLng(lat, lng);

            var options = {
                zoom: zoomLevel,
                center: myLatLng,
                mapTypeId: google.maps.MapTypeId.HYBRID
            };

            var map_canvas = document.getElementById(map_canvas_id);

            var map = new google.maps.Map(map_canvas, options);
        }
    </script>
</head>
<body>
    <h2>Mexico City, Mexico</h2>
    
    <div id="my_map" style="width:400px;height:300px"></div>
    
    <p>
        You are viewing a hybrid map of Mexico City!
    </p>
    
    <script type="text/javascript">
        init_map('my_map', 19.4270499, -99.1275711, 14);
    </script>
</body>
</html>
