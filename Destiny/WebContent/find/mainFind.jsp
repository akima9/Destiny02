<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>mainFind</title>

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				
				$("a[href='#' ]:contains('�̻��� ã��')").on("click", function() {
					self.location = "/find/selectUser"
				});
				$("a[href='#' ]:contains('���� ã��')").on("click", function() {
					self.location = "/find/selectMeeting"
				});			
			});
		</script>
	</head>

<body>
	<h1>FIND Mainȭ��</h1>

	<a href="#">�̻��� ã��</a>
	<a href="#">���� ã��</a>

</body>
</html>