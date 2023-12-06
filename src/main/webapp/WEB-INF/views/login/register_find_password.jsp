<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/register_find_password.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<form>		
		
		<div>비밀번호 찾기</div>
		<div class="find_id">
			<label class="control_label" for="m_id">아이디</label>
			<input class="form_control" type="text" id="m_id" name="m_id" />
		</div>
		
		<div class="find_id">
			<label class="control_label" for="m_email">이메일</label>
			<input name="m_email" id="m_email"  >
			<button id="auth_btn" type="button">이메일 인증하기</button>
			<input class="mail_check_input" id="m_code" name="m_code" placeholder="인증번호를 적어주세요">
			<div id="mail_check_input_info" ></div>
			<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login_js/email.js"></script>
		</div>
		
		<div class="find_id">
			<input type="button" value="완료" onclick="javascript:send_password(this.form)"> 
			<input type="button" value="취소" onclick="location.href='main'">
		</div>
	</form>
</body>
</html>