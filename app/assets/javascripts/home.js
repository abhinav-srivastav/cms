
// // function initialize() {
// //         var mapOptions = {
// //           center: new google.maps.LatLng(40.7193818, -73.9943847),
// //           zoom: 16,
// //           mapTypeId: google.maps.MapTypeId.SATELLITE
// //         };
// //         var map = new google.maps.Map(document.getElementById("map_canvas"),
// //             mapOptions);
// //       }

// //       google.maps.event.addDomListener(window, 'load', initialize);


      

$(document).ready(function(){
	//$(".accordion").accordion();
  var geocoder;
  geocoder = new google.maps.Geocoder();
  var map;

  function initialize() {
    var mapOptions = {
      center: new google.maps.LatLng(40.7193818000, -73.9943847000),
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"),mapOptions);         
    console.log(map)
  }

  function geocode() {
    var ad = "337,broome street,new york";
    geocoder.geocode( { 'address': ad}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      }
      else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  function call_sequence() {
    initialize();
    geocode();
  }

  google.maps.event.addDomListener(window, 'load', call_sequence);

	$(".bottom_bar").toggle(
		function(){
			$(".hidden_div").show("slide", { direction: "down" }, 300);
		},
		function(){
			$(".hidden_div").hide("slide", { direction: "down" } , 300)	
		}
	);
});