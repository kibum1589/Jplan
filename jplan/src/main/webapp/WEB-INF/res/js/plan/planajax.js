$(document).ready(function(){
		
		$(window).scroll(function(){
			console.log($(document).scrollTop());
			$('#map').animate( { top : $(document).scrollTop() }, 50 );
		})
		
		$(".detail-container").hide();
		
		$(".planPoster").click(function(){
			
			var thisPoster  = $(this);
			var pno = thisPoster.data("place");
			
			$.ajax({
				url: "myplan/detail",
		        type:'GET',
		        data: {pno:pno},
		        dataType:"json",
		        
		    	})
		    	.done(function(data){
		    		
		    		var placeList = thisPoster.next(".detail-container").find(".detail-list")
		    		
		    		 var detailPlaceList = new Array();
		    		 
		    		 for(var i = 0 ; i< data.length ; i++){
		    		   			
		    		   			// 파라미터 생성
		    		   			var request = {
		    		   					placeId: data[i].pid
		    		        	};
		    		   			
		    		   			var count = 0;
		    		   			// 구글에 장소 세부정보 요청
		    		        	service.getDetails(request, function(place, status){
		    		        		
		    		        		
		    		        		if (status == google.maps.places.PlacesServiceStatus.OK) {
		    		        			detailPlaceList.push( place );
		    		        			count++;
		    		        		 }
		    		        		
		    		        		if(count==data.length){
		    		        			createMarkers(detailPlaceList,placeList,data);
		    		        		}
		    		        		
		    		        		
		    		        	});

		    		 }
		    		 
		    		 thisPoster.next(".detail-container").slideToggle();
		    	});
		})
		
		
		// 해당 카드 클릭시 맵 마커 확대
		$(document).on("click",".place-detail-card",function(){
			
			console.log($(this).data("place"));
			
			var request = {
   					placeId: $(this).data("place")
        	};
   			
   			
   			// 구글에 장소 세부정보 요청
        	service.getDetails(request, function(place, status){
        		
        		if (status == google.maps.places.PlacesServiceStatus.OK) {
        			createMarkers(place);
        		 }
        		
        	});
   			
		})
		
	})