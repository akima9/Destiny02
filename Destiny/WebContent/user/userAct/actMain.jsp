<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
	
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body class="subpage">	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
		<h3>Ȱ������</h3>
		<br/>
			<div class="box alt">
				<div class="row 50% uniform">
					
					<div class="4u">
					<p style="font-size:120%; color:black;">
					<a href="/act/getWriteCommunityList/${me.userId}">�ۼ��� ���ñ� ���</a>
					<br/>����� �ۼ��� ���ñ� ����� �����ϼ���.</p>
					</div>

					<div class="4u">
					<p style="font-size:120%; color:black;">
					<a href="/act/getCommentListByWriter/${me.userId}">�ۼ��� ��� ���</a>
					<br/>����� �ۼ��� ����� ��ƺ�����.
					</div>

					<div class="4u">
					<p style="font-size:120%; color:black;">
					<a href="/act/getOpenMeetingList/${me.userId}">������ ���� ���</a>
					<br/>����� ������ ������ ����� �����ϼ���.
					</div>

					<div class="4u">
					<p style="font-size:120%; color:black;">
					<a href="/act/getJoinMeetingList/${me.userId}">������ ���� ���</a>
					<br/>����� ������ ������ ����� �����ϼ���.
					</div>

					<div class="4u">
					<p style="font-size:120%; color:black;">
					<a href="/act/getContactList/${me.userId}">����� ���� ���</a>
					<br/>����� �����ؿ� ������ ����� ���캸����.
					</div>

				</div>
			</div>
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>