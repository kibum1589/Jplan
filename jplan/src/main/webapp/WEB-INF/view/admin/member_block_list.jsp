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
			<th colspan="7">제제 당한 회원은 총 ${memberblock}명 입니다.</th>
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
			<th>${member.email}</th>
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

<div class="row in-align-center">
        <c:if test="${pc.isPrev()}">
			<a href="member_block_list?${pc.getQueryString(PageCalculator.PREV-1)}">[이전]</a>
		</c:if>
		
		<c:forEach var="n" begin="${pc.sb}" end="${pc.eb}">
		<c:choose>
			<c:when test="${pc.pgno == n}">
				<font size="4" color="red">${n}</font>
			</c:when>
			<c:otherwise>
				<a href="member_block_list?${pc.getQueryString(n)}">${n}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<c:if test="${pc.isNext()}">
			<a href="member_block_list?${pc.getQueryString(PageCalculator.NEXT-2)}">[다음]</a>
		</c:if>
    </div>
    <div class="row in-align-center">
        <form action="" method="get">
            <!-- 선택창 -->
   <select name="sort" class="form-input-small">
       <option value="type">제제종류</option>
       <option value="reason" <c:if test="${pc.sort == 'reason'}">selected</c:if>>제제이유</option>
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