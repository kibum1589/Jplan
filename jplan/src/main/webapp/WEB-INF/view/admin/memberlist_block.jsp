<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


<div class="container-80 out-align-center">
	<div class="row font-big in-align-center">
		회원 제제 
	</div>
	<hr>
	<form action="admin_memberlist_block" method="post">
	<div class="row">
		<table class="table">
				<tr>
					<th>제제종류</th>
					<td>
						<input type="text" name="type" required
							class="form-input form-input-full">
					</td>
				</tr>
				
				<tr>
					<th>원인</th>
					<td><input type="text" name="reason" required
								class="form-input form-input-full"></td>
				</tr>
				<tr>
				<tr>
					<th>기간</th>
					<td><input type="text" name="dur" required
								class="form-input form-input-full"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="제제확인">	
					</th>
				</tr>
		</table>
	</div>
	</form>
</div>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
