<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>
//스페이스 방지 
function space_x() {
	document.querySelector(".row");
	if(event.keyCode == 32){
        
        //preventDefault(); 쓰면 이벤트 를 막겠다 라는 것이다. 
        event.preventDefault();
    }
}
	var nck; // 이름 확인 변수
	//이름 길이확인
 window.onload = function(){
	//$(document).ready(function(){
        //이름 입력창에 이벤트 설정
         document.querySelector("input[name=name]").addEventListener("input", function(){
        	 //이름 확인 콘솔
        	 var name = $(".name_edit").val();
 			console.log(name);
 			var regex = /[가-힣a-zA-Z]{2,8}$/;
            if(!this.value || !regex.test(name)){
            	console.log('불가능');
            	nck = 1;
            }
            else{
            	console.log('가능');
				nck = 0;
            }
         });
	  //}); 
        
         //비밀번호 입력창에 이벤트 설정
         document.querySelector("input[name=pw]").addEventListener("input", function(){
             var pw_regex = /^\w{6,15}$/;
           //비밀번호확인 콘솔
             var pw = $(".pw_edit").val();
 			console.log(pw);
 	/*		
 		//비밀번호 암호화	
 			$(document).ready(function(){
 					$("form").on("submit", function(){
 					var pw_secret = $("input[name=pw]");
 					pw_secret.val(SHA256(pw_secret.val()));
 					
 							});
 			     		});*/
 			
 			if(!this.value || !pw_regex.test(pw)){
             	console.log('불가능');
             	nck = 1;
             }
             else{
             	console.log('가능');
 				nck = 0;
             }
         });
         
         
	       $('.edit').on('click',function(){
			event.preventDefault();
			if(nck==0) $('.edit_form').submit();			
		});
};
</script>
<!--

//-->
<div class="container-80 out-align-center">
	<div class="row font-big in-align-center">
		정보 수정
	</div>
	<hr>
	<form class="edit_form" action="member_edit" method="post">
	<div class="row">
		<table class="table">
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required class="name_edit" onkeypress="space_x();"
							value="${member.name}" class="check">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호<br>(6~15자리 사이)</th>
					<td><input type="password" name="pw" required class="pw_edit" onkeypress="space_x();"
								class="check" placeholder="수정하려는 비밀번호를 입력하여 주세요."></td>
				<tr><span id="pwc"></span><tr>
				</tr>
				<tr>
					<th colspan="2">
						<input class="edit" type="submit" value="수정하기">	
					</th>
				</tr>
		</table>
	</div>
	</form>
</div>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
