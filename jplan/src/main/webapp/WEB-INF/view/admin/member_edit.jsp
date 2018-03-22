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
					<th>비밀번호</th>
					<td><input type="password" name="pw" required
								class="form-input form-input-full"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" required readonly
							value="${mdto.name}" class="form-input form-input-full">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="birth" required value="${mdto.birth}" 
									readonly placeholder="(예) 20180119"
										class="form-input form-input-full">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone" placeholder=" - 빼고 입력" 
							required value="${mdto.phone}" class="form-input form-input-full">
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td class="left">
						<input type="text" name="post" maxlength="5" 
						size="5" value="${mdto.post}" class="form-input">
					</td>
				</tr>
				<tr>
					<th>기본주소</th>
					<td>
						<input type="text" name="addr1" value="${mdto.addr1}"
							class="form-input form-input-full">
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
					<input type="text" name="addr2" value="${mdto.addr2}"
						class="form-input form-input-full">
					</td>
				</tr>
				<tr>
					<th>비밀번호<br>확인질문</th>
					<td><input type="text" name="pwquiz" required
							class="form-input form-input-full"></td>
				</tr>
				<tr>
					<th>비밀번호<br>확인답변</th>
					<td><input type="text" name="pwans"  required
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
