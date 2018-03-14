<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
<link rel="stylesheet" type="text/css" 
        		href="${pageContext.request.contextPath}/css/home.css">
    <title>JPlan 홈</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/swiper.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
    <style>
        /* swiper-container의 크기를 조절하여 위치 설정 */
        .swiper-container{
            width: 100%;
            height: 350px;
            margin: 10px auto;
        }
    </style>
    <!-- 자바 스크립트 작성 공간 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/swiper.js"></script>
   
     <script>
        $(document).ready(function(){
            
            //class="swiper-container"에 swiper 적용
            //var slider = new Swiper("선택자", {옵션});
            var slider = new Swiper(".swiper-container",{
                //적용시킬 옵션들
                
                nextButton:".swiper-button-next",//다음버튼
                prevButton:".swiper-button-prev",//이전버튼
                
                loop:true,//시작지점과 끝지점을 이어지도록 처리
                
                grabCursor:true,//손가락 모양의 커서로 변경
                
                pagination:".swiper-pagination",//페이지 위치 표시
                paginationClickable:true,//위치를 클릭으로 이동할 수 있도록 설정
                
                autoplay:2000,//자동재생(밀리초) 설정
                
            });
            
        });
    </script>
<body>
    <!-- 상단(메뉴) 영역 -->
    <nav class="menu">
        <input type="checkbox" id="hamberg">
        <label for="hamberg">&equiv;</label>
        <i class="fa fa-twitter fa-3x left"></i>
        <a href="#" class="left">일정만들기</a>
        <a href="#" class="left">커뮤니티</a>
        <a href="#" class="left">이용방법</a>
        <a href="#" class="left">여행지</a>
        <a href="#" class="right">로그인</a>
        <a href="#" class="rright">회원가입</a>
    </nav>
<div class="row out-align-center">
   <div class="swiper-container">
        
        <!-- 이미지 영역 : wrapper -->
        <div class="swiper-wrapper">
        
            <!-- 1장의 이미지 영역 : slide -->
            <div class="swiper-slide">
                <img src="photo/1.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="photo/2.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="photo/3.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="photo/4.jpg" width="100%" height="100%">
            </div>
            <div class="swiper-slide">
                <img src="photo/5.jpg" width="100%" height="100%">
            </div>
            
        </div>
    </div>
</div>
    <div class="row in-align-center font-title">
        인기 여행지 Top6
    </div>
    
    <!-- 갤러리 영역 -->
    <div class="gallary">
        <div class="image"><img src="img/1.jpg"></div>
        <div class="image"><img src="img/2.jpg"></div>
        <div class="image"><img src="img/3.jpg"></div>
        <div class="image"><img src="img/4.jpg"></div>
        <div class="image"><img src="img/5.jpg"></div>
        <div class="image"><img src="img/6.jpg"></div>
    </div> 
    
    <!-- 이용방법 영역 -->
    <div class="container-100 out-align-center">
        <div class="row in-align-center font-big">이용방법</div>
        <!-- 방법 내용 적을곳 -->
        <div class="row"></div>
    </div>
        
        
        <!-- 하단 영역 -->
        
        <footer class="font-small in-align-center">
            &copy; JPlan    
    </footer>
</body>
</html>