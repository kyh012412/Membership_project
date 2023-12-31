<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head data-id="shop">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shop/payment_completed.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script>
		localStorage.removeItem("order_list_json");
	</script>

</head>

<body>
	<div id="header_bar"></div>
	
	<div id="payment_completed_div">
		<input id="isMembership" type="hidden" value="${isMembership}">
		<div id="payment_completed_header">
			주문완료
		</div>
		<div>
			<span>감사합니다. 고객님의 주문이 완료되었습니다.</span> 
		</div>

		<div>주문 내역 및 배송에 관한 안내는 <a href="user_edit">Mypage</a> > <a href="user_order_list">나의 주문내역</a>에서 확인하실 수 있습니다.</div>
		
		<div>
			<span id="order_date">주문일자 : ${order_date}</span>
		</div>
		
		<div>
			<span id="order_num">주문번호 : ${order_num}</span>
		</div>					
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>