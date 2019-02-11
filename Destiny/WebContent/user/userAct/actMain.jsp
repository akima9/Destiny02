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
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
	
	
	
	<script>
	
	</script>
<!-- //All js -->
	
	
	<style>
		ul{
			margin : 0;
			padding : 0;
		}
		ul li{
			margin : 0;
			padding : 0;
			list-style-type : none;
		}
		
		.topImg{
			max-width : 100%;
			height : 400px;
			background-image : url("/resources/images/background/actBackground.jpg");
			background-position : center center;
			background-size : cover;
			background-repeat : no-repeat;
		}
		.topImg::after{
			content : "";
			background : rgba(0, 0, 0, 0.2);
			position : absolute;
			top : 0;
			left : 0;
			width : 100%;
			height : 400px;
		}
		.topImg h1{
			position : absolute;
			width : 100%;
			margin : 0;
			padding : 0;
			font-family: 'Nanum Myeongjo', serif;
			font-size : 60px;
			text-align : center;
			height : 400px;
			line-height : 450px;
			color : white;
			z-index : 99;
			
		}
		
		
		.inner{
			text-align:center;
		}
		.user-act-top{
			overflow:hidden;
			display:inline-block;
		}
			.user-act-top li{
				float : left;
				padding:1em;
				width : 300px;
				height : 300px;
				text-align:center;
				border:3px solid #fd5d7c;
				border-radius:100%;
				margin : 0 30px 30px 0;
				position : relative;
			}
			.user-act-top li:last-child{
				margin-right : 0px;
			}
			.user-act-top a{
				display : inline-block;
				height : 300px;
				width : 300px;
				position : absolute;
				top : -3px;
				left : -3px;
				border-radius : 100%;
				line-height : 400px;
				text-decoration : none;
				color : #fd5d7c;
			}
		
		.user-act-bottom{
			overflow:hidden;
			display:inline-block;
		}
			.user-act-bottom li{
				float : left;
				padding:1em;
				width : 300px;
				height : 300px;
				text-align:center;
				border:3px solid #fd5d7c;
				border-radius:100%;
				margin : 0 30px 30px 0;
			}
			.user-act-bottom li:last-child{
				margin-right : 0px;
			}
			.user-act-bottom li .icon{
				margin:0 auto;
				width : 80px;
				height : 80px;
				margin-top : 40px;
				background : orange;
			}
			.user-act-bottom .button{
				margin-top : 50px;
				padding:0 1.5em;
			}
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- ���ι���̹��� : start -->
   	<div class="topImg">
		<h1>Ȱ������</h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<ul class="user-act-top">
				<li>
					<div class="icon" style="background:url('/resources/icon/post-it.png');background-size:cover;"></div>
					<a href="/act/getWriteCommunityList/${me.userId}">�ۼ��� �Խñ� ���</a>
				</li>
				<li>
					<!-- <div class="icon"></div> -->
					<a href="/act/getCommentListByWriter/${me.userId}">�ۼ��� ��� ���</a>
				</li>
				<li>
					<!-- <div class="icon"></div> -->
					<a href="/act/getOpenMeetingList/${me.userId}">������ ���� ���</a>
				</li>
			</ul>
			<ul class="user-act-bottom">
				<li>
					<!-- <div class="icon"></div> -->
					<a href="/act/getJoinMeetingList/${me.userId}">������ ���� ���</a>
				</li>
				<li>
					<!-- <div class="icon"></div> -->
					<a href="/act/getContactList/${me.userId}">����� ���� ���</a>
				</li>
			</ul>
			<%-- <div class="box alt">
				<div class="row 200% uniform ">
					 
					<div class="4u">
					<a href="/act/getWriteCommunityList/${me.userId}" class="button special">�ۼ��� ���ñ� ���</a>
					<br/>����� �ۼ��� ���ñ� ����� �����ϼ���.
					</div>

					<div class="4u">
					<a href="/act/getCommentListByWriter/${me.userId}" class="button special">�ۼ��� ��� ���</a>
					<br/>����� �ۼ��� ����� ��ƺ�����.
					</div>

					<div class="4u">
					<a href="/act/getOpenMeetingList/${me.userId}" class="button special">������ ���� ���</a>
					<br/>����� ������ ������ ����� �����ϼ���.
					</div>

					<div class="4u">
					<a href="/act/getJoinMeetingList/${me.userId}" class="button special">������ ���� ���</a>
					<br/>����� ������ ������ ����� �����ϼ���.
					</div>

					<div class="4u">
					<a href="/act/getContactList/${me.userId}" class="button special">����� ���� ���</a>
					<br/>����� �����ؿ� ������ ����� ���캸����.
					</div>

				</div>
			</div> --%>
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>