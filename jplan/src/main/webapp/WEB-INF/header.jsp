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
        
        .home_btn{
        cursor:pointer;
        }
        
    </style>
 <!-- 자바 스크립트 작성 공간 -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!-- 회원가입 관련 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
 	<%-- <script src="${pageContext.request.contextPath}/res/js/sign/sign.js"></script> --%>
    <%-- <script src="${pageContext.request.contextPath}/res/js/sign/sha256.js"></script> --%>
   
    
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

    <!-- 상단(메뉴) 영역 -->
    <%-- <header class="menu">
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
       	<c:if test="${sessionScope.no == 1}">
        <button class="left" onclick="location.href='${pageContext.request.contextPath}/admin/memberlist'">회원목록보기</button>
        </c:if>
        <c:if test="${sessionScope.no == 1}">
        <button class="left" onclick="location.href='${pageContext.request.contextPath}/admin/member_block_list'">제제목록보기</button>
        </c:if>
        
        <c:choose>
    		<c:when test="${sessionScope.email == null}">
        		<button class="right" onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
    		</c:when>
    		<c:otherwise>
        		<button class="right" onclick="location.href='${pageContext.request.contextPath}/logout'">${sessionScope.name}님이 로그인중니다. 로그아웃</button>
    		</c:otherwise>
		</c:choose>
        <!-- <button class="rright" onclick="sign_div_open();">회원가입</button> -->
        <button class="rright" onclick="location.href='${pageContext.request.contextPath}/sign'">회원가입</button>
    </header> --%>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
     <img src="${pageContext.request.contextPath}/res/icon/jplanicon.png" alt="" class="home_btn" onclick="location.href='${pageContext.request.contextPath}/home'">
    </div>
    <ul class="nav navbar-nav">
      <li><a href="${pageContext.request.contextPath}/create">일정만들기</a></li>
      <c:if test="${email != null}">
      <li><a href="${pageContext.request.contextPath}/myplan">내일정보기</a></li>
      </c:if>
      <li><a href="${pageContext.request.contextPath}/planlist">커뮤니티</a></li>
      <li><a href="${pageContext.request.contextPath}/place">여행지</a></li>
      <c:if test="${email != null}">
      <li><a href="${pageContext.request.contextPath}/admin/memberinfo">나의정보보기</a></li>
      </c:if>
      <c:if test="${sessionScope.no == 1}">
      <li><a href="${pageContext.request.contextPath}/admin/memberlist">회원목록보기</a></li>
      </c:if>
        <c:if test="${sessionScope.no == 1}">
      <li><a href="${pageContext.request.contextPath}/admin/member_block_list">제제목록보기</a></li>
      </c:if>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    
      <li><a href="${pageContext.request.contextPath}/sign"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      <c:choose>
    		<c:when test="${sessionScope.email == null}">
      <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
      </c:when>
    		<c:otherwise>
            <li><a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-log-in"></span>${sessionScope.name}님이 로그인중니다. 로그아웃</a></li>
            </c:otherwise>
		</c:choose>
    </ul>
  </div>
</nav>
