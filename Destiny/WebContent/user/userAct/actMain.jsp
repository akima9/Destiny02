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
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
	
	
	
	<script>
	
	</script>
<!-- //All js -->
	
	
	<style>
		body{
			background-image : url("/resources/images/layout/12345.jpg");
			background-size : contain;
		}
		
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
		<h3 style="font-family: 'Do Hyeon', sans-serif; font-size: 50px">활동관리</h3>
		
			<div class="box alt">
				<div class="row 200% uniform ">
					 
					<div class="4u" style="font-size:100%; color:white;">
					<a href="/act/getWriteCommunityList/${me.userId}" class="button special">작성한 개시글 목록</a>
					<br/>당신이 작성한 개시글 목록을 관리하세요.
					</div>

					<div class="4u" style="font-size:100%; color:white;">
					<a href="/act/getCommentListByWriter/${me.userId}" class="button special">작성한 댓글 목록</a>
					<br/>당신이 작성한 댓글을 모아보세요.
					</div>

					<div class="4u" style="font-size:100%; color:white;">
					<a href="/act/getOpenMeetingList/${me.userId}" class="button special">개설한 모임 목록</a>
					<br/>당신이 개설한 모임의 목록을 관리하세요.
					</div>

					<div class="4u" style="font-size:100%; color:white;">
					<a href="/act/getJoinMeetingList/${me.userId}" class="button special">가입한 모임 목록</a>
					<br/>당신이 가입한 모임의 목록을 관리하세요.
					</div>

					<div class="4u" style="font-size:100%; color:white;">
					<a href="/act/getContactList/${me.userId}" class="button special">성사된 만남 목록</a>
					<br/>당신이 맞이해온 만남의 기록을 살펴보세요.
					</div>

				</div>
			</div>
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<a href="https://kor.pngtree.com/freebackground/city-lights-neon-background_109270.html" style="color:gray">배경사진 출처 pngtree.com</a>
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>