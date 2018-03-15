<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../header.jsp"></jsp:include>

<style>
  .reivew{
            display: flex;
            flex-wrap: wrap;
        }
    
    .reivew > .impo{
            flex-grow:1;
/*            width:33.3333%;*/
            width:20%;
            
            height:40%;
            
            padding:10px;
            
/*            넘어가는 항목은 보여주지 않겠다*/
            overflow: hidden;
        }
    

        .search{
            width: 30%;
            margin-left: 35%;
            font-size: 20px;
            
            padding: 15px;
            padding-left: 50px;
            
            /*검색 이미지 설정*/
            background-image: url(img/search.png);
            background-repeat: no-repeat;
            background-size: 40px;
            background-position: 5px 5px;
        } 
</style>
  
    <input class="search" type="text" placeholder="검색어 입력">
    
    <div class="row in-align-center font-title">
        인기 여행지 Top6
    </div>
    
    <!-- 갤러리 영역 -->
    <div class="gallary">
        <div class="image"><img src="img/1.jpg"></div>
        <div class="image"><img src="img/2.jpg"></div>
        <div class="image"><img src="img/3.jpg"></div>
        <div class="image"><img src="img/4.jpg"></div>
        <div class="image"><img src="img/5.jpg"></div>
        <div class="image"><img src="img/6.jpg"></div>
    </div> 
    
    <!-- 이용방법 영역 -->
    <div class="container-100 out-align-center">
        <div class="row in-align-center font-big">최근리뷰</div>
    </div>
    
    <div class="reivew">
        <div class="impo">리뷰정보</div>
        <div class="impo">리뷰정보</div>
        <div class="impo">리뷰정보</div>
        <div class="impo">리뷰정보</div>
    </div>
    
    <div class="remote">
        <a href="#">Top</a>
    </div>
    
    <jsp:include page="../footer.jsp"></jsp:include>