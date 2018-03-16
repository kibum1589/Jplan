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
            var userId = $("#userId").val();
            var userPw = $("#userPw").val();
            if(userId == ""){
                alert("아이디를 입력하세요.");
                $("#userId").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(userPw == ""){
                alert("아이디를 입력하세요.");
                $("#userPw").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.form1.action="${path}/member/loginCheck.do"
            // 제출
            document.form1.submit();
        });
    });
    </script>
    <body>
    <form action="" method="post">
    <div class="container">
    <div class="row font-big in-align-center">
        로그인
    </div>
    <div class="row">
            <input class="form-input" type="email" name="email" placeholder="아이디" required>
        </div>
        <div class="row">
            <input class="form-input" type="text" name="nickname" placeholder="비밀번호" required>
        </div>
        <div class="row">
            <input class="form-btn" type="submit" value="로그인">
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
        </div>
        </div>
        </form>
	</body>