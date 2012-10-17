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