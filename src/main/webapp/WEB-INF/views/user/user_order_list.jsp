<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head data-id="user">
	<meta charset="UTF-8">
	<title>주문 내역</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/user/user_order_list.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	
	<div id="body_div">
		<!-- <input type="button" value="user_edit" onclick="location.href='user_edit'">
			user_order_list -->
		<div id="user_order_list_body">
			<div id="user_order_list_head">
				<div>주문내역</div>
			</div>
			<div id="user_order_list">
				<c:choose>
					<c:when test="${empty order_list}">
					<div id="none_order_list">
						주문 목록이 없습니다.
					</div>
					</c:when>
					<c:otherwise>	
						<c:forEach items="${order_list}" var="order_i">
							<div onclick="location.href='user_order_view?o_idx=${order_i.o_idx}'" class="order_div">
								<div class="order_list_o_idx">
									<div>
										<div>주문번호 ${order_i.o_idx}</div>									
									</div>					
									
									<div class="order_list_photo">
										<img class="order_photo" src="${pageContext.request.contextPath}/resources/upload/shop/${order_i.i_photo_name}">
									</div>
								</div>
								
								<div class="order_list_info">
									<div class="order_list_name">
										${order_i.i_names}
									</div>
									
									<div class="order_list_price">
										${order_i.o_sum}원 · ${order_i.o_count}개
									</div>
								</div>
								
								<div id="go_to_order_detail_list">상세보기 ></div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>