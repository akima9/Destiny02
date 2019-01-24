<<<<<<< HEAD
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

<body class="subpage">
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			
			<!-- Image -->
			<h3>Image</h3>
			<div class="box alt">
				<div class="row 50% uniform">
					<div class="6u"><span class="image fit"><img src="/resources/images/find/findUser.jpg" alt="" /></span></div>
					<div class="6u$"><span class="image fit"><img src="/resources/images/find/findMeeting.jpg" alt="" /></span></div>
				</div>
			</div>
			<div class="box alt">
				<div class="row 50% uniform align-center">
					<div class="6u"><a href="#" class="button special" name="findUser">이상형찾기</a></div>
					<div class="6u$"><a href="#" class="button" name="findMeeting">모임찾기</a></div>
				</div>
			</div>
			
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
	$(function(){
		// 내부에 스크립트 코드 추가
		
		$("a[name='findUser']").on("click", function() {
			self.location = "/find/selectUser"
		});
		$("a[name='findMeeting']").on("click", function() {
			self.location = "/find/selectMeeting"
		});
		
	})
		
	</script>
	<!-- //All js -->
	
</body>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		
		
		<title>mainFind</title>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
			$(function() {
				
				$("a[name='모임찾기']").on("click", function() {
					self.location = "/find/selectMeeting"
				});
				$("a[name='이상형 찾기']").on("click", function() {
					self.location = "/find/selectUser"
				});
			});
			
		</script>
		
		<style>
		
			a{color : black;}
			a:hover{text-decoration : none;}
			
			.wrap{
				display : block;
				width : 100%;
				height : auto;
				margin-top : 150px;
			}
			
			ul{
				padding-left : 0;
				overflow : hidden;
			}
			
			li{
				list-style-type : none;
			}
			
			li:first-child{
				float : left;
			}
			
			li:last-child{
				float : right;
			}
			
			.search-giyong a{
				display : block;
				width : 500px;
				height : 500px;
				line-height : 500px;
				text-align : center;
				font-weight : bold;
				font-size : 50px;
				color : white;
			}
			
			.search-giyong li:first-child {
				background : url("../resources/images/find/findMeeting.jpg") no-repeat;
				background-position : 90%;
				background-size : cover;
			}
			
			.search-giyong li:last-child {
				background : url("../resources/images/find/findUser.jpg") no-repeat;
				background-position : 75%;
				background-size : cover;
			}
			
			.search-giyong li{
				display : block;
			}
			
			.search-giyong span{
				font-weight : lighter;
			}
			
		</style>
	   	
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		  <jsp:include page="/layout/toolBar.jsp" />
	  	<!-- ToolBar End /////////////////////////////////////-->
		<!-- <h1>FIND Main화면</h1> -->
		
		<div class="container">
			
			<div class="wrap">
			
				<ul class="search-giyong">
					<li>
						<a href="#" name="모임찾기">
							모임<span>찾기</span>
					  	</a>
					</li>
					<li>
						<a href="#" name="이상형 찾기">
							이상형 <span>찾기</span>
					  	</a>
					</li>
				</ul>
			
			</div>
		</div>
		
		
	
	
		
	</body>
>>>>>>> refs/remotes/origin/master
</html>