<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<<<<<<< HEAD
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
=======
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
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

	<!-- fullPage.js의 CSS :start -->
	<link rel="stylesheet" type="text/css" href="resources/javascript/fullPage.js-master/dist/fullpage.css" />
	<link rel="stylesheet" type="text/css" href="resources/javascript/fullPage.js-master/examples/examples.css" />
	<!-- fullPage.js의 CSS :end -->
	
	<style>
        body {
            padding-top : 100px;
        }
        .navbar-fixed-top{height:100px; padding-top:20px;}
        .thumbnail img{width:300px; height:300px; vertical-align:middle;}
        .jumbotron{height:450px;}
        
        <style>

	/* Style for our header texts
	* --------------------------------------- */
	h1{
		font-size: 5em;
		font-family: arial,helvetica;
		color: #fff;
		margin:0;
		padding:0;
	}

	/* Centered texts in each section
	* --------------------------------------- */
	.section{
		text-align:center;
		overflow: hidden;
	}

	#myVideo{
		position: absolute;
		right: 0;
		bottom: 0;
		top:0;
		right:0;
		width: 100%;
		height: 100%;
		background-size: 100% 100%;
 		background-color: black; /* in case the video doesn't fit the whole page*/
  		background-image: /* our video */;
  		background-position: center center;
  		background-size: contain;
   		object-fit: cover; /*cover video background */
   		z-index:3;
	}



	/* Layer with position absolute in order to have it over the video
	* --------------------------------------- */
	#section0 .layer{
		position: absolute;
		z-index: 4;
		width: 100%;
		left: 0;
		top: 43%;

		/*
		* Preventing flicker on some browsers
		* See http://stackoverflow.com/a/36671466/1081396  or issue #183
		*/
		-webkit-transform: translate3d(0,0,0);
		-ms-transform: translate3d(0,0,0);
		transform: translate3d(0,0,0);
	}

	/*solves problem with overflowing video in Mac with Chrome */
	#section0{
		overflow: hidden;
	}


	/* Bottom menu
	* --------------------------------------- */
	#infoMenu li a {
		color: #fff;
	}


	/* Hiding video controls
	* See: https://css-tricks.com/custom-controls-in-html5-video-full-screen/
	* --------------------------------------- */
	video::-webkit-media-controls {
	  display:none !important;
	}

	</style>

   	</style>
   	
  </head>

  <body>
  
  <!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/toolBar.jsp" /> --%>
  <!-- ToolBar End /////////////////////////////////////-->
    
    <!-- fullpage.js : start -->
    <div id="fullpage">
    
    	<!-- 첫번째 section : start -->
		<div class="section " id="section0">
			<!-- toolBar : start -->
			<jsp:include page="/layout/toolBar.jsp" />
			<!-- toolBar : end -->
			<video id="myVideo" loop muted data-autoplay>
				<source src="resources/javascript/fullPage.js-master/examples/imgs/flowers.mp4" type="video/mp4">
				<source src="resources/javascript/fullPage.js-master/examples/imgs/flowers.webm" type="video/webm">
			</video>
			<div class="layer">
				<h1>fullPage.js videos</h1>
			</div>
		</div>
		<!-- 첫번째 section : end -->
		
		<!-- 두번째 section : start -->
		<div class="section" id="section1">
			
		    <div class="container">
		      
		      <div class="page-header">
		        <h1 align="center">BEST</h1>
		      </div>
		      
		      <div class="row">
			  
				  <div class="col-xs-6 col-md-3">
				      <a href="#" class="thumbnail">
				      	<img src="../resources/images/layout/mbti.jpg" alt="...">
				    </a>
				  </div>
			  
				  <div class="col-xs-6 col-md-3">
				    <a href="#" class="thumbnail">
				      <img src="../resources/images/layout/meeting.jpg" alt="...">
				    </a>
				  </div>
			  
				  <div class="col-xs-6 col-md-3">
				    <a href="#" class="thumbnail">
				      <img src="../resources/images/layout/find.png" alt="...">
				    </a>
				  </div>
			  
				  <div class="col-xs-6 col-md-3">
				    <a href="#" class="thumbnail">
				      <img src="../resources/images/layout/chatting.jpg" alt="...">
				    </a>
				  </div>
			  
				</div>
				
		    </div>
		</div>
		<!-- 두번째 section : end -->
		
		<!-- 세번째 section : start -->
		<div class="section" id="section2">
			<h1>Lovely images <br />for a lovely page</h1>
		</div>
		<!-- 세번째 section : end -->
		
	</div>
	
	<script type="text/javascript" src="resources/javascript/fullPage.js-master/dist/fullpage.js"></script>
	<script type="text/javascript" src="resources/javascript/fullPage.js-master/examples/examples.js"></script>

	<script type="text/javascript">
	    var myFullpage = new fullpage('#fullpage', {
	        verticalCentered: true,
	        sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE']
	    });
	</script>
    <!-- fullpage.js : end -->
    
    <div class="jumbotron">
      <div class="container">
        <h1>우연	</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
      	
      </div>
    </div>
  
  
    <!-- thumnail -->
    <!-- <div class="container">
      <div class="page-header">
        <h1 align="center">BEST</h1>
      </div>
      <p class="lead"> <br/> </p>
    </div> -->
    
    <!-- Begin page content -->
    <!-- <div class="row">
	  <div class="col-xs-6 col-md-3">
	      <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/mbti.jpg" alt="...">
	    </a>
	  </div>
	  
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/meeting.jpg" alt="...">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/find.png" alt="...">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/chatting.jpg" alt="...">
	    </a>
	  </div>
	  
	</div> -->
    <!-- /.thumnail -->
    

	<!-- ToolBar Start /////////////////////////////////////-->
	<!-- <br/><br/><br/><br/><br/><br/> -->
	<jsp:include page="/layout/footer.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
    
  </body>
</html>
>>>>>>> refs/remotes/origin/master
