<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<input type="button" value="user_edit" onclick="location.href='user_edit'">
	user_post_list
	<div id="user_post_list">
		<c:forEach var="list" items="${list}">
			<div>
				<div>${list.b_title}</div>
				<div>${list.b_content}</div>
				<div>${list.b_posted_date}</div>
				<div>${id.m_name}</div>
			</div>
			<hr>
		</c:forEach>
	</div>
</body>
</html>