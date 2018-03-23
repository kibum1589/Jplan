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
			<th colspan="7">제제 한당 회원은 총 ${list.size()}명 입니다.</th>
		</tr>
		<tr>
			<th>회원번호</th>
			<th>제제 당한</th>
			<th>제제 가한</th>
			<th>제제종류</th>
			<th>원인</th>
			<th>기간</th>
			<th>가한날짜</th>
		</tr>
	</thead> 
	<tbody>
		<!-- 실제 정보 출력 -->
		<c:forEach items="${memberblocklist}" var="member">
		<tr>
			<th>${member.no}</th>
			<th>${member.mno}</th>
			<th>${member.ano}</th>
			<th>${member.type}</th>
			<th>${member.reason}</th>
			<th>${member.dur}</th>
			<th>${member.reg}</th>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</html>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>