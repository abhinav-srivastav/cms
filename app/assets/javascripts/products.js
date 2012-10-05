$(document).ready(function(){
$(".product").click(function(e){
e.preventDefault();

	$(this)
		.children("#product_desc").slideDown()
		.end()
		.siblings().children("#product_desc").slideUp();

});
});