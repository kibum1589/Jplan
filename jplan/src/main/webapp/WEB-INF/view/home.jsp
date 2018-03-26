<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/res/js/swiper.js"></script>
<script src="${pageContext.request.contextPath}/res/js/home/home.js"></script>
    
<jsp:include page="../header.jsp"></jsp:include>
  
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
  <div class="container">
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
        <img src="${pageContext.request.contextPath}/res/photo/1.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/res/photo/2.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/res/photo/3.jpg" alt="New york" style="width:100%;">
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

<div class="row in-align-center font-title">
        인기 여행지 Top6
    </div>
    
    <!-- 갤러리 영역 -->

<div class="container">
  <h2>Best 6</h2>
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/res/img/1.jpg" target="_blank">
          <img src="${pageContext.request.contextPath}/res/img/1.jpg" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/res/img/1.jpg" target="_blank">
          <img src="${pageContext.request.contextPath}/res/img/1.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/res/img/1.jpg" target="_blank">
          <img src="${pageContext.request.contextPath}/res/img/1.jpg" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/res/img/1.jpg" target="_blank">
          <img src="${pageContext.request.contextPath}/res/img/1.jpg" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/res/img/1.jpg" target="_blank">
          <img src="${pageContext.request.contextPath}/res/img/1.jpg" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="${pageContext.request.contextPath}/res/img/1.jpg" target="_blank">
          <img src="${pageContext.request.contextPath}/res/img/1.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
  </div>
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
    </div>

    
    
    <jsp:include page="../footer.jsp"></jsp:include>