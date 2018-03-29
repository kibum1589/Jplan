<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


<div class="empty-row"></div>
            
<div class="container-70 out-align-center">
    <div class="row font-big in-align-center">
        나의 정보 보기
    </div>
    
    <%--<div class="container">
  		<h2>My information</h2>                 
  	<table class="table table-striped">
    	<thead>
      	<tr>
        	<th>e-mail</th>
        	<th>${memberInfoDao.email}</th>
      	</tr>
    	</thead>
    	<tbody>
      		<tr>
        		<td>이름</td>
        		<td>${memberInfoDao.name}</td>
      		</tr>
      		<tr>
        		<td>권한</td>
        		<td>${memberInfoDao.power}</td>
      		</tr>
      		<tr>
        		<td>가입일</td>
        		<td>${memberInfoDao.reg}</td>
      		</tr>
    	</tbody>
  	</table>
	</div> --%>
	<div class="container">
  <h2>Information</h2>          
  <table class="table table-striped">
    <thead>
      <tr>
        <th>이메일</th>
        <th>${memberInfoDao.email}</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>이름</td>
        <td>${memberInfoDao.name}</td>
      </tr>
      <tr>
        <td>권한</td>
        <td>${memberInfoDao.power}</td>
      </tr>
      <tr>
        <td>가입일</td>
        <td>${memberInfoDao.reg}</td>
      </tr>
    </tbody>
  </table>
</div>
	
	 
	
   <div class="row font-big in-align-center">
<button class="left" onclick="location.href='${pageContext.request.contextPath}/admin/member_edit'">정보수정</button>
	</div>
    <div class="row font-big in-align-center">
<button class="left" onclick="location.href='${pageContext.request.contextPath}/admin/member_delete'">회원탈퇴</button>    
	</div>

<div class="empty-row"></div>
<div class="empty-row"></div>
</div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
