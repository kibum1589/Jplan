<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
var nck;//확인 변수
var pwk; // 비밀번호 확인 변수
window.onload = function(){
//비밀번호 입력창에 이벤트 설정
document.querySelector("input[name=pw]").addEventListener("input", function(){
    var pw_regex = /^\w{6,15}$/;
  //비밀번호확인 콘솔
    var pw = $(".pw_delete").val();
	console.log(pw);
/*		
//비밀번호 암호화	
	$(document).ready(function(){
			$("form").on("submit", function(){
			var pw_secret = $("input[name=pw]");
			pw_secret.val(SHA256(pw_secret.val()));
			
					});
	     		});*/
/* 	 $.ajax({
		url:"signcheck",
		type:"post",
		//ajax 요청을 보내면서 데이터를 첨부
		data:{
		pw:pw
		},
		dataType:"text",
		success:function(result){ */
	if(!this.value || !pw_regex.test(pw)){
		$("#pw_check").text("비밀번호가 틀렸습니다.");
    	console.log('불가능');
    	nck = 1;
    }
    else{
    	$("#pw_check").text("비밀번호 가 맞습니다.");
    	console.log('가능');
		nck = 0;
    	}
//	}
});


  $('.delete').on('click',function(){
	event.preventDefault();
	if(nck==0 && pwk==0) $('.member_delete').submit();			
		});
	});
};
</script>

<div class="empty-row"></div>
<div class="empty-row"></div>

<div class="container-70 out-align-center">
	<div class="row font-big in-align-center">
		회원 탈퇴
	</div>
	<div class="row font-small in-align-center">
		탈퇴를 진행하기 위하여 비밀번호를 입력해주세요
	</div>
	<form action="member_delete" method="post">
	<div class="row">
		<input class="form-input form-input-full pw_delete" type="password" name="pw" required placeholder="비밀번호">
	<span id="pw_check"></span>
	</div>	
	<div class="row">
		<input class="delete" type="submit" value="입력">
	</div>
	</form>
</div>

<div class="empty-row"></div>
<div class="empty-row"></div>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
