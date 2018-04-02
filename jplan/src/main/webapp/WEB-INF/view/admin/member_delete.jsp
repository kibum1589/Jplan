<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 스타일을 위한 -->
<script src="${pageContext.request.contextPath}/res/js/admin/member_delete.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/member.css">

<div class="empty-row"></div>
<div class="empty-row"></div>

<div id="section">	
	
	<div class="row font-big in-align-center">
		회원 탈퇴
	</div>
	
	<div class="col-sm-12 row font-small in-align-center">
		탈퇴를 진행하기 위하여 비밀번호를 입력해주세요
	</div>
	
	<section class="contact-wrap">
	<form class="contact-form" action="member_delete" method="post">
	
	<div class="col-sm-12">
		<div class="input-block">
		<label>비밀번호<br><br>(6~15자리 사이)</label>
		<br>
		<br>
		<input class="form-input form-input-full pw_delete form-control" type="password" name="pw" required placeholder="비밀번호">
			<span id="pw_check"></span>
		</div>
	</div>	
	
		<div class="col-sm-12">
			<button class="delete square-button" type="submit">입력</button>
		</div>
	
	</form>
	
	</section>
</div>


<div class="empty-row"></div>
<div class="empty-row"></div>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
