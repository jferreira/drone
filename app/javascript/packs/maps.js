import GMaps from 'gmaps/gmaps.js';

console.log("messsiiiii");

const mapElement = document.getElementById('map');
console.log(mapElement);
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}
        // var contentString = "<div>Hello</div>"

        // var infowindow = new google.maps.InfoWindow({
        //   content: contentString,
        //   maxWidth: 200
        // });

      //   var marker = new google.maps.Marker;

      //   marker.addListener('click', function() {
      //     infowindow.open(map, marker);
      //   });
      // }


//{lat: -8.7223957, lng: 115.1767095}
