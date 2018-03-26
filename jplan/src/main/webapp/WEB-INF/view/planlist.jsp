<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>

<div class="container-80 out-align-center in-align-center">
	<table class="table">
    <tr>
        <td>번호</td>
        <td>제목</td>
        <td>기간</td>
        <td>작성일</td>
        <td>조회수</td>
    </tr>
    <c:forEach var="plan" items="${planlist}">
    <tr>
        <td>${plan.no}</td>
        <td><a href="${pageContext.request.contextPath}/plan?no=${plan.no}">${plan.title}</a></td>
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

<div class="row in-align-center">
        <c:if test="${pc.isPrev()}">
			<a href="planlist?${pc.getQueryString(PageCalculator.PREV-1)}">[이전]</a>
		</c:if>
		
		<c:forEach var="n" begin="${pc.sb}" end="${pc.eb}">
		<c:choose>
			<c:when test="${pc.pgno == n}">
				<font size="4" color="red">${n}</font>
			</c:when>
			<c:otherwise>
				<a href="planlist?${pc.getQueryString(n)}">${n}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<c:if test="${pc.isNext()}">
			<a href="planlist?${pc.getQueryString(PageCalculator.NEXT-2)}">[다음]</a>
		</c:if>
    </div>
    <div class="row in-align-center">
        <form action="" method="get">
            <!-- 선택창 -->
   <select name="sort" class="form-input-small">
       <option value="title">제목</option>
       <option value="love">좋아요수</option>
       <option value="dur" <c:if test="${pc.sort == 'dur'}">selected</c:if>>기간</option>
   </select>

   <!-- 입력창 -->
   <input class="form-input-small" name="keyword" type="search" placeholder="검색어" 
       required value="${pc.keyword}">

   <!-- 전송버튼 -->
            <input class="form-btn-small" type="submit" value="검색">
        </form>
    </div>

 
 <jsp:include page="../footer.jsp"></jsp:include>