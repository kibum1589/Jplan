<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>

<style>
  		.reivew{
            display: flex;
            flex-wrap: wrap;
        }
    
    	.reivew > .impo{
            flex-grow:1;
/*            width:33.3333%;*/
            width:20%;
            
            height:40%;
            
            padding:10px;
            
/*            넘어가는 항목은 보여주지 않겠다*/
            overflow: hidden;
        }
    

        .search{
            width: 30%;
            margin-left: 35%;
            font-size: 20px;
            
            padding: 15px;
            padding-left: 50px;
            
            /*검색 이미지 설정*/
            background-image: url(img/search.png);
            background-repeat: no-repeat;
            background-size: 40px;
            background-position: 5px 5px;
        }
        
        #search-list{
        	flex:2;
        }
        
        #search-area{
        	display: flex;
        	margin-top: 10%;
        	flex-direction: row
        } 
        
        #map{
        	flex: 1;
        	height: 100%
        }
        
        .place-datail{
        	display: flex;
        	height: 300px;
        	margin-bottom: 20px;
        	flex-direction: row;
        }
        
        .place-img{
			width:30%;
        }
        
        .place-review{
        	display: flex;
        	flex-grow:1;
        	flex-direction:column;
        }
        
        .place-btn{
        	display:flex;
        	flex:1;
        }
        
        .place-btn-src{
        	width: 20px;
        	height: 20px;
        	margin: 0 20px;
        }
        
        .place-reply{
        	flex:2;
        	display: flex;
        
        }
        
        .place-reply-input{
        	flex:9;
        	padding: 0 20px;
        	font-size: 15px;
        }
        
        .place-reply-btn{
        	flex:1;
        	font-size: 20px;
        	font-weight: bold;
     		background-color: lightblue;
     		color: white;
        }
        
        .place-reply-input{
        }
        
        .place-reply-list{
        	flex:8
        }
</style>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
			const replyimg = "${pageContext.request.contextPath}/res/icon/reply.png";
			const loveonimg = "${pageContext.request.contextPath}/res/icon/like-on.png";
			const loveoffimg = "${pageContext.request.contextPath}/res/icon/like-off.png";
			
			var map;
			function initAutocomplete() {
					var korea = {lat:35.907757, lng:127.76692200000002};
					map = new google.maps.Map(document.getElementById('map'), {
		         		center: korea,
		          		zoom: 7,
		          		mapTypeId: 'roadmap'
		        	});
				
					var input = document.getElementById('google-search');
			        var searchBox = new google.maps.places.SearchBox(input);
			        
			        searchBox.addListener('places_changed', function() {
			        	
			        	// 장소 검색결과 배열 얻어오기
			            var places = searchBox.getPlaces();
			            
			            // 검색 공간 나타나는 이벤트
			            $("#search-area").slideDown();
						
			            if (places.length == 0) {
			              console.log("검색결과 없음");
			              return;
			            }
			            
			            // 검색전에 기존 리스트 모두 삭제
			            $("#search-list *").remove()
			            
			            // 검색결과 리스트에 표시
			            places.forEach(function(place) {
			            
			            // 검색결과 한단위 표시
			            var $plist = $(
			            		  '<a class="list-group-item place-list">'+
							  	  '<h4 class="list-group-item-heading">'+place.name+'</h4>'+
							  	  '<p class="list-group-item-text">'+place.formatted_address+'</p></a>'+
							  	  
							  	  '<div class="place-datail">'+
							  	  '<img class ="place-img" src="'+place.photos[0].getUrl({'maxWidth': 500, 'maxHeight': 500})+'">'+
							  	  
							  	  '<div class="place-review">'+ 
							  	  
							  	  '<div class="place-btn">'+
							  	  '<img class="place-btn-src" src="'+replyimg+'">'+
							  	  '<p class="reply-count">'+0+'</p>'+
							  	  '<img class="place-btn-src" src="'+loveonimg+'">'+
							  	  '<p class="love-count">'+0+'</p>'+
							  	  '</div>'+
							  	  
							  	  '<div class="place-reply">'+
							  	  '<input class="place-reply-input" data-place = "'+place.place_id+'" type="text" name="content" placeholder="댓글 내용을 입력하세요"/>'+
							  	  '<button class="place-reply-btn" type="button">작성</button>'+
							  	  '</div>'+
							  	
							  	  '<div class="place-reply-list">'+
							  	  '</div>'+
							  	  
							  	  
							  	  '</div>'+
							  	  '</div>');
			            
			            	// 태그에 data props 넣기 
				            $plist.data( "place", place );
				            
				              
				            $('#search-list').append($plist);
						  	$(".place-datail").hide();  
						  	  
			            });
		
			          });
			}
			
			
			
			$(document).ready(function(){
				
				$("#search-area").hide();
				
				// 검색어 지울시 사라지도록
				$('#google-search').keyup(function(){
					if(!$('#google-search').val())
						$("#search-area").slideUp();
				})
				
				// 댓글 입력 ajax 통신
				$(document).on('click','.place-reply-btn',function(){
					var replyText = $(this).prev('input').val();
					var placeId = $(this).prev('input').data("place");
				});
				
				// DB에 해당장소 등록
// 				var checkFunc = 
// 					$.ajax({
// 						url: 'createPlace',
// 						type: 'GET',
// 						data:
// 					})
				
				
				// DB에 해당 장소 리뷰 등록
				
				// DB에 해당 장소 좋아요수 증가
				
				
				// 클릭시 지도에 표시
				var markers = [];
				$(document).on('click','.place-list',function(){
					
					$(this).next('.place-datail').slideToggle(); 
					
					var place = $(this).data("place");
					console.log(place.place_id);
					
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
				
				
			});
			
			
</script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAf7PTKOt9r_f0tPtAWICf4xjvB0_qtw4E&libraries=places&callback=initAutocomplete&region=kr"async defer></script> 


    <input class="search" type="text" placeholder="검색어 입력" id = "google-search">
    
    <div id = "search-area">
	    <div class="list-group" id="search-list">
		</div>
		<div id="map"></div>
	</div>
    
    <div class="row in-align-center font-title">
        인기 여행지 Top6
    </div>
    
    <!-- 갤러리 영역 -->
    <div class="gallary">
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/1.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/2.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/3.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/4.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/5.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/6.jpg"></div>
    </div> 
    
    <!-- 이용방법 영역 -->
    <div class="container-100 out-align-center">
        <div class="row in-align-center font-big">최근리뷰</div>
    </div>
    
    <div class="reivew">
        <div class="impo">리뷰정보</div>
        <div class="impo">리뷰정보</div>
        <div class="impo">리뷰정보</div>
        <div class="impo">리뷰정보</div>
    </div>
    
    <div class="remote">
        <a href="#">Top</a>
    </div>
    
    <jsp:include page="../footer.jsp"></jsp:include>