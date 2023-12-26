<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-id="login">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login/membership_info.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div>
		<div id="membership_info_div">
			<div>
				회원가입을 축하합니다
				NewJeans Membership을 가입하시면 해당 혜택을 이용하실 수 있습니다
			</div>
		
		
			<div id="button_bar_div">
				<div>	
					Membership 가입하러 가기
				</div>
				
				<div id="button_div">
					<input type="button" value="가입하기" onclick="location.href='membership_shop_payment'">
					<input type="button" value="홈으로" onclick="location.href='main'">
				</div>
			</div>
		</div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>