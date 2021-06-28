window.newPlacePage = () => {
  let latlng = [0.0, 0.0];
  let number = 1;

  var geocoder = require('geocoder');

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

    // Geocoding
    geocoder.reverseGeocode(lat, lng, function ( err, data ) {
      let parts = data.results[0].address_components.reverse();
      parts.forEach((part) => {
        // Fill in country field
        if (part.types.includes('country')) {
          let country_field = document.getElementById('place_address_country');
          country_field.value = part.short_name;
        };

        // Fill in city field
        if (part.types.includes('administrative_area_level_1')) {
          let city_field = document.getElementById('place_address_state_region');
          city_field.value = part.long_name;
        };

        // Fill in state or region field
        if (part.types.includes('locality')) {
          let city_field = document.getElementById('place_address_city');
          city_field.value = part.long_name;
        };

        // Fill in details as street field
        if (part.types.includes('route')) {
          let street_field = document.getElementById('place_address_details');
          street_field.value = part.long_name;
          console.log(part.long_name);
        };

        // Fill in details as street number field
        if (part.types.includes('street_number')) {
          let number_street_field = document.getElementById('place_address_details');
          number_street_field.value += `, ${ part.long_name }`;
          console.log(part.long_name);
        };
      });

    }, { key: '' });         //api key

    if (marker) marker.remove();
    marker = L.marker([lat, lng])
      .addTo(map);

    localStorage.setItem('newplace-map-location', JSON.stringify([lat,lng]));

    marker.on('click', evt => marker.remove());
  });


  document.getElementById('place_picture_image').addEventListener('change', (event) => {
    let inputImage = document.getElementById('place_picture_image');
    let n = Array.from(event.target.files);
    let position = 0;
    let fileList = inputImage.files;

    n.forEach((file) => {
      let fileInputColumn = document.getElementById('fileInputColumn');
      let newimage_div = document.createElement('div');
      let newimage = document.createElement('img');
      let link_to_delete = document.createElement('a');
      let cloneInput = inputImage.cloneNode();
      let image = URL.createObjectURL(file);

      // set custom FileList, all to line 60
      let list = new DataTransfer();
      let listItem = fileList[position++];

      list.items.add(listItem);

      let myImage = list.files;

      // Creating new input
      cloneInput.files = myImage;
      cloneInput.id = 'place_picture_image-' + (number++);
      fileInputColumn.appendChild(cloneInput);

      // Creating delete link
      link_to_delete.text = 'delete';
      link_to_delete.className = 'delete_image';
      link_to_delete.id = 'delete-' + cloneInput.id;
      newimage_div.appendChild(link_to_delete);

      // Creating preview
      newimage.src = image;
      newimage_div.id = 'preview-' + cloneInput.id;
      newimage_div.className = 'preview-div';
      newimage_div.appendChild(newimage);
      document.getElementById('image-column').appendChild(newimage_div);

      // Add eventListener for delete image
      document.getElementById(link_to_delete.id).addEventListener('click', () => {
        document.getElementById(cloneInput.id).outerHTML = '';
        document.getElementById(newimage_div.id).outerHTML = '';
      });
    });
    inputImage.value = '';
  });
};
