$(document).ready(function(){

  $("div #details").hide().first().show().addClass("active");

  $(".product_name").click(function(e){
    e.preventDefault();
  	console.log($("div.active"))
  	$("div.active").hide("slide", { direction: "left" }, 0 , function(){
  		$("div."+prod_id).show("slide", { direction: "right"}, 0).addClass("active");
  	}).removeClass("active");	
  	var prod_id = $(this).attr("id");	
  });
});