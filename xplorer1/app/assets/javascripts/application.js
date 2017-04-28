// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

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

    zoom: 3,

    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map"),
    mapOptions);
};




$(document).on('ready page:load', function() {
  // Actions to do
  setTimeout(function(){
  initMap();
  getTheData();
}, 100);


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
      path: [{lat, lng}, {lat, lng}],
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

google.maps.event.addListener(issMarker, 'click', function(){
  window.location.href = issMarker.url
});



  function onError(e1, e2, e3) {
    console.log("it didnt work", e1);
    console.log("it didnt work", e2);
    console.log("it didnt work", e3);

  }
}


setInterval(getTheData, 3000);


// var loadAPIPromise;
// // Load API
// function loadAPI(callback) {
//   if (!loadAPIPromise) {
//     var deferred = $.Deferred();
//     $.ajax({
//       url: 'https://maps.googleapis.com/maps/api/js?key=',
//       dataType: "script",
//       success: function() {
//         google.load('maps', '3', {
//           callback: function() {
//             deferred.resolve();
//           },
//           other_params: 'sensor=false'
//         });
//       }
//     });
//     loadAPIPromise = deferred.promise();
//   }
//   loadAPIPromise.done(callback);
// };
