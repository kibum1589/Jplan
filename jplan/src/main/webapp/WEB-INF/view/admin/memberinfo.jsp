<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/common.css">
<%-- <jsp:include page="${pageContext.request.contextPath}/header.jsp"></jsp:include>
 --%>

<div class="empty-row"></div>
            
<div class="container-70 out-align-center">
    <div class="row font-big in-align-center">
        회원 정보 보기
    </div>
    <div class="row">
           <table class="table">
               <tbody>
				<tr>
					<th width="25%">이메일</th>
					<td class="left">${member.email}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td class="left">${member.name}</td>
				</tr>
				<tr>
					<th>권한</th>
					<td class="left">${member.power}</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td class="left">${member.reg}</td>
				</tr>
			</tbody>
		</table>
    </div>
<%--     <div class="row font-big in-align-center">
    	<a href="${pageContext.request.contextPath}/admin/memberedit?email=${member.email}">정보수정</a>
    </div>
    <div class="row font-big in-align-center">
    	<a href="${pageContext.request.contextPath}/admin/memberdelete?email=${member.email}">회원탈퇴</a>
    </div> --%>
</div>

<div class="empty-row"></div>
<div class="empty-row"></div>

<%-- <jsp:include page="${pageContext.request.contextPath}/footer.jsp"></jsp:include>
 --%>

