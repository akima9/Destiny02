<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="EUC-KR">
	
		<!-- ���� : http://getbootstrap.com/css/   -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		
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
		<!-- ToolBar Start /////////////////////////////////////-->
		  <jsp:include page="/layout/toolBar.jsp" />
	  	<!-- ToolBar End /////////////////////////////////////-->
		<h1>FIND Mainȭ��</h1>
	
		<a href="#">�̻��� ã��</a>
		<a href="#">���� ã��</a>
	
	
		
	</body>
</html>