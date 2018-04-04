<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXyMFNPLugzjEZsYzoFUpid7Rs6Qa3M4A&libraries=places&callback=initMap&region=kr" async defer></script>
<script src="${pageContext.request.contextPath}/res/js/plan/planajax.js"></script>
<script src="${pageContext.request.contextPath}/res/js/plan/plangoogle.js"></script>

	

<style>
	
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
		
	    <c:forEach var="plan" items="${planList}">
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
			<a class="w3-button" href="myplan?${pc.getQueryString(PageCalculator.PREV-1)}">&laquo;</a>
		</c:if>
		
		<c:forEach var="n" begin="${pc.sb}" end="${pc.eb}">
		<c:choose>
			<c:when test="${pc.pgno == n}">
				<font class="w3-button">${n}</font>
			</c:when>
			<c:otherwise>
				<a class="w3-button" href="myplan?${pc.getQueryString(n)}">${n}</a>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		
		<c:if test="${pc.isNext()}">
			<a class="w3-button" href="myplan?${pc.getQueryString(PageCalculator.NEXT-2)}">&raquo;</a>
		</c:if>
    </div>



 <jsp:include page="../footer.jsp"></jsp:include>