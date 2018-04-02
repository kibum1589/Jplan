<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>JPlan 홈</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/swiper.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/sign.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/header.css">
</head>
<style>
/* swiper-container의 크기를 조절하여 위치 설정 */
/*    .swiper-container{
            width: 500%;
            height: 350px;
            margin: 10px auto;
        }
        
        .home_btn{
        cursor:pointer;
        width:65px;
        height:65px;
        }  */
</style>

<!-- 자바 스크립트 작성 공간 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 회원가입 관련 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>
	//Top 리모컨 함수 
	$(document).scroll(function() {

		var con = $(".remote");
		var position = $(window).scrollTop();

		if (position > 250) {
			con.fadeIn(500);
		} else if (position < 250) {
			con.fadeOut(500);
		}

	});

</script>


<nav class="navigation">
	<ul class="menu">
	<li class="menu__item " style= "cursor: pointer;">
		<img src="${pageContext.request.contextPath}/res/icon/jplan.png"
			alt="" class="home_btn box"
			onclick="location.href='${pageContext.request.contextPath}/home'">
	</li>
	
		<li class="menu__item">
		<a href="${pageContext.request.contextPath}/create"
			class="menu__link"> 
			<span class="menu__title">
                    <span class="menu__first-word" data-hover="일정">
                        	일정
                    </span>
                    <span class="menu__second-word" data-hover="만들기">
                        	만들기
                    </span>
                </span>
			</a>
		</li>
			
		<c:if test="${email != null}">
			<li class="menu__item"><a
				href="${pageContext.request.contextPath}/myplan"
				class="menu__link">
				 <span class="menu__title">
                    <span class="menu__first-word" data-hover="내일정">
                        	내일정
                    </span>
                    <span class="menu__second-word" data-hover="보기">
                        	보기
                    </span>
                </span>
                </a>
            </li>
            
		</c:if>
		<li class="menu__item"><a class="menu__link"
			href="${pageContext.request.contextPath}/planlist"
			class="menu__link">
			 <span class="menu__title">
                    <span class="menu__first-word" data-hover="커뮤">
                        	커뮤
                    </span>
                    <span class="menu__second-word" data-hover="니티">
                        	니티
                    </span>
                </span>
              </a>
        </li>
        
		<li class="menu__item"><a
			href="${pageContext.request.contextPath}/place"
			class="menu__link"> <span class="menu__title">
                    <span class="menu__first-word" data-hover="여행">
                        		여행
                    </span>
                    <span class="menu__second-word" data-hover="지">
              					지	
                    </span>
                </span>
                </a>
        </li>
        
		<c:if test="${email != null}">
			<li class="menu__item"><a class="menu__link"
				href="${pageContext.request.contextPath}/admin/memberinfo"> 
				<span class="menu__title">
                    <span class="menu__first-word" data-hover="나의">
                        	나의
                    </span>
                    <span class="menu__second-word" data-hover="정보보기">
                        	정보보기
                    </span>
                </span>
                </a>
       </li>
       
		</c:if>
		<c:if test="${sessionScope.no == 1}">
			<li class="menu__item"><a class="menu__link"
				href="${pageContext.request.contextPath}/admin/memberlist">
				 <span class="menu__title">
                    <span class="menu__first-word" data-hover="회원">
                        	회원
                    </span>
                    <span class="menu__second-word" data-hover="목록보기">
                        	목록보기
                    </span>
                </span>
                </a>
            </li>
            
            
		</c:if>
		<c:if test="${sessionScope.no == 1}">
			<li class="menu__item"><a class="menu__link"
				href="${pageContext.request.contextPath}/admin/member_block_list">
				 <span class="menu__title">
                    <span class="menu__first-word" data-hover="제제">
                        	제제
                    </span>
                    <span class="menu__second-word" data-hover="목록보기">
                        	목록보기
                    </span>
                </span>
                </a>
            </li>
		</c:if>
		
		<c:if test="${sessionScope.email == null}">
			<li class="menu__item right"><a class="menu__link"
			href="${pageContext.request.contextPath}/sign"> 
				<span class="menu__title">
                    <span class="menu__first-word" data-hover="회원">
                        	회원
                    </span>
                    <span class="menu__second-word" data-hover="가입">
                       		가입
                    </span>
                </span>
                </a>
        	</li>
        </c:if>
        
		<c:choose>
			<c:when test="${sessionScope.email == null}">
				<li class="menu__item ">
				<a class="menu__link " href="${pageContext.request.contextPath}/login">
				 <span class="menu__title">
                    <span class="menu__first-word" data-hover="로">
                        	로		
                    </span>
                    <span class="menu__second-word" data-hover="그인">
                        	그인
                    </span>
                </span>
                </a>
            	</li>
            	
			</c:when>
			<c:otherwise>
				<li class="menu__item  ">
				<a class="menu__link " href="${pageContext.request.contextPath}/logout">
				 <span class="menu__title">
                    <span class="menu__first-word" data-hover="${sessionScope.name}님이">
                        ${sessionScope.name}님이
                    </span>
                    <span class="menu__second-word" data-hover="로그인중니다. 로그아웃">
                        	로그인중니다. 로그아웃
                    </span>
                </span>
				</a>
			</li>
			
			</c:otherwise>
		</c:choose>
	</ul>
	
</nav>