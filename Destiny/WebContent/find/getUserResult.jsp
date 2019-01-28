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
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
	$(function(){
		// 내부에 스크립트 코드 추가
		
		$( "button:contains('이전')" ).on("click" , function() {
			 //history.go(-1);
			self.location = "/find/mainFind.jsp"
		});
			
		$("a[href='#' ]:contains('YES')").on("click", function() {
			self.location = "../chatting/mainChatting.jsp"
		});
		
	})
		
	</script>
	<!-- //All js -->

<style>
	.box > p{text-align:center;}
	.resultCount{font-size: 25px; font-weight: bold; color: #FA5858;}
</style>

</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			
			<!-- Box -->
			<h3>이상형 찾기 결과</h3>
			<div class="box">
				<p>회원님이 찾는 조건의 회원 수는</p>
				<p><span class="resultCount">${totalCount}명</span> 입니다.</p>
				<p> 그중 현재 접속중인 회원은</p>
				<p><span class="resultCount"> ${numberOfLogin}명</span> 입니다.</p>
				<hr/>
				<p>채팅을 시작하겠습니까?</p>
				
				<div class="box alt">
					<div class="row 50% uniform align-center">
						<div class="12u"><a href="#" class="button special" name="findUser">YES</a></div>
					</div>
				</div>	
			</div>
			
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
</body>
</html>