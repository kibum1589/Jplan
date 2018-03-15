<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
  
<html>
<head>
    <meta content-type="text/html; charset=UTF-8">
    <title>일정만들기</title>
    <style>
        header{
            border: none;
        }
        aside, section{
            border:1px solid black;
        }
        .form{
            margin:10px 0px;
        }
        .form-input{
            border:1px solid black;
            padding:10px;
            font-size:16px;
            width:300px;
        }
        .btn{
            border:1px solid black;
            padding:10px;
            font-size:16px;
            width:100px;
            font-size:15px;
        }
        main{
            display: flex;
            flex-wrap: wrap;
        }
        
        header{
            width:100%;
            height:60px;
        }
        
        aside{
            width:300px;
            height:500px;
        }
        
        section{
            flex-grow: 1;
            height:500px;
        }
        
    </style>
    <script>
    </script>
</head>
<body>
    <main>
        <header>
            <div class="form">
                <input class="form-input" type="text" name="where" placeholder="where" required>
                <input class="form-input" type="text" name="title" placeholder="title" required>
                <input class="form-input" type="date" name="date" placeholder="date" required>
                <a href="#" class="right">나만보기</a>
                <a href="#" class="rright">공유하기</a>
            </div>
        </header>
        <aside>
        </aside>
        <aside>
        </aside>
        <section>
        </section>
    </main>   
</body>
</html>
 
 
 <jsp:include page="../footer.jsp"></jsp:include>