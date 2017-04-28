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
console.log("hello");

function initMap() {
  geocoder = new google.maps.Geocoder()
  var mapOptions = {
    center: new google.maps.LatLng(37.79, -122.40),
    zoom: 6,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  map = new google.maps.Map(document.getElementById("map"),
    mapOptions);

}

$(document).on('ready page:load', function() {
  // Actions to do
  initMap();
});

//GEOCODER
function codeAddress() {
  console.log('You clicked me!');
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
