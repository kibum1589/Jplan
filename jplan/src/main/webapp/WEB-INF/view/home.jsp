<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/common.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/res/js/swiper.js"></script>
<script src="${pageContext.request.contextPath}/res/js/home/home.js"></script>

<jsp:include page="../header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/home.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- 이미지 영역 : wrapper -->
<div class="container-100">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="${pageContext.request.contextPath}/res/img/001.jpg" alt=""
					style="width: 100%; height: 70%; opacity:100;">
			</div>

			<div class="item">
				<img src="${pageContext.request.contextPath}/res/img/003.jpg" alt=""
					style="width: 100%; height: 70%; opacity:100;">
			</div>

			<div class="item">
				<img src="${pageContext.request.contextPath}/res/img/33.jpg" alt=""
					style="width: 100%; height: 70%; opacity:1;">
			</div>
			
			<div class="item">
				<img src="${pageContext.request.contextPath}/res/img/11.jpg" alt=""
					style="width: 100%; height: 70%; opacity:100;">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>

<!-- 갤러리 영역 -->
<hr>
<br>


<div class="container-80 out-align-center">
	<h2 class="font3">Best Top 6</h2>

	<div class="empty-row"></div>
	<br> <br>
	<div class="container col-md-4">
		<h2>Rounded Corners</h2>
		<img src="${pageContext.request.contextPath}/res/img/22.jpg"
			class="img-rounded" alt="Cinque Terre" width="450" height="370">
	</div>
	<div class="container col-md-4">
		<h2>Rounded Corners</h2>
		<img src="${pageContext.request.contextPath}/res/img/22.jpg"
			class="img-rounded" alt="Cinque Terre" width="450" height="370">
	</div>
	<div class="container col-md-4">
		<h2>Rounded Corners</h2>
		<img src="${pageContext.request.contextPath}/res/img/22.jpg"
			class="img-rounded" alt="Cinque Terre" width="450" height="370">
	</div>
	<div class="container col-md-4">
		<h2>Rounded Corners</h2>
		<img src="${pageContext.request.contextPath}/res/img/22.jpg"
			class="img-rounded" alt="Cinque Terre" width="450" height="370">
	</div>
	<div class="container col-md-4">
		<h2>Rounded Corners</h2>
		<img src="${pageContext.request.contextPath}/res/img/22.jpg"
			class="img-rounded" alt="Cinque Terre" width="450" height="370">
	</div>
	<div class="container col-md-4">
		<h2>Rounded Corners</h2>
		<img src="${pageContext.request.contextPath}/res/img/22.jpg"
			class="img-rounded" alt="Cinque Terre" width="450" height="370">
	</div>
</div>
<div class="container"></div>
<div class="container"></div>
<div class="container"></div>
<br>
<br>

  <!-- 이용방법 영역 -->
    <div class="container-90 out-align-center" style="background: white;">
        <div class="row in-align-center"> 
        <label style="font-size: 80px;" class="text-primary"><b>JPlan 이용방법</b></label><br>
        <label><b>나의 여행 동선을 확인하고 쉽게 일정을 계획하세요!!!!</b></label>
        </div>
        <div class="row">
        <ul class="pager">
  		<li><a><span class="glyphicon glyphicon-tree-conifer"></span>가입하기</a></li>
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
        	
        	  <div class="row" style="display: flex; flex-direction: row;">
        	<div style="display: flex; flex-direction: column; flex-basis:70%; vertical-align: middle;">
        	<div>
        	<button type="button" class="btn btn-info" style="width: 5em;">STEP1</button>
        	<label><b>가입하기</b></label><br><br>
        	</div>
        		<div style="margin-top:3em;">이용전 가입으로 모든걸 이용해 보아요!</div>
        	</div>
        	<div style="flex-basis:30%;">
       <img src="${pageContext.request.contextPath}/res/img/step1.png" style="margin-left: auto;" class="img-rounded"  width="550" height="370"> 
        	</div>
        	</div>
        	
        	<hr>
        	
        	  <div class="row" style="display: flex; flex-direction: row;">
        	<div style="display: flex; flex-direction: column; flex-basis:70%; vertical-align: middle;">
        	<div>
        	<button type="button" class="btn btn-info" style="width: 5em;">STEP2</button>
        	<label><b>일정에 넣기</b></label><br><br>
        	</div>
        		<div style="margin-top:3em;">
        		가고 싶은 장소 관심있는 장소 이신가요?
        		<br>검색하여 일정에 포함시킬 수 있습니다.
        		<br><br>
        		<h4>1.장소 입력하기</h4>
        		<h4>2.검색하여 리스트 보기</h4>
        		<h4>3.리스트 장소 Day에 옮기기</h4>
        		<h4>4.장소 순서 또는 Day 추가 하기</h4>
        		</div>
        	</div>
        	<div style="flex-basis:30%;">
       <img src="${pageContext.request.contextPath}/res/img/step2.png" style="margin-left: auto;" class="img-rounded"  width="550" height="370"> 
        	</div>
        	</div>
        	
        	<hr>
        	
        	  <div class="row" style="display: flex; flex-direction: row;">
        	<div style="display: flex; flex-direction: column; flex-basis:70%; vertical-align: middle;">
        	<div>
        	<button type="button" class="btn btn-info" style="width: 5em;">STEP3</button>
        	<label><b>지도보기</b></label><br><br>
        	</div>
        		<div style="margin-top:3em;">일정 만들기 에서 여행하고 싶은 곳을 <br>지도로 찾아 확인해 보세요.</div>
        	</div>
        	<div style="flex-basis:30%;">
       <img src="${pageContext.request.contextPath}/res/img/step3.png" style="margin-left: auto;" class="img-rounded"  width="550" height="370"> 
        	</div>
        	</div>
        	
        	<hr>
        	
        	  <div class="row" style="display: flex; flex-direction: row;">
        	<div style="display: flex; flex-direction: column; flex-basis:70%; vertical-align: middle;">
        	<div>
        	<button type="button" class="btn btn-info" style="width: 5em;">STEP4</button>
        	<label><b>커뮤니티</b></label><br><br>
        	</div>
        		<div style="margin-top:3em;">만들어 놓은 일정을 다른사람들과 <br>공유 그리고 내가 만든 일정을 확인해 보세요!</div>
        	</div>
        	<div style="flex-basis:30%;">
       <img src="${pageContext.request.contextPath}/res/img/step4.png" style="margin-left: auto;" class="img-rounded"  width="550" height="370"> 
        	</div>
        	</div>
        	
        	<hr>
        	
        	  <div class="row" style="display: flex; flex-direction: row;">
        	<div style="display: flex; flex-direction: column; flex-basis:70%; vertical-align: middle;">
        	<div>
        	<button type="button" class="btn btn-info" style="width: 5em;">STEP5</button>
        	<label><b>여행하기</b></label><br><br>
        	</div>
        		<div style="margin-top:3em;">이제 여권을 들고 ! 여행하러 GoGo~!</div>
        	</div>
        	<div style="flex-basis:30%;">
       <img src="${pageContext.request.contextPath}/res/img/step5.png" style="margin-left: auto;" class="img-rounded"  width="550" height="370"> 
        	</div>
        	</div>
        	
    <div class="remote">
        <a href="#"><img src="${pageContext.request.contextPath}/res/icon/jplane.png"
			alt="" class="home_btn"></a>
    </div>
    
    <div class="empty-row"></div>
	<div class="empty-row"></div>
	</div>
    
    <jsp:include page="../footer.jsp"></jsp:include>