<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  

    <style>
        header{
            border: none;
        }
        aside, section{
            border:1px solid black;
        }
        .form{
            margin:10px 0px;
        }
        .form-input{
            border:1px solid black;
            padding:10px;
            font-size:16px;
            width:300px;
        }
        .btn{
            border:1px solid black;
            padding:10px;
            font-size:16px;
            width:100px;
            font-size:15px;
        }
        main{
            display: flex;
            flex-wrap: wrap;
        }
        
        header{
            width:100%;
            height:60px;
        }
        
        aside{
            width:300px;
            height:500px;
        }
        
        section{
            flex-grow: 1;
            height:500px;
        }
        
        #map {
        	height: 100%;
      	}
        
    </style>
    
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2uVnp7FCJksy8sVtci5WG9C9ajlMkO7I&libraries=places&callback=initMap" async defer></script>
  	
  	<!-- 리스트 관련 스크립트 -->
  	<script>
	  $( function() {
	    $( "#sortable1, #sortable2" ).sortable({
	      connectWith: ".connectedSortable"
	    }).disableSelection();
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
          zoom: 6
        });
          
        if(inputText){
        	 var queryText = inputText
             // 장소 검색 서비스 선언
             service = new google.maps.places.PlacesService(map);
             service.textSearch({
               
               location: korea,
               radius: 500,
                 
               // 타입을 뭐로해야하지..
//               type: ['store'],
         
               // 검색어 전달
               query: queryText
             }, processResults);
        }
       
      }
        
      // 장소 검색 서비스에 쓰일 콜백 함수 선언
      function processResults(results, status, pagination) {
        if (status !== google.maps.places.PlacesServiceStatus.OK) {
          return;
        } else {
          // 마커 표시(넘어오는 results 그대로 넘겨주면 다수의 마커 생성)
          createMarkers(results);
        
          // 좀더 많은 결과 표시해주기 (필요 할까..)
          if (pagination.hasNextPage) {
            var moreButton = document.getElementById('more');

            moreButton.disabled = false;

            moreButton.addEventListener('click', function() {
              moreButton.disabled = true;
              pagination.nextPage();
            });
          }
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

            // place 목록에 html형식으로 장소이름 찍어주기
          placesList.innerHTML += '<li id="search-list">' + place.name + '</li>';
            
            // 지도 표시 범위
          bounds.extend(place.geometry.location);
          
        }
          // 정한 범위를 지도 범위에 전달
        map.fitBounds(bounds);
      }
    </script>
    
    <script>
    	$(document).ready(function(){
    		$("#google-search").keyup(function(){
    			$("#sortable2 *").remove()
    			initMap($("#google-search").val())
    			console.log($("#google-search").val())
    		})
    	})
    </script>
	

    <main>
        <header>
            <div class="form">
                <input class="form-input" type="text" name="where" placeholder="where" required>
                <input class="form-input" type="text" name="title" placeholder="title" required>
                <input class="form-input" type="date" name="date" placeholder="date" required>
                <a href="#" class="right">나만보기</a>
                <a href="#" class="rright">공유하기</a>
            </div>
        </header>
        <!-- 추가한 일정 리스트 -->
        <aside>
	        <ul id="sortable1" class="connectedSortable">
			  <li class="ui-state-default">Item 1</li>
			  <li class="ui-state-default">Item 2</li>
			  <li class="ui-state-default">Item 3</li>
			  <li class="ui-state-default">Item 4</li>
			  <li class="ui-state-default">Item 5</li>
			</ul>
        </aside>
        <!-- 검색 결과 리스트 -->
        <aside>
        	<!-- 검색창 -->
        	<div class="input-group" >
			  <input type="text" class="form-control" placeholder="검색할 장소이름" aria-describedby="basic-addon2" id = "google-search">
			  <span class="input-group-addon" id="basic-addon2">검색</span>
			</div>
			
        	<ul id="sortable2" class="connectedSortable">
			</ul>
        </aside>
        <!-- 맵표시 공간 -->
        <section>
        	<div id="map"></div>
        </section>
    </main>   

 
 
 <jsp:include page="../footer.jsp"></jsp:include>