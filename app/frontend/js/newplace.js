// const Geocoder = require('node-geocoder');
// import { NodeGeocoder } from 'node-geocoder';

window.newPlacePage = () => {
  let latlng = [0.0, 0.0];

  console.log(localStorage.getItem('newplace-map-location'));

  if (localStorage.getItem('newplace-map-location')) {
    latlng = JSON.parse(localStorage.getItem('newplace-map-location'));
  }

  let map = L.map('map').setView(latlng, 10);
  let marker;

  L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'sk.eyJ1IjoiaHVudGkiLCJhIjoiY2twd3J0dDQ5MWczdTJ1bm9xeXhoZWc2eCJ9.MEGM9kySBOwTh46vZ7eTMg'
  }).addTo(map);

  map.on('click', evt => {
    let { lat, lng } = evt.latlng;
    if (marker) marker.remove();
    marker = L.marker([lat, lng])
      .addTo(map);

    localStorage.setItem('newplace-map-location', JSON.stringify([lat,lng]));

    marker.on('click', evt => marker.remove());
  });

  document.getElementById('place_picture_image').addEventListener('change', function(event) {
    let image = URL.createObjectURL(event.target.files[0]);
    document.getElementById('img_prev').src = image;
  })
};
