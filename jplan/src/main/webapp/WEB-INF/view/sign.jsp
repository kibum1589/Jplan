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
        .font-big{
            font-size:2em;
        }
        .in-align-center{
            text-align: center;
        }
        .container{
            width:400px;
            margin:0px auto;
        }
        .row{
            margin:10px 0px;
        }
        .form-input, .form-btn{
            border:1px solid black;
            width:100%;
            padding:10px;
            font-size:16px;
            display:block;
            
            width:100%;
            
            font-family: 빙그레체;
            font-size:20px;
        
        }
        .form-btn{
            background-color: lightsteelblue;
            color:white;
            border:none;
            border-radius: 25px;
        }
    </style>
    <!-- 자바스크립트 작성 공간 -->
    <script>

    </script>
</head>
<body>
    <form id="sign-form"action="sign" method="post">
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
        
<!--         <div>
        <span></span>
        </div> -->
        
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
    </form>
</body>
</html>
 
 <jsp:include page="../footer.jsp"></jsp:include>