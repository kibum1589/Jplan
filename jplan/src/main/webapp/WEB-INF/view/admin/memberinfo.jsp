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
   <div class="row font-big in-align-center">
<button class="left" onclick="location.href='admin/memberedit'">정보수정</button>
	</div>
    <div class="row font-big in-align-center">
<button class="left" onclick="location.href='admin/memberdelete'">회원탈퇴</button>    
	</div>

<div class="empty-row"></div>
<div class="empty-row"></div>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
