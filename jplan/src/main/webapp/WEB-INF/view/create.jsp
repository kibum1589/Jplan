<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  

    <style>
        a{
        	font-size: 0.7em;
        }
        
        .create-main {
        	height: 100%;
      	}
        
    </style>
    
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXyMFNPLugzjEZsYzoFUpid7Rs6Qa3M4A&libraries=places&callback=initMap&region=kr" async defer></script>
  	
  	<!-- 리스트 관련 스크립트 -->
  	<script>
	  $( function() {
	    $( "#sortable1, #sortable2" ).sortable({
	      connectWith: ".connectedSortable",
	      items: "a:not(.day-list)"
	    });
	    $("#sortable1 a, #sortable2 a").disableSelection();
	  } );
  	</script>
  	
  	<!-- 맵관련 스크립트 -->
  	<script>
        
        
      // 맵 변수 선언
      var map;
      var service;
      // 맵에 표시하기위한 param 으로 쓰일 함수
      function initMap(inputText) {
        var korea = {lat:35.907757, lng:127.76692200000002};

        map = new google.maps.Map(document.getElementById('map'), {
          center: korea,
          zoom: 7
        });
          
        if(inputText){
        	 var queryText = inputText
             // 장소 검색 서비스 선언
             service = new google.maps.places.PlacesService(map);
             service.textSearch({
               
               location: korea,
               radius: 50000,
                 
               // 타입을 뭐로해야하지..
//               type: ['store'],
         
               // 검색어 전달
               query: queryText
             }, processResults);
        }
       
      }
      
      // 장소 검색 서비스에 쓰일 콜백 함수 선언
      function processResults(results, status) {
        if (status !== google.maps.places.PlacesServiceStatus.OK) {
          return;
        } else {
        	
          // 마커 표시(넘어오는 results 그대로 넘겨주면 다수의 마커 생성)
        	createMarkers(results);
         	
        }
      }
      
        
        // 마커 표시 함수 선언
      function createMarkers(places) {
        var bounds = new google.maps.LatLngBounds();
        // place 목록 붙여줄 공간 할당
        var placesList = document.getElementById('sortable2');

          // place 목록 붙이기
        for (var i = 0, place; place = places[i]; i++) {
            
            
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
          console.log(place.formatted_address)
            // place 목록에 html형식으로 장소이름 찍어주기
          placesList.innerHTML += 
        	  
        	  '<a href="#" class="list-group-item" >'+
        	  '<h4 class="list-group-item-heading">'+place.name+'</h4>'+
        	  '<p class="list-group-item-text">'+place.formatted_address+'</p></a>';
              
            
            // 지도 표시 범위
          bounds.extend(place.geometry.location);
          
        }
          // 정한 범위를 지도 범위에 전달
        map.panToBounds(bounds);
      }
    </script>
    
    <script>
    	$(document).ready(function(){
    		
    		// 검색 버튼
    		$("#google-search-button").click(function(){
    			$("#sortable2 *").remove()
    			initMap($("#google-search").val())
    		})
    		
    		// 추가버튼
    		
    		
    	})
    </script>
	

    <div class="container-fluid">
        <div class="row form-inline">
            <div class="col-md-12 form-group">
                <input class="col-md-3 form-control" type="text" name="where" placeholder="어디" required>
                <input class="col-md-3 form-control" type="text" name="title" placeholder="제목" required>
                <input class="col-md-3 form-control" type="date" name="date" required>
                <a href="#" class="col-md-offset-1 col-md-1">나만보기</a>
                <a href="#" class="col-md-1">공유하기</a>
            </div>
        </div>
        <!-- 추가한 일정 리스트 -->
        
        <div class="row">
        	<div class = "col-md-3 ">
        		<p><a class="btn btn-primary btn-lg day-add-button" role="button">Day 추가</a></p>
		        <div id="sortable1" class="connectedSortable list-group create-main">
		        	<a href="#" class="list-group-item active day-list">
					    <h4 class="list-group-item-heading">Day 01</h4>
  					</a>
				</div>
			</div>
        
        <!-- 검색 결과 리스트 -->
        
        	<!-- 검색창 -->
        	<div class="col-md-4 form-inline create-main" >
        		<div class="input-group">
			      <input type="text" class="form-control" id="google-search" placeholder="찾으려는 장소 입력">
			      <span class="input-group-btn">
			        <button class="btn btn-default" id="google-search-button" type="button">Search</button>
			      </span>
			    </div><!-- /input-group -->
			
        	<div id="sortable2" class="connectedSortable list-group create-main">
			</div>
			</div>
        
        <!-- 맵표시 공간 -->
        	<div id="map" class ="col-md-5 create-main" >
        	</div>
        	
     </div>
     </div>

 
 
 <jsp:include page="../footer.jsp"></jsp:include>