<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">  

<!-- 기능관련 클래스, id

	___id
		map
		sortable1
		sortable2
		google-search-button
		google-search
		day-add-btn
		my-plan-btn

	___class
		day-list

	___참고
	sortable1,sortable2 바로 밑의 자식 태그들은 무조건 a태그로 감싸져야함
	
 -->
 
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
  	<script src="${pageContext.request.contextPath}/res/js/create/searchlist.js"></script>
  	
  	<!-- 맵관련 스크립트 -->
  	<script src="${pageContext.request.contextPath}/res/js/create/googlemap.js"></script>
    
    <!-- ajax 관련 스크립트 -->
    <script src="${pageContext.request.contextPath}/res/js/create/sendajax.js"></script>

    
	
<!-- 상단 Bar -->
    <div class="container-fluid">
        <div class="form-inline">
            <div class="form-group">
                <input class=" form-control col-md-3" id="title-input" type="text"  placeholder="일정 제목" required>
                <input class=" form-control col-md-3" id="dur-input" type="number"  placeholder="몇일동안" required>
                <input class=" form-control col-md-3" id="sday-input" type="date"  required>
        	</div>
        	<div class="form-group col-md-offset-4">
        		<a class="btn btn-primary btn-lg  form-control col-md-2" role="button" id="my-plan-btn">나만보기</a>
                <a class="btn btn-primary btn-lg  form-control col-md-2" role="button" id="share-plan-btn">공유하기</a>
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
        	<div class="col-md-4 form-inline create-main" >
        		<div class="input-group">
			      <input type="text" class="form-control" id="google-search" placeholder="찾으려는 장소 입력">
			      <span class="input-group-btn">
			        <button class="btn btn-default" id="google-search-button" type="button">Search</button>
			        <button class="btn btn-default" id="love-place"  type="button">좋아요한 장소목록</button>
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