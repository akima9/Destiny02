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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		
		
		
	</script>
<!-- //All js -->
	
	
	<style>
		body {
            padding-top : 50px;
        }
	</style>

</head>

<body class="subpage">	


<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<h3>가입 거절 사유</h3>
			<form class="form-horizontal">
				<div class="row uniform">
				 
				 <div class="12u">
					<label for="prodDetail">거절 사유를 입력해주세요</label>
					  <textarea name="reasonNo"  cols="25" rows="25" >
					  </textarea>
				 </div>
				  

					<ul class="actions small">	
					  <li><a class="btn btn-primary btn" href="/act/judgmentApply/no/${meetingNo}/${meeting.meetingMasterId}" role="button" id="applyNO">가입 &nbsp;거절</a></li>
					</ul>


				</div>

			</form>
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->


	
	
</body>
</html>