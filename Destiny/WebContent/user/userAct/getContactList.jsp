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
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getContactList").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			$( "td:nth-child(3)" ).css("color" , "red");
			
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[id='writeStoryButton']" ).on("click" , function() {
			 	//var userId = $("input[name='getUserId']").val();
			 	var userId = "${me.userId}";
				self.location = "/act/addStoryView/DAT";
		    });
		});
		
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<h3>����� ä�ø����ȸ</h3>
			
			<!-- table ���� �˻� Start /////////////////////////////////////-->
			<div class="row">
			
				<div class="col-md-6 text-left">
					<p class="text-primary">
						��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
					</p>
				</div>
				
				<div class="col-md-6 text-right">
					<form class="form-inline" name="detailForm">
					
					 
					  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
					</form>
				</div>
				
			</div>
			<!-- table ���� �˻� Start /////////////////////////////////////-->
			
			<!--  table Start /////////////////////////////////////-->
		  <table class="table table-hover table-striped" >
		  
			<thead>
			  <tr>
				<th align="center">No</th>
				<th align="left">���� ������ ����</th>
				<th align="left">���� �г���</th>
				<th align="left">ä����</th>
				<th align="left">�����ۼ�</th>
			  </tr>
			</thead>
		   
			<tbody>
			
			  <c:set var="i" value="0" />
			  <c:forEach var="chatting" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr>
				  <td align="center">${ chatting.chattingNo }</td>
				  <td align="left">
				   <img src="/resources/images/userprofile/${fileList[i-1]}" width="150" height="150"/>
				  </td>	
				  
				  <c:if test="${me.userId eq chatting.manId}">
					<td align="left">${chatting.womanId}</td>
				  </c:if>
				  <c:if test="${me.userId eq chatting.womanId}">
					<td align="left">${chatting.manId}</td>
				  </c:if>
				  
				  <td align="left">${chatting.chattingDate}</td>
				  <td align="left"><button id="writeStoryButton" type="button">���� �ۼ�</button></td>
				</tr>
			  </c:forEach>
			
			</tbody>
		  
		  </table>
		  <!--  table End /////////////////////////////////////-->

		</div>

		<!-- PageNavigation Start... -->
		<jsp:include page="/common/pageNavigator_new.jsp"/>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>