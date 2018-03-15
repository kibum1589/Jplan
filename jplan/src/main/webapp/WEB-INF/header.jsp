<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>JPlan 홈</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/swiper.css">
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
    
    <script>
    
    
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
        <i class="fa fa-twitter fa-3x left" onclick="location.href='home'"></i>
        <button class="left" onclick="location.href='create'">일정만들기</button>
        <button class="left">커뮤니티</button>
        <button class="left">이용방법</button>
        <button class="left" onclick="location.href='place'">여행지</button>
        
        <button class="right">로그인</button>
        <button class="rright">회원가입</button>
    </header>
<section>