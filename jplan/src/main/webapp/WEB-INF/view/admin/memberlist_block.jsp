<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 스타일을 위한 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/member.css">

<script>
var durck; // 기간 확인 변수
//기간 길이확인
window.onload = function(){
//$(document).ready(function(){
    //기간 입력창에 이벤트 설정
     document.querySelector("input[name=dur]").addEventListener("input", function(){
    	 //기간 확인 콘솔
    	 var name = $(".dur_ck").val();
			console.log(name);
			var regex = /^[0-9]{1,7}$/;
        if(!this.value || !regex.test(name)){
        	console.log('불가능');
        	durck = 1;
        }
        else{
        	console.log('가능');
			durck = 0;
        }
        
     });
    
     $('.blockSubmit').on('click',function(){
			event.preventDefault();
			if(durck==0) $('.contact-form').submit();			
		});	
};
</script>


<p class="headbody" data-split="회원 제제">회원 제제</p>

<div class="empty-row"></div>
<div class="empty-row"></div>


<div id="section">
<section class="contact-wrap">	
<form class="contact-form" action="memberlist_block" method="post">
	
	<div class="col-sm-12">
		<div class="input-block">
		<label>제제종류</label>
		<br>
			<input type="text" name="type" required class="form-control check">
		</div>
	</div>				
			
	<div class="col-sm-12">
		<div class="input-block">
		<label>원인</label>
		<br>
		<input type="text" name="reason" required class="form-control check">
		</div>
	</div>
		
	<div class="col-sm-12">		
		<div class="input-block">	
		<label>기간</label>
		<br>
		<input type="text" name="dur" required class="form-control check dur_ck" placeholder="숫자만 기입해 주세요.">
		<input type="hidden" name="no" value="${param.no}">
		<input type="hidden" name=email value="${param.email}">
		</div>
	</div>			
	
	<div class="col-sm-12">
		<button class="square-button blockSubmit" type="submit">제제 확인</button>	
	</div>
	
</form>
</section>
</div>


<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="empty-row"></div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
