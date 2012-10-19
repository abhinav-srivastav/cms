
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


      // function initialize() {
      //   var mapOptions = {
      //     zoom: 8,
      //     center: new google.maps.LatLng(-34.397, 150.644),
      //     mapTypeId: google.maps.MapTypeId.ROADMAP
      //   };
      //   var map = new google.maps.Map(document.getElementById('map_canvas'),
      //       mapOptions);
      // }

      // google.maps.event.addDomListener(window, 'load', initialize);


$(document).ready(function(){
	//$(".accordion").accordion();


	$(".bottom_bar").toggle(
		function(){
			$(".hidden_div").show("slide", { direction: "down" }, 300);
		},
		function(){
			$(".hidden_div").hide("slide", { direction: "down" } , 300)	
		}
	);
});