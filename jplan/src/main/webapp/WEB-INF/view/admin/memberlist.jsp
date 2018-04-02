<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 스타일을 위한 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/memberlist.css">
<script src="${pageContext.request.contextPath}/res/js/admin/memberlist.js"></script>


<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<script>
	
</script>


<div class="empty-row"></div>

<div class="container " align="center">

<div class="container table-title " align="center">
<h3>회원 목록</h3>
</div>

<div class="empty-row"></div>

<table class="table6_1 ">
	<thead>
		<tr>
			<th class="text-left" colspan="7">총 ${member}명의 회원이 있습니다.</th>
		</tr>
	</thead> 
	<tbody class="table-hover ">
		<tr>
			<th class="text-left">이메일</th>
			<th class="text-left">이름</th>
			<th class="text-left">등급</th>
			<th class="text-left">가입일</th>
			<th class="text-left">제제종류</th>
		</tr>
		<!-- 실제 정보 출력 -->
		<c:forEach items="${memberlist}" var="member">
		<tr>
			<td class="text-left">${member.email}</td>
			<td class="text-left">${member.name}</td>
			<td class="text-left">${member.power}</td>
			<td class="text-left">${member.reg}</td>
			<td class="text-left">
			
			<button class="bbutton" 
			onclick="location.href='${pageContext.request.contextPath}/admin/memberlist_block?no=${member.no}&email=${member.email}'">회원제제</button>

			</td>
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
    

    
     <div class=" in-align-center">
        <form action="" method="get">
        
            <!-- 선택창 -->
   <select name="sort" class="" style="display: inline-block;">
       <option value="email">아이디</option>
       <option value="power" <c:if test="${pc.sort == 'power'}">selected</c:if>>권한</option>
   </select>
   

   <!-- 입력창 -->
   <input class="" name="keyword" type="search" placeholder="검색어" 
       required value="${pc.keyword}" style="display: inline-block;" >

   <!-- 전송버튼 -->
            	<button class="sbutton" type="submit">검색</button>
</div>

</div>
        </form>
</html>

    <div class="empty-row"></div>
    

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>