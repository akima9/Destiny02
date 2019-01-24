<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("a[href='#' ]:contains('우연')").on("click", function() {
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

<header id="header">
	<div class="inner">
		<a href="#" class="logo"><strong>우연</strong></a>
		<!-- header 수정 후엔 footer.jsp에 #navepanel도 수정해주기 -->
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

