<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/common.css">
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
 
<html>
<div align="center">
<table class="table table-responsive">
	<thead>
		<tr>
			<th colspan="7">총 ${list.size()}명의 회원이 있습니다.</th>
		</tr>
		<tr>
			<th>이메일</th>
			<th>이름</th>
			<th>등급</th>
			<th>가입일</th>
		</tr>
	</thead> 
	<tbody>
		<!-- 실제 정보 출력 -->
		<c:forEach items="${memberlist}" var="member">
		<tr>
			<th>${member.email}</th>
			<th>${member.name}</th>
			<th>${member.power}</th>
			<th>${member.reg}</th>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</html>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>