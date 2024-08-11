<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ev="http://xyz.com/ev"
    exclude-result-prefixes="ev">

    <!-- Match the root element -->
    <xsl:template match="/ev:ev">
        <html>
            <head>
                <title>EV Trip Planner</title>
                <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
                <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
                <style>
                    #map {
                        height: 400px; /* or whatever height you need */
                        width: 100%;
                    }
                </style>
            </head>
            <body onload="initMap()">
                <h1>EV Trip Planner</h1>
                <table border="1">
                    <tr>
                        <th>User ID</th>
                        <th>User Name</th>
                        <th>Email</th>
                        <th>Vehicle Model</th>
                        <th>Range</th>
                        <th>Battery Capacity</th>
                        <th>Charging Station Name</th>
                        <th>Charging Station Location</th>
                        <th>Charging Station Type</th>
                        <th>Route Start</th>
                        <th>Route End</th>
                        <th>Distance</th>
                        <th>Time</th>
                        <th>Hotel Name</th>
                        <th>Hotel Location</th>
                        <th>Hotel Rating</th>
                        <th>Booking ID</th>
                        <th>Booking Status</th>
                        <th>Room Type</th>
                        <th>Waypoint Type</th>
                        <th>Waypoint Location</th>
                        <th>Waypoint Rating</th>
                        <th>Feedback Comment</th>
                        <th>Feedback Rating</th>
                        <th>Feedback Type</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="ev:user/ev:userid"/></td>
                        <td><xsl:value-of select="ev:user/ev:user_name"/></td>
                        <td><xsl:value-of select="ev:user/ev:email"/></td>
                        <td><xsl:value-of select="ev:vehicle/ev:model"/></td>
                        <td><xsl:value-of select="ev:vehicle/ev:range"/></td>
                        <td><xsl:value-of select="ev:vehicle/ev:battery_capacity"/></td>
                        <td><xsl:value-of select="ev:charging_station/ev:name"/></td>
                        <td><xsl:value-of select="ev:charging_station/ev:location"/></td>
                        <td><xsl:value-of select="ev:charging_station/ev:charger_type"/></td>
                        <td><xsl:value-of select="ev:route/ev:start_location"/></td>
                        <td><xsl:value-of select="ev:route/ev:end_location"/></td>
                        <td><xsl:value-of select="ev:route/ev:distance"/></td>
                        <td><xsl:value-of select="ev:route/ev:time"/></td>
                        <td><xsl:value-of select="ev:hotel/ev:name"/></td>
                        <td><xsl:value-of select="ev:hotel/ev:location"/></td>
                        <td><xsl:value-of select="ev:hotel/ev:rating"/></td>
                        <td><xsl:value-of select="ev:booking/ev:bookingID"/></td>
                        <td><xsl:value-of select="ev:booking/ev:booking_status"/></td>
                        <td><xsl:value-of select="ev:booking/ev:room_type"/></td>
                        <td><xsl:value-of select="ev:waypoint/ev:type"/></td>
                        <td><xsl:value-of select="ev:waypoint/ev:location"/></td>
                        <td><xsl:value-of select="ev:waypoint/ev:rating"/></td>
                        <td><xsl:value-of select="ev:feedback/ev:comment"/></td>
                        <td><xsl:value-of select="ev:feedback/ev:rating"/></td>
                        <td><xsl:value-of select="ev:feedback/ev:feedback_type"/></td>
                    </tr>
                </table>
                
                <h2>Route Between Kerala And Banglore</h2>
                <div id="map" class='map'></div>
                <script>
                    function initMap() {
                      // Initialize map centered between banglore and kerala
                      var map = L.map('map').setView([27.84, 77.57], 7); // Centered between banglore and kerala
          
                      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        maxZoom: 19,
                        attribution: '© OpenStreetMap contributors'
                      }).addTo(map);
          
                      // Define the coordinates for the route
                      var routeCoordinates = [
                        
                        [10.27, 76.01],  // kerala
                        [12.58, 77.35], // banglore
                      ];
          
                      // Draw the route on the map with better visibility
                      var polyline = L.polyline(routeCoordinates, { color: 'blue', weight: 5 }).addTo(map);
                      map.fitBounds(polyline.getBounds()); // Fit map to the route
          
                      // Add markers for each location
                      L.marker(routeCoordinates[0]).addTo(map).bindPopup('kerala').openPopup();
                      L.marker(routeCoordinates[1]).addTo(map).bindPopup('banglore').openPopup();
                    }
                  </script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
