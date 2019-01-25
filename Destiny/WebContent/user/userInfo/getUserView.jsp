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
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	


	
	<script>
	
		
		
		$(function(){
			$("button[id='listButton']").on("click", function(){
				self.location = "/user/listUser";
			});
		});
		
		$(function(){
			$("button[id='leaveSite']").on("click", function(){
				self.location = "/user/userInfo/leaveSite.jsp";
			});
		});
		
		$(function(){
			$("button[id='actMainButton']").on("click", function(){
				self.location = "/user/userAct/actMain.jsp";
			});
		});
		
		
		$(function(){
			$("a[id='letterList']").on("click", function(){
				popWin = window.open("/letter/letterMain.jsp",
					   	 "popWin",
						 "left=300, top=200, width=700, height=700, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

			});
		});
		
		$(function(){
			$("button[id='pushButton']").on("click", function(){
				
			});
		});
		
		
		
		
	</script>
<!-- //All js -->
	
	
	<style>
	
		#grad1 {
			  height: 300px;
			  background-color: #000000; /* For browsers that do not support gradients */
			  background-image: linear-gradient(to right, #000000 , #FFFFFF); /* Standard syntax (must be last) */
			}
			
			
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
		
		<h3>마이페이지</h3>
				
		<br/>
		
		
		
		<div class="box alt">
			<div class="row 50% uniform">
				
				
				<div class="4u">
			    <h4>성격 &amp; 유형</h4><p>
			      <a href="/user/addTypeView/${me.userId}"><span class="image"><img src="/resources/images/layout/mbti.jpg" width="300" height="300" /></span></a>
			    	당신의 MBTI성격유형을 알아보고 선택하세요. 그리고 원하는 상대방 성격유형을 선택하세요.</p>
			    </div>
				    
				
			
			
				<div class="4u">
			    <h4>회원리스트</h4>
			      <a href="/user/listUser"><span class="image"><img src="/resources/images/layout/users.png" width="300" height="300" /></span></a>
			   	  어떤 회원들이 이 사이트를 이용하고 있는지 확인해보세요
				</div>	
			
			 
			
			
				<div class="4u">
			    <h4>쪽지</h4>
			    <a href="#" id="letterList"><span class="image"><img src="/resources/images/layout/letter.png" width="300" height="300" /></span></a>
				    유저에게 쪽지를 보내고 받으세요. 
				</div>	
	
				<h4>활동관리</h4>
				<div class="12u" id="grad1">
			    <p  style="font-size:120%; color:black;"><a href="/user/userAct/actMain.jsp" id="actMainButton"><span class="image left"><img alt="" src="/resources/images/layout/act.jpg" style="width: 250px; height:250px;"  /></span></a>
			   	 당신의 활동내역을 확인하고 관리하세요. 당신이 가입한 모임, 개설한 모임과 회차, 회원 목록을 조회하고 가입신청을 관리하세요. 당신이 작성한 개시글, 댓글을 확인하고 이루어진 만남을 돌이켜보고 리뷰를 작성하세요.</p>
				</div>	
			
			
			
			
			<div class="6u">
			      <button id="leaveSite" type="button"><p>사이트 탈퇴</p></button>
			</div>	
			
			<div class="6u">
			      <button id="pushButton" type="button"><p>푸쉬 보넹!</p></button>
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