
$(document).ready(function(){
	
	$("#search-area").hide();
	
	// 검색어 지울시 사라지도록
	$('#google-search').keyup(function(){
		if(!$('#google-search').val())
			$("#search-area").slideUp();
	})
	
	// 리뷰 입력 ajax 통신
	$(document).on('click','.place-reply-btn',function(){
		
		var reviewList = $(this).parent().next('.place-reply-list')
		var replyText = $(this).prev('input').val();
		var placeId = $(this).prev('input').data("place");
		var replyInput = $(this).prev('input')
		
		if(!replyText){
			replyInput.attr('placeholder','내용이 존재하지 않습니다');
			replyInput.css('border','1px solid red');
			return;
		}
		
		var reviewData={
				content : replyText,
				pid : placeId
		};
		
		// 리뷰 작성 ajax
		$.ajax({
		       url: "place/writeReview",
		       type:'GET',
		       data: reviewData,
		       dataType:"json",
		       error: function(){
		    	   alert("로그인한 회원만 가능합니다");
		       }
		    })
		    .done(function(data){
		    	replyInput.attr('placeholder','댓글 내용을 입력하세요');
				replyInput.css('border','1px solid lightgray');
				replyInput.val("");
				
		    	reviewList.empty();
		    	for(var i = 0; i < data.review_list.length; i++){
		    		reviewList.append("<h4>"+data.review_list[i].content+
		    									" / " +data.review_list[i].reg+
		    									"</h4>");
				};
		    })
		
	});

	

	
	
	
	// 장소 list 클릭시 이벤트
	var markers = [];
	$(document).on('click','.place-list',function(){
		
		var loveFlag;
		
		//love, review ajax 조회
		var placeId={
				pid: $(this).data("place").place_id,
		}
		
		var thisList = $(this);
		var getLCData= function(data){
			
			thisList.next(".place-datail").find(".reply-count").text(data.review_list.length);
			thisList.next(".place-datail").find(".love-count").text(data.love_count);
			thisList.next(".place-datail").slideToggle();
			
			loveFlag=data.loveFlag;
			
			if(loveFlag){
				thisList.next(".place-datail").find(".love-img").attr("src",loveonimg);
			}
			else{
				thisList.next(".place-datail").find(".love-img").attr("src",loveoffimg);
			}
			
			thisList.next(".place-datail").find(".place-reply-list").empty();
			
			for(var i = 0; i < data.review_list.length; i++){
				thisList.next(".place-datail").find(".place-reply-list")
				 .append("<h4>"+data.review_list[i].content+
								  	" / " +data.review_list[i].reg+
								"</h4>");
				
			};
			
			
				
		};
		
		
		$.ajax({
	       url: "place/checkLC",
	       type:'GET',
	       data: placeId,
	       dataType:"json",
	       
	       success:function(data){
	        getLCData(data);
	       },
	       
	       error: function(err){
	        console.log(err)
	       }
	        	
	    });
		
		
		
		
		var place = $(this).data("place");
		
		markers.forEach(function(marker) {
            marker.setMap(null);
          });
        markers = [];
        
        // 마커생성
        markers.push(new google.maps.Marker({
              map: map,
              icon: place.photos[0].getUrl({'maxWidth': 70, 'maxHeight': 70}),
              title: place.name,
              position: place.geometry.location
        }));
        
        // 지도 범위설정
        var bounds = new google.maps.LatLngBounds();
        if (place.geometry.viewport) {
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
		map.fitBounds(bounds);
        
	})
	
	
//		좋아요 토글 ajax
	$(document).on('click',".love-img",function(){
		
		var loveCount = $(this).next(".love-count");
		
		var loveFlag;
		
		var loveIcon = $(this)
		
		// 감소
		if(loveIcon.attr("src")==loveonimg){ 	
			loveFlag=false;
		}
		
		// 증가
		else{	 
			loveFlag=true
		}
		
		
		var loveData = {
				pid: loveCount.data("place"),
				loveFlag: loveFlag
		};
		
			$.ajax({
			       url: "place/loveAction",
			       type:'GET',
			       data: loveData,
			       dataType:"json",
			       success: function(data){
			    	   loveCount.text(data);
			    	   
			    	   if(loveFlag) 	loveIcon.attr("src",loveonimg);
			    	   else				loveIcon.attr("src",loveoffimg);
			    		
			       },
			       error: function(){
			    	   alert("로그인한 회원만 가능합니다")
			       }
			    });
		
		
	});
	
});