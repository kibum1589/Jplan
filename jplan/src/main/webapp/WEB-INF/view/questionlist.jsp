<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<script>
	
</script>
<html>
<div class="container" align="center">
<table class="table table-striped table-condensed">
	<thead>
	
		<tr>
			<th>번호</th>
			<th>주제</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	
	</thead> 
	<tbody>
		<!-- 실제 정보 출력 -->
		<c:forEach items="${questionlist}" var="question">
		<tr>
			<th>${question.no}</th>
			<th>${question.title}</th>
			<th></th>
			<th>${question.reg}</th>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<div class="row in-align-center w3-bar">
        <c:if test="${pc.isPrev()}">
			<a class="w3-button" href="memberlist?${pc.getQueryString(PageCalculator.PREV-1)}">&laquo;</a>
		</c:if>
		
		<c:forEach var="n" begin="${pc.sb}" end="${pc.eb}">
		<c:choose>
			<c:when test="${pc.pgno == n}">
				<font size="4" color="red">${n}</font>
			</c:when>
			<c:otherwise>
				<a class="w3-button" href="memberlist?${pc.getQueryString(n)}">${n}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<c:if test="${pc.isNext()}">
			<a class="w3-button" href="memberlist?${pc.getQueryString(PageCalculator.NEXT-2)}">&raquo;</a>
		</c:if>
    </div>
    
</html>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>