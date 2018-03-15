<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>JPlan 홈</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper.css">
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
    
    //Top 리모컨 함수 
    $(document).scroll(function(){

       var con = $(".remote");
       var position = $(window).scrollTop();

       if(position > 250){ con.fadeIn(500); }
       else if(position < 250){ con.fadeOut(500); }

    });

//    $(".remote").click(function(){
//        $("html, body").animate({scrollTop: 0}, 1000);
//
//    });
    </script>
<body>
    <!-- 상단(메뉴) 영역 -->
    <header class="menu">
        <input type="checkbox" id="hamberg">
        <label for="hamberg">&equiv;</label>
        <i class="fa fa-twitter fa-3x left"></i>
        <button class="left">일정만들기</button>
        <button class="left">커뮤니티</button>
        <button class="left">이용방법</button>
        <a href="${pageContext.request.contextPath}/place" class="left">여행지</a>
        <button class="right">로그인</button>
        <button class="rright">회원가입</button>
    </header>
<section>