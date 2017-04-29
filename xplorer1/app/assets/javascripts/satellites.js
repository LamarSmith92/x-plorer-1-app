// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var geocoder;
var map;
var markers = [];
var issImage = 'https://image.ibb.co/cxo9Qk/sat_x1_img.png'; // TODO: lamar please change this to a small icon of ISS.
var issMarker;
console.log("hello");

function initMap() {
  geocoder = new google.maps.Geocoder()
  var mapOptions = {
    center: new google.maps.LatLng(37.79, -122.40),
    zoom: 6,
    mapTypeId: 'satellite'
  };

  map = new google.maps.Map(document.getElementById("map"),
    mapOptions);
};

$(document).on('ready', function() {

  // Actions to do
  setTimeout(function() {
    initMap();
    getTheData();
  }, 100);


setInterval(getTheData, 1500);


});

//GEOCODER
function codeAddress() {
  var address = document.getElementById('address').value;
  geocoder.geocode({
    'address': address
  }, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });
    } else {
      console.log('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function getTheData() {
  $.ajax({
    method: 'get',
    url: 'http://api.open-notify.org/iss-now.json',
    success: onSuccess,
    error: onError
  })

  function onSuccess(json) {

    //get the data we want and parseFloat
    var whatWeWant = json.iss_position;
    lat = parseFloat(whatWeWant.latitude);
    lng = parseFloat(whatWeWant.longitude);

    //set the marker to the way google map wants it
    var markerForMap = {
      lat: lat,
      lng: lng
    }

    // Define a symbol using SVG path notation, with an opacity of 1.
    var lineSymbol = {
      path: 'M 0,-1 0,1',
      strokeOpacity: 1,
      scale: 1
    };

    // Create the polyline, passing the symbol in the 'icons' property.
    // Give the line an opacity of 0.
    // Repeat the symbol at intervals of 20 pixels to create the dashed effect.
    var line = new google.maps.Polyline({
      path: [{
        lat,
        lng
      }, {
        lat,
        lng
      }],
      strokeOpacity: 0,
      icons: [{
        icon: lineSymbol,
        offset: '0',
        repeat: '10px'
      }],
      map: map
    });


    if (issMarker) {
      issMarker.setPosition(markerForMap)
    } else {
      issMarker = new google.maps.Marker({
        // and pass in the poistion
        position: markerForMap,
        map: map,
        title: 'ISS',
        icon: issImage,
        url: "/satellites/1"
      });
      map.setCenter(markerForMap);
    }

    google.maps.event.addListener(issMarker, 'click', function() {
      window.location.href = issMarker.url
    });
  }

  function onError(e1, e2, e3) {
    console.log("it didnt work e1", e1);
    console.log("it didnt work e2", e2);
    console.log("it didnt work e3", e3);
  }
}
