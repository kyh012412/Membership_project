<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head data-id="board">
	<meta charset="UTF-8">
	<title>게시글 상세보기~</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_css.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/default_js.js"></script>
	<style>
	.reply_div{
		overflow: auto;
		width: 80%;
		
	}
	.user_info_div{
		overflow: auto;
	}
	
	.user_photo{
		float:right;
		padding-right: 5%;
	}
	.user_image{
		overflow: auto;
		width: 100px; 
		height: 100px;
	}
	</style>
	<jsp:include page="/WEB-INF/views/login_check.jsp" />
</head>
<body>
	<div id="header_bar"></div>
	
	<div>
		<input type="hidden" id="b_idx" value="${vo.b_idx}">
		<input type="hidden" id="m_idx" value="${id.m_idx}">
		<div id="id1">
			<table border="1" align="center">
				<caption>:::게시글 상세보기:::</caption>
				<tr>
					<th>제목</th>
					<td>${vo.b_title}</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td>${vo.m_username}</td>
				</tr>
				
				<tr>
					<th>작성일</th>
					<td>${vo.b_posted_date}</td>
				</tr>
				
				<tr>
					<th>조회수</th>
					<td>${vo.b_read_hit}</td>
				</tr>
				<tr>
					<th>좋아요 !</th>
					<td><input type="text" id="b_like_count" value="${vo.b_like_count}"></td>
					<td>
						<c:choose>
							<c:when test="${vo.bl_isliked eq '0'}">
								<input type="button" class="board_like_button" value="좋아요" onclick="board_like('${vo.b_idx}')">
							</c:when>
							
							<c:when test="${vo.bl_isliked eq '1'}">
								<input type="button" class="board_like_button" value="좋아요 해제" onclick="board_like('${vo.b_idx}')">
							</c:when>
							
							<c:otherwise>
								${vo.bl_isliked }
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				
				<c:if test="${id.m_ismaster eq '1'}">
					<tr>
						<th>ip</th>
						<td>${vo.b_ip}</td>
					</tr>
				</c:if>
				
				<tr>
					<td colspan="2" width="500px" height="200px">
						<c:if test="${not empty vo.b_filename and vo.b_filename ne 'no_file'}">
							<img src="${pageContext.request.contextPath}/resources/upload/board/${vo.b_filename}" width="200">
							<br>
						</c:if>
						${vo.b_content }
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<!-- 목록으로 -->
						<img src="resources/img2/btn_list.gif" onclick="location.href='board'">
						<!-- 삭제 -->
						<img src="resources/img2/btn_delete.gif" onclick="delete_board_post();">
					</td>
				</tr>
			</table>
		</div>
		
		<div id="reply_form" align="center">
			<form>
				<input type="hidden" name="b_idx" value="${vo.b_idx}">
			
				<textarea name="r_content" style="display:block; width: 60%"></textarea>
						
				<input type="button" value="답글 작성 완료" onclick="send_reply(this.form);">
			</form>
	
			<c:forEach var="i" items="${reply_list}">
				<div class="reply_div">
					<div class="user_info_div">
						<div class="user_photo">
							<img class="user_image" src="${pageContext.request.contextPath}/resources/upload/user/${i.m_photo_name}" alt="이미지 유실">
						</div>
						
						<span>${i.m_username}</span>
						
						<div>${i.r_date}</div>
					</div>
					
					${i.r_content}<br>
					
					누적 좋아요 : <input id="r_like_count_${i.r_idx}" type="text" value="${i.r_like_count}"><br>
					
					<input id="rl_isliked_${i.r_idx}" type="button" value="${i.rl_isliked}" onclick="reply_like(${i.r_idx})">
					
					<input id="r_del_button_${i.r_idx}" type="button" value="댓글 삭제" onclick="delete_reply(${i.r_idx})">
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="footer_bar"></div>
</body>
</html>