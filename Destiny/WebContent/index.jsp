<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�츮���� �����</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("a[href='#' ]:contains('��������')").on("click", function() {
			self.location = "/info/listRestaurantInfo"
		});
		$("a[href='#' ]:contains('����')").on("click", function() {
			self.location = "/meeting/listMeeting"
		});
		$("a[href='#' ]:contains('ä��')").on("click", function() {
			self.location = "/chatting/mainChatting"
		});
		$("a[href='#' ]:contains('���ֺ�')").on("click", function() {
			self.location = "/find/mainFind"
		});
		$("a[href='#' ]:contains('�α���')").on("click", function() {
			self.location = "/user/login"
		});
		$("a[href='#' ]:contains('ȸ������')").on("click", function() {
			self.location = "/user/addUser"
		});
		
		
	});
</script>
</head>
<body>
	<h1>�츮���� �����</h1>
	<ul>
		<li><a href="#">����</a></li>
		<li><a href="#">ä��</a></li>
		<li><a href="#">���ֺ�</a></li>
		<li><a href="#">���丮</a></li>
		<li><a href="#">����</a></li>
		<li><a href="#">��������</a></li>
		<li><a href="#">��������</a></li>
		<li><a href="#">��������</a></li>
		<li><a href="#">�α���</a></li>
		<li><a href="#">ȸ������</a></li>
	</ul>
</body>
</html>