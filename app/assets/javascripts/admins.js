$(document).ready(function(){
	old_pos = {};
  $("tr").each(function(index){
    old_pos[$(this).attr('id')] =  index + 1;
  });
  $("*#sortable tbody.content").sortable( {
    update: function(){      
      current_row = {};
	    i = 1
      $("tr").each(function(index){
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



      console.log(current_row)
      $("tr").each(function(index){
        old_pos[$(this).attr('id')] =  index + 1;
      });
      current_row["tablename"] = $(this).parent().attr('name');  
      $.ajax({
      	url: "/admins/sorting",
      	data: current_row,    
      });
    } 
  });
  $("*#sortable tbody.content").disableSelection();
});