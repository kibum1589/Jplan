<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">   
<jsp:include page="../header.jsp"></jsp:include>
  

<c:forEach items="${planList}" var="plan">
<!-- 포스터 -->
<br>
<div class="media" >
  <div class="media-left">
    
      <img class="media-object" src="..." alt="..." style="width: 100;height: 100">
    
  </div>
  <div class="media-body" style="padding: 5">
    
    <h3 class="media-heading" style="margin-bottom: 20">${plan.title} </h3>
    <h5>${plan.sday} </h5>
  </div>
</div>
</c:forEach>	

 
<!-- <!-- 상세정보 --> -->
<!-- <div class="list-group" style="margin-left: 120"> -->
<!--   <a href="#" class="list-group-item active"> -->
<!--     Day 01 -->
<!--   </a>   -->
<!--   <a href="#" class="list-group-item"> -->
    
<!--     <div style="display: flex; margin-top: 30; flex-direction: column; width:100"> -->
        
<!--         선 -->
<!--         <div style="position: absolute; bottom: 35%;left:50;border: 1px solid #B2DFDB; width: 100%; background-color: #B2DFDB"></div> -->
        
        
<!--         도시이름 -->
<!--         <p style="; align-self: center">도시이름</p> -->
<!--         원 -->
<!--         <div style="background-color: #B2DFDB; width: 100; height: 100; border-radius: 100%; text-align: center; display: flex;z-index: 10"> -->
<!--           텍스트     -->
<!--           <p style="flex-grow: 1; align-self: center; text ">장소이름</p> -->
<!--         </div> -->
        
        
        
<!--     </div> -->
<!--   </a> -->
    
<!-- </div> -->


 <jsp:include page="../footer.jsp"></jsp:include>