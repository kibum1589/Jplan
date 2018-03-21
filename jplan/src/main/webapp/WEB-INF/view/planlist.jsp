<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>

<div class="container-80 out-align-center in-align-center">
	<table class="table">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>기간</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    <c:forEach var="plan" items="${planlist}">
    <tr>
        <td>${plan.no}</td>
        <td><a href="${pageContext.request.contextPath}/myplan?no=${plan.no}">${plan.title}</a></td>
        <td>${plan.dur}</td>
        <td>
            <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
            <!-- <fmt:formatDate value="${plan.reg}" pattern="yyyy-MM-dd HH:mm:ss"/> -->
            ${plan.reg}
        </td>
        <td>${plan.look}</td>
    </tr>    
    </c:forEach>
</table>
</div>
 
 <jsp:include page="../footer.jsp"></jsp:include>