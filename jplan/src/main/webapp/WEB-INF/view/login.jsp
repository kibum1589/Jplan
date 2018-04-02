<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp"></jsp:include>

<head>
<style>
	body {
		font-family: Arial, Helvetica, sans-serif;
	}
	/* Full-width input fields */
	input[type=text], input[type=password], input[type=email] {
		width: 100%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border: none;
		background: #f1f1f1;
	}
	
	input[type=text]:focus, input[type=password]:focus, input[type=email]:focus
		{
		background-color: #ddd;
		outline: none;
	}
	
	hr {
		border: 1px solid #f1f1f1;
		margin-bottom: 25px;
	}
	
	button {
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 100%;
		opacity: 0.9;
	}
	
	button:hover {
		opacity: 1;
	}
	
	.signupbtn {
		width: 100%;
	}
</style>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="sha256.js"></script>
<script>
	$(document).ready(function() {

		$("#btnLogin").click(function() {
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var userId = $("#email").val();
			var userPw = $("#pw").val();
			console.log(userId);
			console.log(userPw);
			if (userId.value == "") {
				alert("아이디를 입력하세요.");
				$("#email").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if (userPw.value == "") {
				alert("비밀번호를 입력하세요.");
				$("#pw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action = "logincheck"
			// 제출
			document.form1.submit();

			event.preventDefault();

		});

	});
</script>
</head>
<body>

	<form name="form1" id="sign-form" action="sign" method="post"
		style="border: 1px solid #ccc">

		<div class="container">
			<h1>로그인</h1>
			<hr>

			<label for="email"><b>아이디</b></label> <input class="form-input"
				type="email" name="email" placeholder="아이디" id="email" required>

			<label for="pw"><b>비밀번호</b></label> <input class="form-input"
				type="password" name="pw" placeholder="비밀번호" id="pw" required>

			<button type="submit" id="btnLogin">로그인</button>
			<c:if test="${msg == 'failure'}">
				<div style="color: red">아이디 또는 비밀번호가 일치하지 않습니다.</div>
			</c:if>
			<c:if test="${blockmsg ne null}">
				<div style="color: red">${blockmsg}</div>
			</c:if>
		</div>
	</form>



</body>

<jsp:include page="../footer.jsp"></jsp:include>