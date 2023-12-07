<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="module" src="${pageContext.request.contextPath}/resources/js/shop_js/shopping_cart.js" defer></script>
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/shop/shopping_cart.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="shopping_cart_div">
		<div id="cart_item_list_div"></div>
		<div id="total_div"></div>
	</div>
</body>
</html>