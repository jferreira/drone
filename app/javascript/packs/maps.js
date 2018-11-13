import GMaps from 'gmaps/gmaps.js';

// require('mapbox-gl/dist/mapbox-gl.css')
// // ADD THIS LINE 👇
// require('@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css')
// // [ ... ]


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

// if (mapElement) {
// // [ ... ]
//   markers.forEach((marker) => {
//     new mapboxgl.Marker()
//       .setLngLat([marker.lng, marker.lat])
//       .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
//       .setHTML(marker.infoWindow.content))
//       .addTo(map);
//   })
// // [ ... ]
// }

// if (mapElement) {
//   // [ ... ]
//   map.addControl(new MapboxGeocoder({
//     accessToken: mapboxgl.accessToken
//   }));
// }
