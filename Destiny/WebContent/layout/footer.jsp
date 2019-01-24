<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<footer id="footer">
		<div class="inner">
			<h3>FOOTER</h3>

			<div class="copyright">
				� Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.
			</div>
		</div>
	</footer>
	
	
	<div id="navPanel">
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Home</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Meeting</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Chatting</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Place</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">RestaurantInfo</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">LoveAdvice</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Notice</a>
		<c:if test="${me.userGrade == 'ADM'}">
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Complain</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">UserList</a>
		</c:if>
		<c:if test="${me == null}">
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">login</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">join</a>
		</c:if>
		<c:if test="${me != null}">
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">MyPage</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">logout</a>
		</c:if>
		<a href="#navPanel" class="close" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></a>
	</div>
	<div class="nav_bg"></div>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리 footer</title>

<style>
        footer{color: #5a5a5a; background-color: #E6E6E6;}
   	</style>
   	
</head>
	<body>
	
		<footer class="footer">
		      <div class="container">
		      <p class="text-muted">========================================================================</p>
		        <p>예성 기용 보미 보름 주영</p>
		        <br/><br/><br/><br/><br/><br/>
		      </div>
		</footer>
	
	</body>
</html>
>>>>>>> refs/remotes/origin/master
