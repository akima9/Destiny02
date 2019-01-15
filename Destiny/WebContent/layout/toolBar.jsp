<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
   
   <script type="text/javascript">
		$(function() {
			$("a[href='#' ]:contains('우리들의 연결고리')").on("click", function() {
				self.location = "../index.jsp"
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
			$("a[href='#' ]:contains('login')").on("click", function() {
				self.location = "/user/login"
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
			
			
		});
	</script>
	
	<style>
        body {
            padding-top : 100px;
        }
        .navbar-fixed-top{height:100px; padding-top:20px;}
        .navbar-nav-left{text-align:right;}
   	</style>

	<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <!-- <span class="sr-only">Toggle navigation</span> -->
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">우리들의 연결고리</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <!-- <li class="active"><a href="#">Home</a></li> -->
            <li><a href="#">Meeting</a></li>
            <li><a href="#">Chatting</a></li>
            <li><a href="#">Place</a></li>
            <!-- <li><a href="#">맛집정보</a></li>
            <li><a href="#">연애조언</a></li> -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Story <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">RestaurantInfo</a></li>
                <li><a href="#">LoveAdvice</a></li>
              </ul>
            </li>
            <li><a href="#">Notice</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          	<c:if test="${me == null}">
	            <li><a href="#">login</a></li>
	            <li><a href="#">join</a></li>
            </c:if>
            <c:if test="${me != null}">
				<li><a href="#">MyPage</a></li>
				<li><a href="#">logout</a></li>
			</c:if>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

	