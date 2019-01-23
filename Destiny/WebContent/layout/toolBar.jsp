<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>



	<script type="text/javascript">
	
		$(function() {
			$("a[href='#' ]:contains('우리들의 연결고리')").on("click", function() {
				self.location = "/index.jsp"
			});
			$("a[href='#' ]:contains('Meeting')").on("click", function() {
				self.location = "/meeting/listMeeting"
			});
			$("a[href='#' ]:contains('Chatting')").on("click", function() {
				self.location = "/chatting/mainChatting"
			});
			$("a[href='#' ]:contains('Place')").on("click", function() {
				self.location = "/find/mainFind"
			});
			$("a[href='#' ]:contains('RestaurantInfo')").on("click", function() {
				self.location = "/info/listRestaurantInfo"
			});
			$("a[href='#' ]:contains('Complain')").on("click", function() {
				self.location = "/complain/listComplain"
			});
			$("a[href='#' ]:contains('UserList')").on("click", function() {
				self.location = "/user/listUser"
			});
			/* $("a[href='#' ]:contains('login')").on("click", function() {
				self.location = "/user/login"
			}); */
			$("a[href='#' ]:contains('join')").on("click", function() {
				self.location = "/user/addUser"
			});
			$("a[href='#' ]:contains('MyPage')").on("click", function() {
				self.location = "/user/getUserView"
			});
			$("a[href='#' ]:contains('logout')").on("click", function() {
				self.location = "/user/logout/${me.userId}"
			});
			$("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
				$("#my-dialog,#dialog-background").toggle();
			});
			
		});
		
		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#password").keypress(function(e) {
				if(e.which == 13) {
					$(this).blur();
					$('#loginButton').focus().click();
				}
			});
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#loginButton").on("click" , function() {
				var id=$("input[name='userId']").val();
				var pw=$("input[name='password']").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("#loginForm").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				//self.location = "/user/login/"+id+"/"+pw;
			});
		});	
		
		//============= 회원 찾기===================
		
		
		
	</script>
	
	<style>
        body {padding-top : 100px;}
        
        .navbar-fixed-top{height:100px; padding-top:20px;}
        .navbar-nav-left{text-align:right;}
        
        #dialog-background {
		    display: none;
		    position: fixed;
		    top: 0; left: 0;
		    width: 100%; height: 100%;
		    background: rgba(0,0,0,.3);
		    z-index: 10;
		}
		
		#my-dialog {
		    display: none;
		    position: fixed;
		    left: calc( 50% - 160px ); top: calc( 50% - 70px );
		    width: 320px; height: 250px; 
		    background: #fff;
		    z-index: 11;
		    padding: 10px;
		}
   	</style>
   	</head>
   	<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
    
    <div class="container">
    	<div class="navbar-header">
    		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<!-- <span class="sr-only">Toggle navigation</span> -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">우리들의 연결고리</a>
		</div>
        
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<!-- <li class="active"><a href="#">Home</a></li> -->
				<li><a href="#">Meeting</a></li>
				<li><a href="#">Chatting</a></li>
				<li><a href="#">Place</a></li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
						<span>Story</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">RestaurantInfo</a></li>
						<li><a href="#">LoveAdvice</a></li>
					</ul>
				</li>
				<li><a href="#">Notice</a></li>
				
				<c:if test="${me.userGrade == 'ADM'}">
				
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
							<span>Admin</span>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">Complain</a></li>
							<li><a href="#">UserList</a></li>
						</ul>
					</li>
				
					<!-- <li><a href="#">Complain</a></li> -->
				</c:if>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<c:if test="${me == null}">
					<li><a href="#" id="btn-open-dialog">login</a></li>
					<li><a href="#">join</a></li>
				 
					<div id="my-dialog">
					<form id="loginForm" class="form-horizontal">
						<label for="userId" class="col-sm-4 control-label">아 이 디</label>
							
						<div class="col-sm-6">
							<input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
						</div>
					 	
						<label for="password" class="col-sm-4 control-label">패 스 워 드</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
						</div>
					 	
						<div class="col-sm-offset-4 col-sm-6 text-center">
							<button id="loginButton" type="button" class="btn btn-primary">로 &nbsp;그 &nbsp;인</button>
						</div>
					 	
						<button id="btn-close-dialog">창 닫기</button>
						</form>
					</div>
				 
					<div id="dialog-background"></div>
				</c:if>
				
				<c:if test="${me != null}">
					<li><a> ${me.nickName}님 반갑습니다. </a></li>
					<li><a href="#">MyPage</a></li>
					<li><a href="#">logout</a></li>
				</c:if>
			</ul>
			
		</div><!--/.nav-collapse -->
	</div>
	</nav>
</body>
</html>