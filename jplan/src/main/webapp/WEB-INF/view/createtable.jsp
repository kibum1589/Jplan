<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<jsp:include page="../header.jsp"></jsp:include>
  
<div class="empty-row"></div>
    <div class="container-80 in-align-center out-align-center">
        <table class="table">
            <thead>
                <tr>
                    <th>날짜</th>
                    <th>일정</th>
                    <th>교통</th>
                    <th>숙소</th>
                </tr>
            </thead>
            <tbody>
                
                <c:forEach var="plandetail" items="${plandetaillist}">         
                <tr>
                    <th>
                       ${plandetail.day}
                    </th>
                    <th>
                    	${plandetail.id}
                    </th>
                    <th></th>
                    <th></th>
                </tr>
                </c:forEach>
               
            </tbody>
        </table>    
    </div>
 
<jsp:include page="../footer.jsp"></jsp:include>