<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$("a[href='#' ]:contains('�쿬')").on("click", function() {
			self.location = "/index.jsp"
		});
		$("a[href='#' ]:contains('Meeting')").on("click", function() {
			self.location = "/meeting/listMeeting"
		});
		$("a[href='#' ]:contains('Chatting')").on("click", function() {
			self.location = "/chatting/mainChatting"
		});
		$("a[href='#' ]:contains('Place')").on("click", function() {
			self.location = "/find/mainFind"
		});
		$("a[href='#' ]:contains('RestaurantInfo')").on("click", function() {
			self.location = "/info/listRestaurantInfo"
		});
		$("a[href='#' ]:contains('Complain')").on("click", function() {
			self.location = "/complain/listComplain"
		});
		$("a[href='#' ]:contains('UserList')").on("click", function() {
			self.location = "/user/listUser"
		});
		$("a[href='#' ]:contains('login')").on("click", function() {
			//self.location = "/user/login"
			self.location = "/user/userInfo/login.jsp"
		});
		$("a[href='#' ]:contains('join')").on("click", function() {
			self.location = "/user/addUser"
		});
		$("a[href='#' ]:contains('MyPage')").on("click", function() {
			self.location = "/user/getUserView"
		});
		$("a[href='#' ]:contains('logout')").on("click", function() {
			self.location = "/user/logout/${me.userId}"
		});
		/* $("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
			$("#my-dialog,#dialog-background").toggle();
		}); */
		
	});
</script>
<style>
	strong{
		font-family: 'Nanum Myeongjo', serif;
	}
	#nav{
		font-family: 'Source Serif Pro', serif;
	}
</style>
<header id="header">
	<div class="inner">
		<a href="#" class="logo"><strong>�쿬</strong></a>
		<!-- header ���� �Ŀ� footer.jsp�� #navepanel�� �������ֱ� -->
		<nav id="nav">
			<a href="#" >Meeting</a>
			<a href="#">Chatting</a>
			<a href="#">Place</a>
			<a href="#">RestaurantInfo</a>
			<a href="#">LoveAdvice</a>
			<a href="#">Notice</a>
			
			<c:if test="${me.userGrade == 'ADM'}">
				<a href="#">Complain</a>
				<a href="#">UserList</a>
			</c:if>
			
			<c:if test="${me == null}">
				<a href="#">login</a>
				<a href="#">join</a>
			</c:if>
			<c:if test="${me != null}">
				<a href="#">MyPage</a>
				<a href="#">logout</a>
			</c:if>
		</nav>
		<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	</div>
</header>

