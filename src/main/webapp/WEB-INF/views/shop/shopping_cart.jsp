<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#shopping_cart_item{background-color: skyblue;}
			#buttonbar{background-color: pink;}
		</style>
<<<<<<< Updated upstream
=======
		<script>
			function select_all(select_all)  {
				const checkboxes = document.getElementsByName('item_checkbox');
				  
				checkboxes.forEach((checkbox) => {
				checkbox.checked = select_all.checked;
				})
			}
			
			function select_option_fn(f){
				const i_name = f.i_name.value.trim();
				const url = "select_option";
				
				const param = {
					"i_name": encodeURIComponent(i_name),
				};
					
				sendRequest(url, param, resultFn, "post");
			}
			
			function resultFn(...args){
				let res = args[0].param;

				if(res != null){
					alert(res)
				} 
			}
		</script>
>>>>>>> Stashed changes
	</head>
	<body>
		<input type="checkbox">
		<div>
			<!-- 나중에 db 연결해서 이름, 가격 json으로 -->
			<c:forEach var="vo" items="${items}">
				<div id=shopping_cart_item>
				<input type="checkbox">
				<img src="resources/img/idcheck_but02"><br>
				<a>상품 이름</a><br>
				상품가격
				</div>
			</c:forEach>	
		</div>
		<p>총가격</p>
		<div id=buttonbar>
			<input type="button" value="결제하기" onclick="">
			<input type="button" value="취소하기" onclick="">			
		</div>
	</body>
</html>