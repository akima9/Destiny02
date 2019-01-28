<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
	$(function() {
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 //$("form").attr("method" , "POST").attr("action" , "/user/sendLetter").submit();
			 var sender = $("input[id='sender']").val();
			 
			 self.location = "/letter/sendLetterView/"+sender;
		});
	});
	
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body class="subpage">	
	
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
		<h3>쪽지 main</h3>
		<br/>
			<div class="box alt">
				<div class="row 50% uniform">
				
					<div class="4u">
					<p style="font-size:120%; color:black;">
					<a href="/letter/getLetterList">받은 쪽지함</a>
					<br/></div>

					<div class="4u">
					<p style="font-size:120%; color:black;">
					<a href="/letter/sendLetterList">보낸 쪽지함</a>
					<br/></div>

				</div>
			</div>
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	
	
	
	
</body>
</html>