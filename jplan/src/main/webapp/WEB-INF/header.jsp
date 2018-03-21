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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/sign.css">
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
    <!-- 회원가입 관련 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/sign/sign.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/sign/sha256.js"></script>
   
    
    <script>
    //회원가입 div 보이고 끄기 
    function sign_div_open(){
    	 document.getElementById('sign_div').style.display = "inline";
    };
    
    
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

    <!-- 상단(메뉴) 영역 -->
    <header class="menu">
        <input type="checkbox" id="hamberg">
        <label for="hamberg">&equiv;</label>
        <i class="fa fa-twitter fa-3x left" onclick="location.href='${pageContext.request.contextPath}/home'"></i>
        <button class="left" onclick="location.href='${pageContext.request.contextPath}/create'">일정만들기</button>
        <c:if test="${email != null}">
        <button class="left" onclick="location.href='${pageContext.request.contextPath}/myplan'">내일정보기</button>
        </c:if>
        <button class="left" onclick="location.href='${pageContext.request.contextPath}/planlist'">커뮤니티</button>
        <button class="left">이용방법</button>
        <button class="left" onclick="location.href='${pageContext.request.contextPath}/place'">여행지</button>
        <c:if test="${email != null}">
       	<button class="left" onclick="location.href='${pageContext.request.contextPath}/admin/memberinfo'">나의정보보기</button>
       	</c:if>
       	<c:if test="${email != null && name == 'admin'}">
        <button class="left" onclick="location.href='${pageContext.request.contextPath}/admin/memberlist'">회원목록보기</button>
        </c:if>
        
        <c:choose>
    		<c:when test="${sessionScope.email == null}">
        		<button class="right" onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
    		</c:when>
    		<c:otherwise>
        		<button class="right" onclick="location.href='${pageContext.request.contextPath}/logout'">${sessionScope.name}님이 로그인중니다. 로그아웃</button>
    		</c:otherwise>
		</c:choose>
        <button class="rright" onclick="sign_div_open();">회원가입</button>
    </header>
    
<!-- 회원가입 div -->
<!-- <div class="et_modal_layer"> -->
    <form id="sign-form"action="sign" method="post">

	<div id="sign_div" class="et_modal_bg" style="display:none">
		<div class="sing_container">
			<!-- <div class="et_modal_window"> -->
	
        <div class="row font-big in-align-center">
        	회원가입
        </div>
        <div class="row">
       		 이메일
            <input class="form-input email_reg" type="text" name="email" placeholder="ex)OOO@OOO.OOO" 
            required id="check" onkeypress="space_x();">     
             <span id="email_check"></span>
        </div>
        
<!--         <div>
        <span></span>
        </div> -->
        
        <div class="row">
        	이름
            <input class="form-input" type="text" name="name" placeholder="2글자 에서 8글자 까지" required id="name" onkeypress="space_x();">
        </div>
        <div class="row">
        	비밀번호
            <input class="form-input" type="password" name="pw" placeholder="6자 에서 15자까지" required id="pw" onkeypress="space_x();">
        </div>
        <div class="row">
        	비밀번호 확인
            <input class="form-input" type="password" name="pw_check" placeholder="6자 에서 15자까지" required id="pw_check" onkeypress="space_x();">
            <span id="pwc"></span>
        </div>
        <div class="row">
            <input class="form-btn" type="submit" value="회원가입">
        </div>
       
    		<!-- </div>  -->
    	</div>
	</div>
	
    </form>
<!-- </div> -->
    
