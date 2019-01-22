<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="EUC-KR">
	
		<!-- 참조 : http://getbootstrap.com/css/   -->
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
				
				$("a[href='#' ]:contains('이상형 찾기')").on("click", function() {
					self.location = "/find/selectUser"
				});
				$("a[href='#' ]:contains('모임 찾기')").on("click", function() {
					self.location = "/find/selectMeeting"
				});
			});
			
		</script>
		
		<style>
			.box{ width: 100%; height: 700px; margin-bottom: 10px; background: linear-gradient( to right, #dae2f8, #d6a4a4 ); }
			.left-box {width: 50%; float: left;}
			.right-box {width: 50%; float: right;}
		</style>
	   	
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		  <jsp:include page="/layout/toolBar.jsp" />
	  	<!-- ToolBar End /////////////////////////////////////-->
		<h1>FIND Main화면</h1>
		
		<div class="box">
			<!-- <div class='left-box'>
				<a href="#">이상형 찾기</a>
			</div>
			<div class='right-box'>
				<a href="#">모임 찾기</a> 
			</div> -->
		</div>
		
		
	
	
		
	</body>
</html>