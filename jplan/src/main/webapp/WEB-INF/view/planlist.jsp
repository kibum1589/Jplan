<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    
<jsp:include page="../header.jsp"></jsp:include>
<style>
	
</style>
<div class="container out-align-center">
	
    <c:forEach var="plan" items="${planlist}">
<!-- Left-aligned media object -->
  <div class="media">
    <div class="media-left">
      <img src="http://placehold.it/100x100" class="media-object" style="width:120px">
    </div>
    <div class="media-body">
      <h2 class="media-heading">${plan.title}</h2>
      <br>
      <h4>조회수 ${plan.look}</h4> 
      <h4>좋아요 ${plan.love}</h4> 
    </div>
  </div>
    </c:forEach>

</div>

<div class="row in-align-center w3-bar">
        <c:if test="${pc.isPrev()}">
			<a class="w3-button" href="planlist?${pc.getQueryString(PageCalculator.PREV-1)}">&laquo;</a>
		</c:if>
		
		<c:forEach var="n" begin="${pc.sb}" end="${pc.eb}">
		<c:choose>
			<c:when test="${pc.pgno == n}">
				<font class="w3-button">${n}</font>
			</c:when>
			<c:otherwise>
				<a class="w3-button" href="planlist?${pc.getQueryString(n)}">${n}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<c:if test="${pc.isNext()}">
			<a class="w3-button" href="planlist?${pc.getQueryString(PageCalculator.NEXT-2)}">&raquo;</a>
		</c:if>
    </div>
    <div class="row in-align-center dropdown">
        <form action="" method="get">
            <!-- 선택창 -->
   <select name="sort" class="form-input-small">
       <option value="title">제목</option>
       <option value="love">좋아요수</option>
       <option value="dur" <c:if test="${pc.sort == 'dur'}">selected</c:if>>기간</option>
   </select>
   
  
   <!-- 입력창 -->
   <input class="form-control-small" name="keyword" type="search" placeholder="검색어" 
       required value="${pc.keyword}">

   <!-- 전송버튼 -->
            <input class="btn btn-info" type="submit" value="검색">
        </form>
    </div>

 
 <jsp:include page="../footer.jsp"></jsp:include>