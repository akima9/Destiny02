<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>

<!-- All js -->
<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>
<!-- //All js -->

<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet"> 
<!-- //All CSS Insert -->
</head>

	<script>
	(function(d, s, id){
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) {return;}
	    js = d.createElement(s); js.id = id;
	    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
	    fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'frogue-embed'));
	</script>

<style>
video{
	position : absolute;
	top : 0;
	left : 0;
	min-width : 100%;
	z-index : -1;
}

#linkmove{
	padding : 0 0 8em 0;
}

	#linkmove .flex div{
		padding : 3em;
		border : 2px solid #ffbcc7;
		border-radius : 25px;
	}
	#linkmove .flex h3{
		font-family: 'Nanum Myeongjo', serif;
	}
	#linkmove h2{
		font-family: 'Source Serif Pro', serif;
	}
	#linkmove .special{
		font-size : 0.2em;
	}

#communitymove{
	/* background : #ff8a2c; */
	background : #ffbcc7;
}
	#communitymove h3{
		color : #ff264a;
		font-weight : bold;
	}
	#communitymove p{
		color : #3e3e3e;
	}

.ment{
	text-align : center;
}
	
</style>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- contents /////////////////////////////////////////////////////////////////// -->
	
	<!-- 메인 이미지부분 start -->
	<section id="banner">
		<video autoplay loop>
			<source src="/resources/images/background/spring.mp4" type="video/mp4">
		</video>
		
		<div class="ment">
			<p>첫번째 만남은 우연일지라도<br> 두번째 만남은 흘러갈지도 남을지도 모르는 인연이다.</p>
		</div>
				
	</section>
	<!-- 메인 이미지부분 end -->
	
	<!-- 링크이동 start -->
	<section id="linkmove" class="wrapper align-center">
		
		<h2>BEST<span class="special">●</span></h2>
		
		<div class="inner">
		
			<div id="frogue-container" class="position-right-bottom"
			      data-color="#555a9c"
			      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
			      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
			      data-init-key="value"
			      ></div>
			
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
	<section id="communitymove" class="wrapper align-center">
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
	
</body>
</html>