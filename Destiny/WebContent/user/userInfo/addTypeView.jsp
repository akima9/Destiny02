<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�츮���� �����</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet"> 

<!-- <link rel="stylesheet" href="https://www.16personalities.com/css/main-v6.css"> -->
<!-- //All CSS Insert -->


<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">

		
		
	</script>
	<!-- //All js -->
	
		<style>

		body{
			position : relative;
			font-family: 'Nanum Myeongjo', serif;
		}
		.container{
			font-weight : 700;
		}
		.tumTitle{
			font-weight : 700;
		}
	
		.topImg{
			display : block;
			position : absolute;
			top : 0;
			background-image : url("/resources/images/background/complainbg.jpg");
			background-repeat : no-repeat;
			background-position : center -280px;
			background-size : cover;
			width : 100%;
			height : 400px;
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
			line-height : 450px;
			width : 100%;
			text-align : center;
			color : white;
			z-index : 99;
			font-size : 60px;
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		.wrap{
			margin-top : 400px;
		}
		
		li{
			list-style-type : none;
		}
		
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -30px;
			margin-bottom : 60px;
		}
		
		.smallNavi li{
			float : left;
			margin-right : 20px;
			margin-top : 8em;
		}
		
		.homeImg{
			margin-top : -2px;
		}
		
		section.wrapper, article.wrapper {
	    	padding: 500px 0;
		}
		
		.flex div{
			padding : 3em;
			border : 2px solid #ffbcc7;
			border-radius : 25px;
		}
		.flex h3{
			font-family: 'Nanum Myeongjo', serif;
		}
		
		img {
		    margin-top: 20px;
		    width: 185px;
		    vertical-align: middle;
		}
	
	</style>
	
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>MBTI <span class="slim"> Type</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<div class="row">
				<div class="3u 12u$(small)">
					<img src="https://storage.googleapis.com/neris/public/images/types/intj-architect.svg">
					<h4>�������ֵ��� ��������</h4>
                    <h5>INTJ (-A/-T)</h5>
                    <div class="type-snippet">������ ǳ���ϸ� ö��ö���� ��ȹ�� ����� ��������.</div>
				</div>
				<div class="3u 12u$(small)">
					<img src="https://storage.googleapis.com/neris/public/images/types/intp-logician.svg">
                    <h4>�������� �������</h4>
                    <h5>INTP (-A/-T)</h5>
                    <div class="type-snippet">���Ӿ��� ���ο� ���Ŀ� �񸻶� �ϴ� ���Ű���.</div>
				</div>
				<div class="3u 12u$(small)">
					<img src="https://storage.googleapis.com/neris/public/images/types/entj-commander.svg">
                    <h4>������� ����ڡ�</h4>
                    <h5>ENTJ (-A/-T)</h5>
                    <div class="type-snippet">����ϸ鼭�� ������ ǳ���� ���� ������ �����ڷ� �پ��� ����� ����ϰų� ����ġ ���� ��� ���ο� ����� â���ϴ� ������.</div>
				</div>
				<div class="3u 12u$(small)">
					<img src="https://storage.googleapis.com/neris/public/images/types/entp-debater.svg">
                    <h4>���߰ſ� ������ ���� ���а���</h4>
		            <h5>ENTP (-A/-T)</h5>
		            <div class="type-snippet">������ ������ �η������� �ʴ� �ȶ��� ȣ�����.</div>
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