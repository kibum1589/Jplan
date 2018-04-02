<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<!-- 스타일을 위한 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/memberlist.css">
<script src="${pageContext.request.contextPath}/res/js/admin/memberlist.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/memberinfo.css">

<div class="empty-row"></div>
            
<div class="container-70 out-align-center">
    <div class="row font-big in-align-center">
      <p>나의 정보 보기</p>
    </div>
    
	<div class="container">
  <h2 class="p">Information</h2>          
  <table class="table blob-btn">
    <thead >
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
<button class="left infosbutton " onclick="location.href='${pageContext.request.contextPath}/admin/member_edit'">정보수정</button>
	</div>
	
	
    <div class="row font-big in-align-center">
<button class="left infosbutton" onclick="location.href='${pageContext.request.contextPath}/admin/member_delete'">회원탈퇴</button>    
	</div>

	

<div class="empty-row"></div>
<div class="empty-row"></div>
</div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
