<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>user_info_modify_form</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_info_modify_form.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="user_info_modify_form_div">
		<form id="user_info_modify_form">
			<div class="modify_form_input_div">
				<div>
					<div class="input_label">
						이름 : 
					</div>
					 
					<input name="m_name" id="m_name" value="${vo.m_name}" >
				</div>

				<div id="check_mid">
					<div></div>
				</div>
				
				<div class="bottom_border_div"></div>
			</div>
			
			
			<div class="modify_form_input_div">
				<div>
					<div class="input_label">
						연락처 : 
					</div>
					 
					<input name="m_tel" id="m_tel" oninput="tel_check(this.form)" value="${vo.m_tel}" >
				</div>

				<div id="check_alert">
					<div id="tel_check_alert"></div>
				</div>
				
				<div class="bottom_border_div"></div>
			</div>
			
			
			<div class="modify_form_input_div">
				<div>
					<div class="input_label">
						생년월일 : 
					</div>
					 
					<input name="m_date_of_birth" id="m_date_of_birth" oninput="birth_check(this.form)" value="${vo.m_date_of_birth}">
				</div>

				<div id="check_alert">
					<div id="birth_check_alert"></div>
				</div>
				
				<div class="bottom_border_div"></div>
			</div>
			
			
			<div class="modify_form_input_div">
				<div id="email_input_div">
					<div class="input_label">
						비밀번호 : 
					</div>
					
					<input name="m_password" id="m_password" type="password" oninput="password_check(this.form)" placeholder= "영어와 숫자를 조합한 8자리 이상입니다">
					
					<img id="view_password_icon" src="${pageContext.request.contextPath}/resources/img/eye_closed_icon.png" onclick="toggle_password(event)">
				</div>

				<div id="check_alert">
					<div id="password_check_alert"></div>
				</div>
				
				<div class="bottom_border_div"></div>
			</div>
			
					
			<div class="modify_form_input_div">
				<div>
					<div class="input_label">
						이메일 : 
					</div>
					
					<input name="m_email" id="m_email" value="${vo.m_email}" readonly >
				</div>

				<div id="check_alert">
					<div id="email_check_alert"></div>
				</div>
				
				<div class="bottom_border_div"></div>
			</div>
			
			
			<input type="hidden" name="m_idx" value="${vo.m_idx}">
			
			<div id="user_info_modify_form_button_div">
				<input type="button" value="수정완료" onclick="send(this.form)" style="cursor: pointer;">
			</div>
		</form>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>