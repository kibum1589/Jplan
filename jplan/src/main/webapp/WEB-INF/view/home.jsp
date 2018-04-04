<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/common.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/res/js/swiper.js"></script>
<script src="${pageContext.request.contextPath}/res/js/home/home.js"></script>
    
<jsp:include page="../header.jsp"></jsp:include>
  
  	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/home.css">
  
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 
    
  <!-- 이미지 영역 : wrapper -->   
  <div class="container-100">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/res/img/001.jpg" alt="" style="width:100%; height:70%">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/res/img/003.jpg" alt="" style="width:100%; height:70%">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/res/img/33.jpg" alt="" style="width:100%; height:70%">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


 <!-- 스크롤에 내려갈때 움직이는 글씨  -->
	<!-- <h1 class="font1">즐거운 여행을<span class="font1">계획하라!</span>Jplan</h1> -->
     

<div class="empty-row"></div>
<div class="empty-row"></div>
    <!-- 갤러리 영역 -->


<section class="main-content header">
</section>
<div class="container-80 out-align-center">
<h2 class="font3">Best Top 6</h2>

<div class="empty-row"></div>
<div class="empty-row"></div>
<br><br>
<div class="container col-md-4"> 
  <h2>Rounded Corners</h2>     
  <img src="${pageContext.request.contextPath}/res/img/22.jpg" class="img-rounded" alt="Cinque Terre" width="450" height="370">
</div>
<div class="container col-md-4">
  <h2>Rounded Corners</h2>        
  <img src="${pageContext.request.contextPath}/res/img/22.jpg" class="img-rounded" alt="Cinque Terre" width="450" height="370"> 
</div>
<div class="container col-md-4">
  <h2>Rounded Corners</h2>          
  <img src="${pageContext.request.contextPath}/res/img/22.jpg" class="img-rounded" alt="Cinque Terre" width="450" height="370"> 
</div>
<div class="container col-md-4">
  <h2>Rounded Corners</h2>
  <img src="${pageContext.request.contextPath}/res/img/22.jpg" class="img-rounded" alt="Cinque Terre" width="450" height="370"> 
</div>
<div class="container col-md-4">
  <h2>Rounded Corners</h2>
  <img src="${pageContext.request.contextPath}/res/img/22.jpg" class="img-rounded" alt="Cinque Terre" width="450" height="370"> 
</div>
<div class="container col-md-4">
  <h2>Rounded Corners</h2>          
  <img src="${pageContext.request.contextPath}/res/img/22.jpg" class="img-rounded" alt="Cinque Terre" width="450" height="370"> 
</div>


</div>

	<div class="container"></div>
	<div class="container"></div>
	<div class="container"></div>
	<br><br>

  <!-- 이용방법 영역 -->
    <div class="container-100" style="background: white;">
        <div class="row in-align-center"> 
        <label style="font-size: 80px;" class="text-primary"><b>JPlan 이용방법</b></label><br>
        <label><b>나의 여행 동선을 확인하고 쉽게 일정을 계획하세요!!!!</b></label>
        </div>
        <div class="row">
        <ul class="pager">
  		<li><a><span class="glyphicon glyphicon-tree-conifer"></span>검색하기</a></li>
  		<span class="glyphicon glyphicon-arrow-right"></span>
  		<li><a><span class="glyphicon glyphicon-save"></span>일정에 넣기</a></li>
  		<span class="glyphicon glyphicon-arrow-right"></span>
  		<li><a><span class="glyphicon glyphicon-globe"></span>지도 보기</a></li>
  		<span class="glyphicon glyphicon-arrow-right"></span>
  		<li><a><span class="glyphicon glyphicon-folder-open"></span>일정 만들기</a></li>
  		<span class="glyphicon glyphicon-arrow-right"></span>
  		<li><a><span class="glyphicon glyphicon-plane"></span>여행하기</a></li>
		</ul>
        </div>
        <div class="row">
        <button type="button" class="btn btn-info">STEP1</button>
        	<label><b>검색하기</b></label><br><br>
        	여행지의 가고싶은 장소들을 검색해 보세요!
        	<hr>
        </div>
        <div class="row">
        <button type="button" class="btn btn-info">STEP2</button>
        	<label><b>일정에 넣기</b></label><br><br>
        	가고싶은 장소 관심있는 장소 이신가요?<br>
        	일정에 포함시킬 수 있습니다!!
        	<hr>
        </div>
        <div class="row">
        <button type="button" class="btn btn-info">STEP3</button>
        	<label><b>지도보기</b></label><br><br>
        	클립한 장소들을 지도에서 확인해보세요~<br>
        	인근의 명소, 음식점 등을 검색할 수 있습니다!!
        	<hr>
        </div>
        <div class="row">
        <button type="button" class="btn btn-info">STEP4</button>
        	<label><b>일정만들기</b></label><br><br>
        	장소를 검색해 일정을 계획하세요!!!
        	<hr>
        </div>
        <div class="row">
        <button type="button" class="btn btn-info">STEP5</button>
        	<label><b>여행하기</b></label><br><br>
        	길찾기와 메모를 활용하여 여행걱정을 줄일 수 있습니다!!!!!
        </div>
    </div>
    <div class="remote">
        <a href="#"><img src="${pageContext.request.contextPath}/res/icon/jplane.png"
			alt="" class="home_btn"></a>
    </div>
    
    <div class="empty-row"></div>
	<div class="empty-row"></div>
    
    <jsp:include page="../footer.jsp"></jsp:include>