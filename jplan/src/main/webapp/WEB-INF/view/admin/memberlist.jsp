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
			<th colspan="7">총 ${member}명의 회원이 있습니다.</th>
		</tr>
		<tr>
			<th>이메일</th>
			<th>이름</th>
			<th>등급</th>
			<th>가입일</th>
			<th>제제종류</th>
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
			<th><button class="left" onclick="location.href='${pageContext.request.contextPath}/admin/memberlist_block?no=${member.no}&email=${member.email}'">회원제제</button></th>
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
    
     <div class="row in-align-center">
        <form action="" method="get">
            <!-- 선택창 -->
   <select name="sort" class="form-input-small">
       <option value="email">아이디</option>
       <option value="reg" <c:if test="${pc.sort == 'reg'}">selected</c:if>>가입일</option>
   </select>

   <!-- 입력창 -->
   <input class="form-input-small" name="keyword" type="search" placeholder="검색어" 
       required value="${pc.keyword}">

   <!-- 전송버튼 -->
            <input class="form-btn-small" type="submit" value="검색">
        </form>
    </div>
</html>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>