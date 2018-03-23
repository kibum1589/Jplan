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
			<th colspan="7">총 ${member}명의 회원이 있습니다.</th>
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

<div class="row in-align-center">
        <c:if test="${pc.isPrev()}">
			<a href="memberlist?${pc.getQueryString(PageCalculator.PREV-1)}">[이전]</a>
		</c:if>
		
		<c:forEach var="n" begin="${pc.sb}" end="${pc.eb}">
		<c:choose>
			<c:when test="${pc.pgno == n}">
				<font size="4" color="red">${n}</font>
			</c:when>
			<c:otherwise>
				<a href="memberlist?${pc.getQueryString(n)}">${n}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<c:if test="${pc.isNext()}">
			<a href="memberlist?${pc.getQueryString(PageCalculator.NEXT-2)}">[다음]</a>
		</c:if>
    </div>
</html>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>