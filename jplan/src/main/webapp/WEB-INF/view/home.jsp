<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/res/js/swiper.js"></script>
<script src="${pageContext.request.contextPath}/res/js/home/home.js"></script>
    
<jsp:include page="../header.jsp"></jsp:include>
  
   <div class="row out-align-center">
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
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
        <div class="row">이용하기</div>
    </div>
    <div class="remote">
        <a href="#">Top</a>
    </div>
    
    <jsp:include page="../footer.jsp"></jsp:include>