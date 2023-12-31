<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="home">
	<meta charset="UTF-8">
	<title>Welcome! This`s Newjeans_membership_homepage</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js" defer></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/http_request.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/home/home.js"></script>
</head>
<body>
	<div id="header_bar"></div>
	<div id="home_div">
		<div id="child_home">			
			<div id="photo_banner">
				<div class="left">
					<input type="hidden" value="LEFT"> <!-- 배너 슬라이드 : 왼쪽 -->
				</div>
					<div class="photo_main">
						<div id="buy_button" onclick="shop_payment()">
							<br>
							<h3>New Jeans Membership </h3>
							<br><br>
							<h5>가입하기 </h5>
						</div>
						<div class="img_container">
							<div class="img_slide">
								<img class="banner_img" 
								src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans1.jpg"  
								alt="이미지 유실">
							</div>
							<div class="img_slide">
								<img class="banner_img" 
								src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans6.jpg"  
								alt="이미지 유실">
							</div>
							<div class="img_slide">
								<img class="banner_img" 
								src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans3.jpg"  
								alt="이미지 유실">
							</div>
							<div class="img_slide">
								<img class="banner_img" 
								src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans4.jpg"  
								alt="이미지 유실">
							</div>
							<div class="img_slide">
								<img class="banner_img" 
								src="${pageContext.request.contextPath}/resources/img/photo_banner/membership.jpg"  
								alt="이미지 유실">
							</div>
							<div class="img_slide">
								<img class="banner_img" 
								src="${pageContext.request.contextPath}/resources/img/photo_banner/newjeans0.jpg"  
								alt="이미지 유실">
							</div>
						</div>
					</div>
				<div class="right">
					<input type="hidden" value="RIGHT"> <!-- 배너 슬라이드 :  -->
				</div>
			</div> <!-- photo_banner_div -->
			<!-- 스토리-->
			<div class="story">
				<div class="story_container">
					<c:if test="${membervo.m_ismembership eq '1' }">
					<c:forEach var="svo" items="${svo_list}" varStatus="status" end="4">
							<div  class="story_content"  onclick="location.href='story?s_idx=${svo.s_idx}'">
								<img class="story_img" 
								src="${pageContext.request.contextPath}/resources/upload/story/${svo.s_filename }"
								onclick="location.href='story'">
							</div>
					</c:forEach>
					</c:if>
					<c:if test="${empty membervo or membervo.m_ismembership eq '0' }">
						<c:forEach begin="1" end="${s_count }">
						<!-- 비로그인 및 멤버십 결제 회원이 아닐 경우 보여줄 스토리 사진 -->
								<div  class="story_content"  >
									<img class="story_img"
									src="${pageContext.request.contextPath}/resources/img/photo_banner/story_lock.svg"
									onclick="location.href='login_form'">
								</div> 
						</c:forEach> 
					</c:if>
				</div>
			</div> <!-- story div -->
			
			<!-- unfixed 관리자 피드 -->
			<div class="board_div">
			<input id="priority" type="hidden" value="${priority}">
			<div class="board_view_list">
				<div class="board_container">
					<!-- 비로그인 및 구독하지 않은 사람의 경우 공지사항만 볼 수 있도록 -->
					<c:if test="${empty membervo or membervo.m_ismembership eq '0' }">
					<c:forEach var="fixed" items="${fixed_list }" end="4">
						<div class="board_feed" onclick="location.href='board_view?b_idx=${board.b_idx}'">
							<c:choose>
								<c:when test="${not empty board.b_filename and board.b_filename ne 'no_file' }">
									<img class="board_img"
									 src="${pageContext.request.contextPath}/resources/upload/board/${board.b_filename}"
									 onclick="location.href='board_view?b_idx=${i.b_idx}'"
									 alt="${pageContext.request.contextPath}/resources/upload/board/newjeans_rabbit.jpeg"> 
							 		<br>
									<div class="board_text">${board.b_content }</div>
									<div class="board_name">NewJeans</div>
								</c:when>
								<c:otherwise>
									<img class="board_img"
									 src="${pageContext.request.contextPath}/resources/upload/board/newjeans_rabbit.jpeg"
									 onclick="location.href='board_view?b_idx=${i.b_idx}'"> 
							 		<br>
									<div class="board_text">${board.b_content }</div>
									<div class="board_name">NewJeans</div>
							</c:otherwise>
							</c:choose>
							</div>
					</c:forEach>
					</c:if>
					<!-- 로그인 한 경우 관리자의 글도 볼 수 있도록 -->
					<c:if test="${membervo.m_ismembership eq '1' }">
					<c:forEach var="board" items="${unfixed_master_list }" end="4">
						<div class="board_feed" onclick="location.href='board_view?b_idx=${board.b_idx}'">
							<c:choose>
								<c:when test="${not empty board.b_filename and board.b_filename ne 'no_file' }">
									<img class="board_img"
									 src="${pageContext.request.contextPath}/resources/upload/board/${board.b_filename}"
									 onclick="location.href='board_view?b_idx=${i.b_idx}'"
									 alt="${pageContext.request.contextPath}/resources/upload/board/newjeans_rabbit.jpeg"> 
							 		<br>
									<div class="board_text">${board.b_content }</div>
									<div class="board_name">NewJeans</div>
								</c:when>
								<c:otherwise>
									<img class="board_img"
									 src="${pageContext.request.contextPath}/resources/upload/board/newjeans_rabbit.jpeg"
									 onclick="location.href='board_view?b_idx=${i.b_idx}'"> 
							 		<br>
									<div class="board_text">${board.b_content }</div>
									<div class="board_name">NewJeans</div>
							</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
					</c:if>
				</div>
			</div> <!-- board_view_list -->
		</div><!-- <div id="board"> -->
			
		</div><!-- child home -->
	</div> <!--</div id="home_div"> -->
	
	<div id="footer_bar"></div>
</body>
</html>