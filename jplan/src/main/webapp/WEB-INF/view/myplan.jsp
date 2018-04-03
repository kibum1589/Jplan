<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">   
<jsp:include page="../header.jsp"></jsp:include>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXyMFNPLugzjEZsYzoFUpid7Rs6Qa3M4A&libraries=places&callback=initMap&region=kr" async defer></script>

<script>
//맵 변수 선언
var map;
var service;
// 맵에 표시하기위한 param 으로 쓰일 함수
function initMap() {
  var korea = {lat:35.907757, lng:127.76692200000002};

  map = new google.maps.Map(document.getElementById('map'), {
    center: korea,
    zoom: 7,
    mapTypeId: 'roadmap'
  });
  
  service = new google.maps.places.PlacesService(map);
  
}

function createMarkers(places, placeList, placeData) {
	
	  var bounds = new google.maps.LatLngBounds();
	 
	  
	  // place 목록 붙이기
	  if(placeList)  {
		  
		  placeList.empty();
		  
		  placeList.append
		    (
		    '<a class="list-group-item active">'+
		    '<h4 class="list-group-item-heading">'+'Day 01'+'</h4>'
		    );
		  
		  var dayCount = 1;
		  for (var i = 0, place; place = places[i]; i++) {
			 
			  if (!place.geometry) {
			        console.log("Returned place contains no geometry");
			        return;
			      }
			  
		      
		    // 마커의 종합적인 설정
		    var photos = place.photos;
		    
		      
		    var marker = new google.maps.Marker({
		        // 표시할 맵
		      map: map,
		        // 표시할 마커 아이콘 설정
		      icon: photos[0].getUrl({'maxWidth': 35, 'maxHeight': 35}),
		        // 마커에 마우스 올려놓으면 나오는 글자 설정
		      title: place.name,
		        // 마커의 위치 설정
		      position: place.geometry.location,
		        // 애니메이션
		      animation: google.maps.Animation.DROP
		    });
		    
		      
		      // 지도 표시 범위
		    	if (place.geometry.viewport) {
		        bounds.union(place.geometry.viewport);
		      } else {
		        bounds.extend(place.geometry.location);
		      }
		      
				// placeList 붙여주기
					if(placeData[i].day!=dayCount){
						
						placeList.append
					    (
					    '<a class="list-group-item active">'+
					    '<h4 class="list-group-item-heading">'+'Day 0'+placeData[i].day+'</h4>'
					    );
						
						dayCount++;
					}
				
			    	placeList.append
				    (
				    '<a class="list-group-item place-detail-card" data-place='+place.place_id+'>'+
				    '<h4 class="list-group-item-heading">'+place.name+'</h4>'+
				    '<p class="list-group-item-text">'+place.formatted_address+'</p></a>'
				    );
			    	
		    
		  }
		  
	  }
	  
	  else{
		  if (!places.geometry) {
		        console.log("Returned place contains no geometry");
		        return;
		      }
		  
	      
	    // 마커의 종합적인 설정
	    var photos = places.photos;
	    
	      
	    var marker = new google.maps.Marker({
	        // 표시할 맵
	      map: map,
	        // 표시할 마커 아이콘 설정
	      icon: photos[0].getUrl({'maxWidth': 35, 'maxHeight': 35}),
	        // 마커에 마우스 올려놓으면 나오는 글자 설정
	      title: places.name,
	        // 마커의 위치 설정
	      position: places.geometry.location,
	    });
	    
	      
	      // 지도 표시 범위
	    	if (places.geometry.viewport) {
	        bounds.union(places.geometry.viewport);
	      } else {
	        bounds.extend(places.geometry.location);
	      }
	  }
	  
	    // 정한 범위를 지도 범위에 전달
	  map.fitBounds(bounds);
	}

</script>

<script>
	$(document).ready(function(){
		
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
</script>


  

<c:forEach items="${planList}" var="plan">
<!-- 포스터 -->
<br>
<div class="media" >
  <div class="media-left">
    
      <img class="media-object" src="..." alt="..." style="width: 100;height: 100">
    
  </div>
  <div class="media-body planPoster" style="padding: 5" data-place="${plan.no }">
    
    <h3 class="media-heading" style="margin-bottom: 20">${plan.title} </h3>
    <h5>${plan.sday} </h5>
  </div>
  
  <div class="detail-container" style="margin-left: 100; display: flex; flex-direction: row">
	  <div class="list-group detail-list" style="flex-grow:4">
	  </div>
	  
	  <div id = "map" style="width: 300; height: 300; flex-grow: 1"/>
  </div>
  
</div>
</c:forEach>	

 



 <jsp:include page="../footer.jsp"></jsp:include>