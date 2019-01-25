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
		
		<h3>����������</h3>
				
		<br/>
		
		
		
		<div class="box alt">
			<div class="row 50% uniform">
				
				
				<div class="4u">
			    <h4>���� &amp; ����</h4><p>
			      <a href="/user/addTypeView/${me.userId}"><span class="image"><img src="/resources/images/layout/mbti.jpg" width="300" height="300" /></span></a>
			    	����� MBTI���������� �˾ƺ��� �����ϼ���. �׸��� ���ϴ� ���� ���������� �����ϼ���.</p>
			    </div>
				    
				
			
			
				<div class="4u">
			    <h4>ȸ������Ʈ</h4>
			      <a href="/user/listUser"><span class="image"><img src="/resources/images/layout/users.png" width="300" height="300" /></span></a>
			   	  � ȸ������ �� ����Ʈ�� �̿��ϰ� �ִ��� Ȯ���غ�����
				</div>	
			
			 
			
			
				<div class="4u">
			    <h4>����</h4>
			    <a href="#" id="letterList"><span class="image"><img src="/resources/images/layout/letter.png" width="300" height="300" /></span></a>
				    �������� ������ ������ ��������. 
				</div>	
	
				<h4>Ȱ������</h4>
				<div class="12u" id="grad1">
			    <p  style="font-size:120%; color:black;"><a href="/user/userAct/actMain.jsp" id="actMainButton"><span class="image left"><img alt="" src="/resources/images/layout/act.jpg" style="width: 250px; height:250px;"  /></span></a>
			   	 ����� Ȱ�������� Ȯ���ϰ� �����ϼ���. ����� ������ ����, ������ ���Ӱ� ȸ��, ȸ�� ����� ��ȸ�ϰ� ���Խ�û�� �����ϼ���. ����� �ۼ��� ���ñ�, ����� Ȯ���ϰ� �̷���� ������ �����Ѻ��� ���並 �ۼ��ϼ���.</p>
				</div>	
			
			
			
			
			<div class="6u">
			      <button id="leaveSite" type="button"><p>����Ʈ Ż��</p></button>
			</div>	
			
			<div class="6u">
			      <button id="pushButton" type="button"><p>Ǫ�� ����!</p></button>
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