<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXyMFNPLugzjEZsYzoFUpid7Rs6Qa3M4A&libraries=places&callback=initMap&region=kr" async defer></script>
  	
  	<!-- 리스트 관련 스크립트 -->
  	<script src="${pageContext.request.contextPath}/res/js/create/searchlist.js"></script>
  	
  	<!-- 맵관련 스크립트 -->
  	<script src="${pageContext.request.contextPath}/res/js/create/googlemap.js"></script>
    
    <!-- ajax 관련 스크립트 -->
    <script src="${pageContext.request.contextPath}/res/js/create/sendajax.js"></script>
    
<script>

//일정만들기 div 보이고 끄기 
	$(function() {
		$("#create_div").on("click", function() {
			console.log('눌림')
			$('.et_modal_bg').css('display','none');
							
			
		});
	});
</script>
    
<style>
      
        .create-main {
        	height: 100%;
        	overflow: auto;
        	border : 0.5px solid lightgray;
      	}
      	
      	.data-input{
      		height: 50px;
      	}
		
/* 녹색 div 끄기 버튼 css  */
.sbutton {
  width: 140px;
  height: 55px;
  font-family: 'Roboto', sans-serif;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #efefef;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.sbutton:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}

</style>
    
<div class="et_modal_bg" style="display:flex;">
  <img src=${pageContext.request.contextPath}/res/img/createDiv.png width="96%" height="93%" style="margin-top: 30px; margin-left: 30px; opacity: 0.9">
  	<button id="create_div" class="sbutton">x</button>
</div>
	
<!-- 상단 Bar -->
    <div class="container-fluid">
    
        <div class="form-inline data-input">
            <div class="form-group input-group-lg">
                <input class=" form-control" id="title-input" type="text"  placeholder="일정 제목" required>
                <input class=" form-control" id="sday-input" type="date"  required>
        	</div>
        	<div class="form-group input-group-lg" style="margin-left: 35">
        		<p><a class="btn btn-primary btn-lg" role="button" id="my-plan-btn">등록하기</a></p>
        	</div>
        </div>
        
        <!-- 추가한 일정 리스트 -->
        <div class="row">
        	<div class = "col-md-3 ">
        		<p><a class="btn btn-primary btn-lg" role="button" id="day-add-btn">Day 추가</a></p>
		        <div id="sortable1" class="connectedSortable list-group create-main">
			        <a href="#" class="list-group-item active day-list day-default">
			        	<h4 class="list-group-item-heading">
						  Day 01
						 </h4>
	  				</a>
				</div>
			</div>
        
        <!-- 검색 결과 리스트 -->
        
        	<!-- 검색창 -->
        	<div class="col-md-4" >
        		<div class="input-group input-group-lg">
			      <input type="text" class="form-control" id="google-search" placeholder="찾으려는 장소 입력">
			      <span class="input-group-btn">
			        <button class="btn btn-default" id="google-search-button" type="button">Search</button>
			        <button class="btn btn-default" id="love-place"  type="button">좋아요한 장소목록</button>
			      </span>
			    </div>
			
	        	<div id="sortable2" class="connectedSortable list-group create-main">
				</div>
			</div>
        
        <!-- 맵표시 공간 -->
        	<div id="map" class ="col-md-5 create-main" >
        	</div>
        	
     </div>
     </div>
 
 
 <jsp:include page="../footer.jsp"></jsp:include>