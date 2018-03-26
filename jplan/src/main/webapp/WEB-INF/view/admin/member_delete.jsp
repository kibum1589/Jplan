<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<script src="http://code.jquery.com/jquery-latest.js"></script>


<div class="empty-row"></div>
<div class="empty-row"></div>

<div class="container-70 out-align-center">
	<div class="row font-big in-align-center">
		회원 탈퇴
	</div>
	<div class="row font-small in-align-center">
		탈퇴를 진행하기 위하여 비밀번호를 입력해주세요
	</div>
	<form action="member_delete" method="post">
	<div class="row">
		<input class="form-input form-input-full" type="password" name="pw" required placeholder="비밀번호">
	</div>	
	<div class="row">
		<input class="" type="submit" value="입력">
	</div>
	</form>
</div>

<div class="empty-row"></div>
<div class="empty-row"></div>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
