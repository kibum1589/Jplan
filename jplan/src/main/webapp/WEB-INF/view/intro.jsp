<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
    <meta content-type="text/html; charset=UTF-8">
    <title></title>
    <!--자바스크립트 작성 공간-->
    <style>
        .menu{
            padding: 1em;

/*            여백을 없앰*/
            display: flex;
        }
        a{
            text-decoration: none;
        }
        .left{
            margin-right:2em;
        }
        .right{
            /* 1개만 설정 가능 */
            margin-left: 2em;
        }
        
        main, header, nav, aside, section{
            border:1px solid black;
        }
        
        main{
            display: flex;
            flex-wrap: wrap;
        }
        
        nav{
            width:100%;
            height:30px;
        }
        
        header{
            width:100%;
            height:50%;
        }
        
        aside{
            width:700px;
            height:50%;
        }
        
        section{
            flex-grow: 1;
            height:50%;
        }
        .remote{
            position: fixed;
            width:500px;
            height:300px;
            right:20px;
            top: 20px;
            
            background-color: lightgreen;
            
            z-index: 90000;
        }
        
    </style>
    <script>
    </script>
</head>
<body>
    <main>
    <nav class="menu">
        <a href="#" class="left">개요</a>
        <a href="#" class="left">일정표</a>
        <a href="#" class="left">지도</a>
        <a href="#" class="left">가져오기</a>
        <a href="#" class="right">돌아가기</a>
    </nav>
    <header>
        일정
    </header>
    <aside>상세정보</aside>
    <section>댓글</section>
    <div class="remote">
        <a href="#">remote</a>
    </div>
    </main>
    
</body>
</html>

<jsp:include page="../footer.jsp"></jsp:include>