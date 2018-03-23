<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


<div class="container-80 out-align-center">
	<div class="row font-big in-align-center">
		정보 수정
	</div>
	<hr>
	<form action="edit" method="post">
	<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<th width="20%">이메일</th>
					<td>
						<input type="text" name="email" required readonly 
								value="${mdto.email}" class="form-input form-input-full">
					</td>
				</tr>

				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required readonly
							value="${mdto.name}" class="form-input form-input-full">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" required
								class="form-input form-input-full"></td>
				</tr>
			
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input class="form-btn form-btn-full" type="submit" value="수정하기">	
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
	</form>
</div>

<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
