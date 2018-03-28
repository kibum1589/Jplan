<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
  
<html>
<head>
    <meta content-type="text/html; charset=UTF-8">
    <title>회원가입</title>
    
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="${pageContext.request.contextPath}/res/js/sign/sign.js"></script>
    
    <style>
       
        
        body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
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
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
    </style>
    <!-- 자바스크립트 작성 공간 -->
    <script>

    </script>
</head>
<body>
    <!-- <form id="sign-form"action="sign" method="post">
    <div class="container">
        <div class="row font-big in-align-center">
        	회원가입
        </div>
        <div class="row">
       		 이메일
            <input class="form-input email_reg" type="text" name="email" placeholder="ex)OOO@OOO.OOO" 
            required id="check" onkeypress="space_x();">     
             <span id="email_check"></span>
        </div>
        
        <div>
        <span></span>
        </div>
        
        <div class="row">
        	이름
            <input class="form-input" type="text" name="name" placeholder="2글자 에서 8글자 까지" required id="name" onkeypress="space_x();">
        </div>
        <div class="row">
        	비밀번호
            <input class="form-input" type="password" name="pw" placeholder="6자 에서 15자까지" required id="pw" onkeypress="space_x();">
        </div>
        <div class="row">
        	비밀번호 확인
            <input class="form-input" type="password" name="pw_check" placeholder="6자 에서 15자까지" required id="pw_check" onkeypress="space_x();">
            <span id="pwc"></span>
        </div>
        <div class="row">
            <input class="form-btn" type="submit" value="회원가입">
        </div>
    </div>
    </form> -->
    
    <form id="sign-form"action="sign" method="post" style="border:1px solid #ccc">
  <div class="container">
    <h1>회원가입</h1>
    <hr>

    <label for="email"><b>아이디</b></label>
    <input class="form-input email_reg" type="text" name="email" placeholder="ex)OOO@OOO.OOO" required id="check" onkeypress="space_x();">     
    <span id="email_check"></span>
    
    <div>
        <span></span>
    </div>
    
     <label for="name"><b>이름</b></label>
    <input class="form-input" type="text" name="name" placeholder="2글자 에서 8글자 까지" required id="name" onkeypress="space_x();">

    <label for="pw"><b>비밀번호</b></label>
    <input class="form-input" type="password" name="pw" placeholder="6자 에서 15자까지" required id="pw" onkeypress="space_x();">

    <label for="pw_check"><b>비밀번호 확인</b></label>
    <input class="form-input" type="password" name="pw_check" placeholder="6자 에서 15자까지" required id="pw_check" onkeypress="space_x();">
            <span id="pw"></span>
 
    <div class="clearfix">
      <button type="button" class="cancelbtn">취소</button>
      <button type="submit" class="signupbtn">회원가입</button>
    </div>
  </div>
</form>
    
    
</body>
</html>
 
 <jsp:include page="../footer.jsp"></jsp:include>