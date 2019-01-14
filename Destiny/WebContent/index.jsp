<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("a[href='#' ]:contains('맛집정보')").on("click", function() {
			self.location = "/info/listRestaurantInfo"
		});
		$("a[href='#' ]:contains('모임')").on("click", function() {
			self.location = "/meeting/listMeeting"
		});
		$("a[href='#' ]:contains('채팅')").on("click", function() {
			self.location = "/chatting/mainChatting"
		});
		$("a[href='#' ]:contains('내주변')").on("click", function() {
			self.location = "/find/mainFind"
		});
		$("a[href='#' ]:contains('로그인')").on("click", function() {
			self.location = "/user/login"
		});
		$("a[href='#' ]:contains('회원가입')").on("click", function() {
			self.location = "/user/addUser"
		});
		$("a[href='#' ]:contains('회원조회/수정')").on("click", function() {
			self.location = "/user/getUserView"
		});
		$("a[href='#' ]:contains('로그아웃')").on("click", function() {
			self.location = "/user/logout/${me.userId}"
		});
		
		
	});
</script>
</head>
<body>
	<h1>우리들의 연결고리</h1>
	<ul>
		<li><a href="#">모임</a></li>
		<li><a href="#">채팅</a></li>
		<li><a href="#">내주변</a></li>
		<li><a href="#">스토리</a></li>
		<li><a href="#">정보</a></li>
		<li><a href="#">맛집정보</a></li>
		<li><a href="#">연애조언</a></li>
		<li><a href="#">공지사항</a></li>
		<c:if test="${me == null}">
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</c:if>
		<c:if test="${me != null}">
			<li><a href="#">회원조회/수정</a></li>
			<li><a href="#">로그아웃</a></li>
		</c:if>
	</ul>
</body>
</html>