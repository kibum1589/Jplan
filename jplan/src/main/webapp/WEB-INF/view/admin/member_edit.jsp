<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<!-- 스타일을 위한 -->
<script src="${pageContext.request.contextPath}/res/js/admin/member_edit.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/member.css">


	<p class="headbody" data-split="정보 수정">정보 수정</p>

<div class="empty-row"></div>
<div class="empty-row"></div>

	
<div id="section">	
	<section class="contact-wrap">
		<form class="contact-form" action="member_edit" method="post">
		
			<div class="col-sm-12">
			  <div class="input-block">
				<label>이름</label>
				<br>
					<input type="text" name="name" required class="name_edit form-control check" 
					onkeypress="space_x();" value="${member.name}">
				</div>
			</div>
	
				<div class="col-sm-12">
	 				<div class="input-block">
						<label>비밀번호<br><br>(6~15자리 사이)</label>
						<br>
						<br>
					<input type="password" name="pw" required class="pw_edit form-control check " 
					onkeypress="space_x();" placeholder="수정하려는 비밀번호를 입력하여 주세요.">
						<span id="pwc"></span>
					</div>	
				</div>
	
			<div class="col-sm-12">
				 <button class="edit square-button" type="submit">수정하기</button>
			</div>
	
		</form>
	</section>
</div>

<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="empty-row"></div>



<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
