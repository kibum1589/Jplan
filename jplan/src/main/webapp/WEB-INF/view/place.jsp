<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>

<style>
  		.review{
            display: flex;
            flex-wrap: wrap;
        }
    
    	.review > .impo{
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
					
					// 컨트롤러에서 보낸 인기장소 id 이용하여 정보 얻어오기
					service = new google.maps.places.PlacesService(map);
					var hotPlaces = JSON.parse('${hotPlaces}').list;
					
					hotPlaces.forEach(function(pid){
						var request = {
								placeId: pid
						};
						
						service.getDetails(request, getDetailCallback);
						
						function getDetailCallback(place, status){
							if (status == google.maps.places.PlacesServiceStatus.OK) {
							    $('#hotPlaceArea').append(
							    		'<div class="col-md-4">'+
									      '<div class="thumbnail">'+
									        '<a href="'+place.photos[0].getUrl({'maxWidth': 500, 'maxHeight': 500})+'" target="_blank">'+
									          '<img src="'+place.photos[0].getUrl({'maxWidth': 500, 'maxHeight': 500})+'" class="img-thumbnail" alt="Lights" style="height:200">'+
									          '<div class="caption">'+
									            '<h4>'+place.name+'</h4>'+
									          '</div>'+
									        '</a>'+
									      '</div>'+
									    '</div>'
							    	)
							  };
						};
						
					});
					
					// 최근 리뷰 정보 가져오기
					var reviewList = JSON.parse('${reviewList}').list;
					
					reviewList.forEach(function(review){
						var request = {
								placeId: review.pid
						};
						
						service.getDetails(request, getDetailCallback);
						
						function getDetailCallback(place, status){
							if (status == google.maps.places.PlacesServiceStatus.OK) {
							    $('.review').append(
							    		'<div class="impo">'+
							    		'<h2>'+place.name+'</h2>'+
							    		'<h3>'+review.name+'</h3>'+
							    		'<h4>'+review.content+'</h4>'+
							    		'<br><br>'+
							    		'<h5>'+review.reg+'</h5>'+
									    '</div>'
							    	)
							  };
						};
						
					});
					
					
				
					// 검색 창 연결
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
							  	  '<img class="place-btn-src love-img" src="'+loveonimg+'">'+
							  	  '<p class="love-count" data-place = "'+place.place_id+'">'+0+'</p>'+
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
				
				// 리뷰 입력 ajax 통신
				$(document).on('click','.place-reply-btn',function(){
					
					var reviewList = $(this).parent().next('.place-reply-list')
					var replyText = $(this).prev('input').val();
					var placeId = $(this).prev('input').data("place");
					
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
					    })
					    .done(function(data){
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
				
				
// 				좋아요 토글 ajax
				$(document).on('click',".love-img",function(){
					
					var loveCount = $(this).next(".love-count");
					
					var loveFlag;
					
					// 감소
					if($(this).attr("src")==loveonimg){ 	
						$(this).attr("src",loveoffimg);
						loveFlag=false;
					}
					
					// 증가
					else{	 
						$(this).attr("src",loveonimg);
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
 					       }
 					    });
					
					
				});
				
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
    <%-- <div class="gallary">
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/1.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/2.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/3.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/4.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/5.jpg"></div>
        <div class="image"><img src="${pageContext.request.contextPath}/res/img/6.jpg"></div>
    </div>  --%>
    
    <div class="container-80 out-align-center">
  <h2>Best 6</h2>
  <div class="row" id="hotPlaceArea">
    
  </div>
</div> 
    
    <!-- 이용방법 영역 -->
    <div class="container-100 out-align-center">
        <div class="row in-align-center font-big">최근리뷰</div>
    </div>
    
    <div class="review">
        
    </div>
    
    <div class="remote">
        <a href="#">Top</a>
    </div>
    
    <jsp:include page="../footer.jsp"></jsp:include>