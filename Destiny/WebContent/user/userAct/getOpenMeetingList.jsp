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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
	
	
	
	<script>
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getOpenMeetingList").submit();
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
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/meeting/getMeeting?meetingNo="+$(this).data("param");
			});
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
	
		 $(function() {
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body >	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<h3>������ ���� ��ȸ</h3>
		
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			
			<div class="col-md-6 text-left">
				<p class="text-primary">
					��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
				</p>
			</div>

			<br/>
			
				<div class="box alt">
					<div class="row 50% uniform">

					
					
					
					
					  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
						<!--  table Start /////////////////////////////////////-->
					  <table class="table table-hover table-striped" >
						<thead>
						  <tr>
							<th align="center">No</th>
							<th align="left">���� ����</th>
							<th align="left">���� �̹���</th>
							<th align="left">�߽���</th>
							<th align="left">���ɻ�</th>
							<th align="left">���� ��û�� ����</th>
							<th align="left">ȸ�� ��ȸ</th>
							<th align="left">���� ��Ȳ ����</th>
						  </tr>
						</thead>
					   
						<tbody>
						
						  <c:set var="i" value="0" />
						  <c:forEach var="meeting" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr>
							  <td align="center">${ i }</td>
							  <td align="left" data-param="${meeting.meetingNo}" title="Click : ���� �̵�">${meeting.meetingName}</td>
							  <td align="left"><img src="/resources/images/meeting/${meeting.titleImg}" width="170" height="170"/></td>
							  <td align="left">${meeting.meetingCenter}</td>
							  <td align="left">${meeting.interestName}</td>
							  <td align="left"><a class="btn btn-primary btn" href="/act/getCrewList/${meeting.meetingNo}" role="button" id="getCrewList">���� &nbsp;��û�� &nbsp;��ȸ</a></td>
							  <td align="left"><a class="btn btn-primary btn" href="/act/getMeetingAct/${meeting.meetingNo}" role="button" id="getMeetingAct">���� &nbsp;ȸ��&nbsp;��ȸ</a></td>
							  <td align="left"><a class="btn btn-primary btn" href="/act/meetingChart/${meeting.meetingNo}" role="button" id="getMeetingChart">���� &nbsp;��Ʈ&nbsp;��ȸ</a></td>
							</tr>
						  </c:forEach>
						
						</tbody>
					  
					  </table>
					  <!--  table End /////////////////////////////////////-->
			
		</div>
		<!-- PageNavigation Start... -->
		<jsp:include page="/common/pageNavigator_new.jsp"/>
		</div>
		</form>
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>