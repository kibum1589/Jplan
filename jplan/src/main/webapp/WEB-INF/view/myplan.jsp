<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>
  
	<html>
    	<head>
    	</head>
    <body>
        
        <!--일정 목록 한단위 시작-->
        <div class='empty-row'></div>
        <div class='container-100 in-align-center'>
            <h1>My Plan</h1>
        </div>
        <div class='empty-row'></div>
        <div class='container-80 out-align-center'>
            <img src='http://www.placehold.it/4X1'
                 width="100%">
                <div style="height: 20"></div>
                <div style="display: flex">
                    
                    <div style="flex-grow: 10" class="font-medium">
                        ${plan.no}${plan.title}
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
                <div>상세일정1</div>
                <hr>
                <div>상세일정2</div>
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