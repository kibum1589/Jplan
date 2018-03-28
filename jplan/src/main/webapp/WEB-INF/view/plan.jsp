<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<jsp:include page="../header.jsp"></jsp:include>
  
	<html>
    	<head>
    	</head>
    <body>
        
        <!--일정 목록 한단위 시작-->
        <div class='empty-row'></div>
        <div class='container in-align-center'>
            <h1>Plan</h1>
        </div>
        <div class='empty-row'></div>
        <div class='container out-align-center'>
        
            <img src='http://www.placehold.it/4X1'
                 width="100%">
                <div style="height: 20"></div>
                <div style="display: flex">
              
                    <div style="flex-grow: 5" class="font-medium">
                        일정번호 ${plan.no}<br>
                        ${plan.title}
                    </div>
                    <div style="flex-grow: 1">
                        <img src='view.png'>
                        ${plan.look}
                        <img src='like.png'>
                        ${plan.love}
                    </div>
                </div>
            
            <div style="min-height: 100">
                <div style="height: 20"></div>
                <div>상세일정1  ${plandetail.pno}</div>
                <hr>
                <div>상세일정2  ${plandetail.id}</div>
                <div style="height: 20"></div> 
            </div>
            
            <div style="display: flex">
                <div style="flex-grow: 1">
                    아이디(게시판에서만)
                </div>
                <div style="">
                    <a>수정</a> <a>삭제</a>
                </div>
            </div>
         </div>
        <!--일정 목록 한단위 끝-->
        
  	</body>
</html>

 <jsp:include page="../footer.jsp"></jsp:include>