<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
  
<html>
<head>
    <meta content-type="text/html; charset=UTF-8">
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
        }
        .form-btn{
            background-color:lightsteelblue;
            color:white;
            border:none;
            border-radius: 25px;
        }
        
    </style>
    
    
    <script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userId = $("#email").val();
            var userPw = $("#pw").val();
            console.log(userId);
            console.log(userPw);
            if(userId.value == ""){
                alert("아이디를 입력하세요.");
                $("#email").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(userPw.value == ""){
                alert("비밀번호를 입력하세요.");
                $("#pw").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.form1.action="logincheck"
            // 제출
            document.form1.submit();
        });
    });
    </script>
    <body>
    <form name="form1" method="post">
    <div class="container">
    <div class="row font-big in-align-center">
        로그인
    </div>
    <div class="row">
            <input class="form-input" type="email" name="email" placeholder="아이디" id="email" required>
        </div>
        <div class="row">
            <input class="form-input" type="text" name="pw" placeholder="비밀번호" id="pw" required>
        </div>
        <div class="row">
            <button class="form-btn" type="button" id="btnLogin">로그인</button>
            
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        	아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <%-- <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        	로그아웃되었습니다.
                    </div>
                </c:if> --%>
        </div>
        </div>
        </form>
	</body>