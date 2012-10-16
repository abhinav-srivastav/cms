// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui

function add_images(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g" )
	console.log($(link))
	$(link).before(content.replace(regexp, new_id));
}

$(document).ready(function(){
	old_pos = {};
  $("#sortable tr").each(function(index){
    old_pos[$(this).attr('id')] =  index + 1;
  });
  $("*#sortable tbody.content").sortable( {
    update: function(){      
      current_row = {};
	    i = 1
      $("#sortable tr").each(function(index){
		    if(old_pos[$(this).attr('id')] !=  index + 1) {
          current_row['last_id'] = $(this).attr('id')
          current_row['last_position'] = index + 1   
          
          if( i == 1 ) {
            current_row['first_id'] = $(this).attr('id')
            current_row['first_position'] = index + 1   
            i = 0
          }
        }
	    });
      $("#sortable tr").each(function(index){
        old_pos[$(this).attr('id')] =  index + 1;
      });
      current_row["tablename"] = $(this).parent().attr('name');  
      $.ajax({
      	url: "/application/sorting",
      	data: current_row,    
      });
    } 
  });
  $("*#sortable tbody.content").disableSelection();
});
