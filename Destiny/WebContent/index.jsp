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
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- contents /////////////////////////////////////////////////////////////////// -->
	
	<!-- 메인 이미지부분 start -->
	<section id="banner">
		<div class="inner"></div>
	</section>
	<!-- 메인 이미지부분 end -->
	
	<!-- 링크이동 start -->
	<section id="three" class="wrapper align-center">
		<div class="inner">
			<div class="flex ">
			
				<div>
					<span class="icon fa-car"></span>
					<h3>모임</h3>
					<p>Suspendisse amet ullamco</p>
				</div>
				<div>
					<span class="icon fa-camera"></span>
					<h3>MBTI</h3>
					<p>Class aptent taciti ad litora</p>
				</div>
				<div>
					<span class="icon fa-bug"></span>
					<h3>주변 찾기</h3>
					<p>Nulla vitae mauris non felis</p>
				</div>
				<div>
					<span class="icon fa-bug"></span>
					<h3>채팅</h3>
					<p>Nulla vitae mauris non felis</p>
				</div>

			</div>
		</div>
	</section>
	<!-- 링크이동 end -->
	
	<!-- Community start -->
	<section id="three" class="wrapper align-center">
		<div class="inner">
			<div class="flex flex-3">
				<article>
					<div class="image round">
						<img src="resources/css/images/pic01.jpg" alt="Pic 01" />
					</div>
					<header>
						<h3>Lorem ipsum<br /> dolor amet nullam</h3>
					</header>
					<p>Morbi in sem quis dui placerat ornare. Pellentesquenisi<br />euismod in, pharetra a, ultricies in diam sed arcu. Cras<br />consequat  egestas augue vulputate.</p>
					<footer>
						<a href="#" class="button">Learn More</a>
					</footer>
				</article>
				<article>
					<div class="image round">
						<img src="resources/css/images/pic02.jpg" alt="Pic 02" />
					</div>
					<header>
						<h3>Sed feugiat<br /> tempus adipicsing</h3>
					</header>
					<p>Pellentesque fermentum dolor. Aliquam quam lectus<br />facilisis auctor, ultrices ut, elementum vulputate, nunc<br /> blandit ellenste egestagus commodo.</p>
					<footer>
						<a href="#" class="button">Learn More</a>
					</footer>
				</article>
				<article>
					<div class="image round">
						<img src="resources/css/images/pic02.jpg" alt="Pic 02" />
					</div>
					<header>
						<h3>Sed feugiat<br /> tempus adipicsing</h3>
					</header>
					<p>Pellentesque fermentum dolor. Aliquam quam lectus<br />facilisis auctor, ultrices ut, elementum vulputate, nunc<br /> blandit ellenste egestagus commodo.</p>
					<footer>
						<a href="#" class="button">Learn More</a>
					</footer>
				</article>
			</div>
		</div>
	</section>
	<!-- Community end -->
		
	<!-- //contents//////////////////////////////////////////////////////////////// -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<!-- //All js -->
	
</body>
</html>