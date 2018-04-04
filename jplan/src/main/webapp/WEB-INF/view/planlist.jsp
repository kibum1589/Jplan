<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXyMFNPLugzjEZsYzoFUpid7Rs6Qa3M4A&libraries=places&callback=initMap&region=kr" async defer></script>
<script src="${pageContext.request.contextPath}/res/js/plan/planajax.js"></script>
<script src="${pageContext.request.contextPath}/res/js/plan/plangoogle.js"></script>


<style>

	#input-search{
		display: inline-block;
		width: 30%;
	}
	
	#select-search{
		display: inline-block;
		width: 10%;
	}
	
	.planli{
		height: auto;
	}
	
	.main-container{
		display: flex;
		margin-left: 5%;
		margin-top: 3%;
	}
	
	.list-container{
		flex:3;
	}
	
	.map-container{
		flex: 2;
		min-height: 600px;
	}
	
	#map{
		position: absolute;
		width:500px;
		height:600px;
		top: 0px;
		right: 50px;
		margin-top: 100px;
	}
	
</style>

<jsp:include page="../header.jsp"></jsp:include>

<div class= "main-container">
	<div class="list-container">
		
	    <c:forEach var="plan" items="${planlist}">
	  	<div class="media">
	    
		    <div class="media-body planPoster planli" data-place="${plan.no }">
		      <h3 class="media-heading">${plan.title}</h3>
		      <h5>${plan.sday} </h5>
		    </div>
		    
		    <div class="detail-container" style="display: flex; flex-direction: row">
			  <div class="list-group detail-list"  style="flex-grow: 4">
			  </div>
	  		</div>
	  	</div>
	  	<hr>
	    </c:forEach>
	
	</div>
	
	<div class = "map-container"></div>
	<div id = "map" ></div>
	
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
    <div class="row in-align-center form-group">
        <form class="form-search" action="" method="get">
            <!-- 선택창 -->
   <select name="sort" class="form-control" id="select-search">
       <option value="title">제목</option>
       <option value="love">좋아요수</option>
       <option value="dur" <c:if test="${pc.sort == 'dur'}">selected</c:if>>기간</option>
   </select>
   
  
   <!-- 입력창 -->
   <input class="form-control" id="input-search" name="keyword" type="search" placeholder="검색어" 
       required value="${pc.keyword}">

   <!-- 전송버튼 -->
            <input class="btn btn-info" type="submit" value="검색">
        </form>
    </div>

 
 <jsp:include page="../footer.jsp"></jsp:include>