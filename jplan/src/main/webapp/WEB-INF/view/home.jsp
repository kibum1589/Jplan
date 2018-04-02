<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/res/js/swiper.js"></script>
<script src="${pageContext.request.contextPath}/res/js/home/home.js"></script>
    
<jsp:include page="../header.jsp"></jsp:include>
  
  	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/home.css">
  
   <%-- <div class="row out-align-center">
   <div class="swiper-container">
        
        <!-- 이미지 영역 : wrapper -->
        <div class="swiper-wrapper">
        
            <!-- 1장의 이미지 영역 : slide -->
            <div class="swiper-slide">
                <img src="${pageContext.request.contextPath}/res/photo/1.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="${pageContext.request.contextPath}/res/photo/2.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="${pageContext.request.contextPath}/res/photo/3.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="${pageContext.request.contextPath}/res/photo/4.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="${pageContext.request.contextPath}/res/photo/5.jpg" width="100%" height="100%">
            </div>
            
        </div>
    </div>
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
        <div class="row in-align-center font-big">이용방법</div>
        <!-- 방법 내용 적을곳 -->
        <div class="row">
        이용하기
        </div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
    </div>
    <div class="remote">
        <a href="#">Top</a>
    </div> --%>
 
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
        <img src="${pageContext.request.contextPath}/res/img/22.jpg" alt="" style="width:100%; height:70%">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/res/img/33.jpg" alt="" style="width:100%; height:70%">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/res/img/44.jpg" alt="" style="width:100%; height:70%">
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
    <h1 class="font1">즐거운 여행을<span class="font1">계획하라!</span>Jplan</h1>
<%--  
<div class=" ">
<img src="${pageContext.request.contextPath}/res/img/namsan.jpg" alt=""> --%>

<div class="empty-row"></div>
<div class="empty-row"></div>

    <!-- 갤러리 영역 -->
<section class="main-content header">

 <div>
  <h2 class="font3">Best<br><br>Top 6</h2>
 </div>
 
 <div class="container-70">
  
  <div class="row">
  
    <div class="col-md-4 card card--white">
    <h2 class="card__title">창녕 우포늪</h2>
      <div class="card__image-cover"></div>      
      <img class="card__image" 
           src="http://cfile26.uf.tistory.com/image/27527134520B205003518D" 
           alt="">
           
      <section class="card__copy">
        <p>Population (2105): 8,550,405</p>
        <p>Year Founded: 1624</p>
        <p>Coordinates: 40°42′46″N 74°00′21″W</p>
        <p>Time Zone: Eastern (EST) (UTC-5)</p>
      </section> 
    </div>
    
    <div class="col-md-4 card card--white">
    <h2 class="card__title">완도 청산도 </h2>
        <div class="card__image-cover"></div>
      	<img class="card__image" 
      	src="http://cfile28.uf.tistory.com/image/22743C3A520B20531C6C5A" 
      	alt="">
      
      <section class="card__copy">
        <p>Population (2105): 8,673,713</p>
        <p>Year Founded: 43</p>
        <p>Coordinates: 51°30′26″N 0°7′39″W</p>
        <p>Time Zone: GMT (UTC)</p>
      </section>
    </div>
    
    <div class="col-md-4 card card--white">
    <h2 class="card__title">하동 십리벚꽃길</h2>
         <div class="card__image-cover"></div>      
      <img class="card__image" 
      src="http://cfile25.uf.tistory.com/image/263CAE3B520B20593892FA" 
      alt="">
      
      <section class="card__copy">
        <p>Population (2103): 2,229,621</p>
        <p>Year Founded: 52 B.C.</p>
        <p>Coordinates: 48°51′24″N 2°21′03″E</p>
        <p>Time Zone: CET (UTC+1)</p>
      </section>
    </div>
    
    <div class="col-md-4 card card--white">
    <h2 class="card__title">부산 해운대 </h2>
       <div class="card__image-cover"></div>
      <img class="card__image" 
      src="http://cfile10.uf.tistory.com/image/2360523B520B205B22E883" 
      alt="Singapore">
      
      <section class="card__copy">
        <p>Population (2105): 5,535,000</p>
        <p>Year Founded: 1819</p>
        <p>Coordinates: 1°17′N 103°50′E</p>
        <p>Time Zone: SST (UTC+8)</p>
      </section> 
    </div>
    
    <div class="col-md-4 card card--white">
    <h2 class="card__title">제주우도</h2>
        <div class="card__image-cover"></div>
     	 <img class="card__image" 
     	 src="http://cfile1.uf.tistory.com/image/227A3637520B206022185C" 
     	 alt="">
      
      <section class="card__copy">
        <p>Population (2105): 5,535,000</p>
        <p>Year Founded: 1819</p>
        <p>Coordinates: 1°17′N 103°50′E</p>
        <p>Time Zone: SST (UTC+8)</p>
      </section> 
    </div>
    
    <div class="col-md-4 card card--white">
    <h2 class="card__title">창원 진해 군항제 </h2>
        <div class="card__image-cover"></div>
      <img class="card__image" 
      src="http://cfile10.uf.tistory.com/image/25530340520B245C1C1127" 
      alt="">
      
      <section class="card__copy">
        <p>Population (2105): 5,535,000</p>
        <p>Year Founded: 1819</p>
        <p>Coordinates: 1°17′N 103°50′E</p>
        <p>Time Zone: SST (UTC+8)</p>
      </section> 
    </div>

    
  </div>
 </div>

</section>

<div class="empty-row"></div>
<div class="empty-row"></div>


  <!-- 이용방법 영역 -->
    <div class="container-100" style="background: white;">
        <div class="row in-align-center font-big">이용방법</div>
        <!-- 방법 내용 적을곳 -->
        <div class="row">
        이용하기
        </div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
    </div>
    <div class="remote">
        <a href="#"><img src="${pageContext.request.contextPath}/res/icon/jplane.png"
			alt="" class="home_btn"></a>
    </div>
    
    <div class="empty-row"></div>
<div class="empty-row"></div>
    
    <jsp:include page="../footer.jsp"></jsp:include>