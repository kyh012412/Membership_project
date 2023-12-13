<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>주문 상세 내역</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_order_view.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="body_div">
		<div id="user_order_view">
			<c:forEach items="${order_detail_list}" var="od">
				<div id="div_${od.od_idx}" class="od_div">
					<div class="r5c1"></div>
					<div class="od_number_div">
						주문 상세 번호 <br>
						${od.od_idx}
					</div> 					
					<div class="r5c1"></div>
					
					<div class="r5c4">
						<img class="order_photo" src="${pageContext.request.contextPath}/resources/upload/shop/${od.i_photo_name}">
					</div>
					
					<div class="r1c4"></div>
					
					<div class="r1c4">
						(${od.i_color}) ${od.i_name}
					</div>
					
					<div class="r1c4"></div>
					
					<div class="r1c4"> 
						 ${od.i_price}원 · ${od.od_count}개
					</div>
				</div>
			</c:forEach>
			<div class="order_info">
				결제 정보 : KAKAO PAY <br/>
				결제 수단 : KAKAO PAY <br/>
				결제 금액 : ${ordervo.o_sum}<br/>
				주문자 정보 : ${id.m_username} <br/>
				이름 : ${id.m_name}<br/>
				번호 : ${id.m_tel}<br/>
				주소 : ${id.m_addr2}${id.m_addr3}<br/>
				우편번호 : ${id.m_addr1}
			</div>
			<div class="buttons">
				<input type="button" value="뒤로가기" onclick="location.href='user_order_list'">
			</div>
		</div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>

