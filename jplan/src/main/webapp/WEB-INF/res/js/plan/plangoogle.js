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