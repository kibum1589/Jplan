$( function() {
	    $( "#sortable1, #sortable2" ).sortable({
	      connectWith: ".connectedSortable",
	      items: "a:not(.day-default)",
	      cancel: ".day-list"
	    });
	    $("#sortable1 a, #sortable2 a").disableSelection();
	  } );