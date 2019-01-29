<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$("a[href='#' ]:contains('우연')").on("click", function() {
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
		$("a[href='#' ]:contains('LoveAdvice')").on("click", function() {
			self.location = "/love/listLoveAdvice"
		});
		$("a[href='#' ]:contains('Complain')").on("click", function() {
			self.location = "/complain/listComplain"
		});
		$("a[href='#' ]:contains('UserList')").on("click", function() {
			self.location = "/user/listUser"
		});
		$("a[href='#' ]:contains('login')").on("click", function() {
			//self.location = "/user/login"
			//self.location = "/user/userInfo/login.jsp"
		});
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
//////////============= "로그인"  Event 연결 =============	
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
</script>
<style>
	strong{
		font-family: 'Nanum Myeongjo', serif;
	}
	#nav{
		font-family: 'Source Serif Pro', serif;
	}
</style>
	<style>
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
		    left: calc( 50% - 160px ); top: calc( 30% - 70px );
		    width: 100px; height: 100px; 
		    z-index: 11;
		    padding: 10px;
		}
   	</style>
   	
   	<style type="text/css">
	      body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {		
		color: #636363;
		width: 350px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
		background-color: #fff;
	}
	.modal-login .modal-header {
		border-bottom: none;   
        position: relative;
        justify-content: center;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 ;
	}
	.modal-login .form-control:focus {
		border-color: #70c5c0;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-login .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-login .modal-footer {
		background: #ecf0f1;
		border-color: #dee4e7;
		text-align: center;
        justify-content: center;
		margin: 0 -20px -20px;
		border-radius: 5px;
		font-size: 13px;
	}
	.modal-login .modal-footer a {
		color: #999;
	}		
	.modal-login .avatar {
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -100px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: #60c7c1;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-login .avatar img {
		width: 100%;
	}
	.modal-login.modal-dialog {
		margin-top: 80px;
	}
    .modal-login .btn {
        color: #fff;
        border-radius: 4px;
		background: #60c7c1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
    }
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #45aba6;
		outline: none;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
	</style>
<header id="header">
	<div class="inner">
		<a href="#" class="logo"><strong>우연</strong></a>
		<!-- header 수정 후엔 footer.jsp에 #navepanel도 수정해주기 -->
		<nav id="nav">
			<a href="#" >Meeting</a>
			<a href="#">Chatting</a>
			<a href="#">Place</a>
			<a href="#">RestaurantInfo</a>
			<a href="#">LoveAdvice</a>
			<a href="#">Notice</a>
			
			<c:if test="${me.userGrade == 'ADM'}">
				<a href="#">Complain</a>
				<a href="#">UserList</a>
			</c:if>
			
			<c:if test="${me == null}">
				<a href="#" id="btn-open-dialog" >login</a>
				<a href="#">join</a>
			</c:if>
			<c:if test="${me != null}">
				<a href="#">MyPage</a>
				<a href="#">logout</a>
			</c:if>
		</nav>
		<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
	</div>
	
	<div id="myModal" >
		<div id="my-dialog">
			<div class="modal-dialog modal-login">
				<div class="modal-content">
					<div class="modal-header ">
						<div class="avatar">
							<img src="/resources/images/meeting/logo.png"  alt="Avatar">
						</div>				
						<h4 class="modal-title">Login</h4>	
		                
					</div>
					<div class="modal-body">
						<form id="loginForm">
							<div class="form-group" class="form-horizontal">
								<input id="userId" type="text" class="form-control" name="userId" placeholder="Username" required="required">		
							</div>
							<div class="form-group">
								<input id="password" type="password" class="form-control" name="password" placeholder="Password" required="required">	
							</div>        
							<div class="form-group" align="center">
								<button id="loginButton" type="submit" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<a href="#">Forgot Password?</a>
					</div>
				</div>
			</div>
		</div>      
		</div>	
		
		<div id="dialog-background"></div>
</header>

