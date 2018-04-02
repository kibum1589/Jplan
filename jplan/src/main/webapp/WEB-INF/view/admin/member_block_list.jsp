<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/common.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 스타일을 위한 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/memberlist.css">
<script src="${pageContext.request.contextPath}/res/js/admin/memberlist.js"></script>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

    <div class="empty-row"></div>
    <div class="empty-row"></div>

 <div class="container table-title" align="center">
<h3>제제회원 목록</h3>
</div>
 
     <div class="empty-row"></div>
 
 
<html>
<div class="container" align="center">
<table class="table6_1 ">
	<thead>
		<tr>
			<th colspan="8">제제 당한 회원은 총 ${memberblock}명 입니다.</th>
		</tr>
		<tr>
			<th>이메일</th>
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
			<td>${member.email}</td>
			<td>${member.no}</td>
			<td>${member.mno}</td>
			<td>${member.ano}</td>
			<td>${member.type}</td>
			<td>${member.reason}</td>
			<td>${member.dur}</td>
			<td>${member.reg}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<div class="row in-align-center w3-bar">
        <c:if test="${pc.isPrev()}">
			<a class="w3-button" href="member_block_list?${pc.getQueryString(PageCalculator.PREV-1)}">&laquo;</a>
		</c:if>
		
		<c:forEach var="n" begin="${pc.sb}" end="${pc.eb}">
		<c:choose>
			<c:when test="${pc.pgno == n}">
				<font size="4" color="red">${n}</font>
			</c:when>
			<c:otherwise>
				<a class="w3-button" href="member_block_list?${pc.getQueryString(n)}">${n}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<c:if test="${pc.isNext()}">
			<a class="w3-button" href="member_block_list?${pc.getQueryString(PageCalculator.NEXT-2)}">&raquo;</a>
		</c:if>
    </div>
    <div class="in-align-center">
        <form action="" method="get">
            <!-- 선택창 -->
   <select name="sort" class="form-input-small">
       <option value="email">이메일</option>
       <option value="reason">제제이유</option>
       <option value="type" <c:if test="${pc.sort == 'type'}">selected</c:if>>제제종류</option>
   </select>
   
   <!-- 입력창 -->
   <input class="form-input-small" name="keyword" type="search" placeholder="검색어" 
       required value="${pc.keyword}" style="display: inline-block;">

   <!-- 전송버튼 -->
            	<button class="sbutton" type="submit">검색</button>
        </form>
    </div>

</html>

    <div class="empty-row"></div>


<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>