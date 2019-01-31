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
		
			<h3>������ ���� ���� ��û ����</h3><br/><br/>
			<h4>���� �� : ${contextMeeting.meetingName}</h4>
			<img src="/resources/images/meeting/${contextMeeting.titleImg}" width="1050" height="300"/><br/><br/>
			
			<br/><br/>
			${reason}
			<h4>ȸ�� ����Ʈ : ${limit}</h4>
			<!--  table Start /////////////////////////////////////-->
			  <table class="table table-hover table-striped" >
			  
				<thead>
				  <tr>
					<th align="center">No</th>
					<th align="left">��û�� �г���</th>
					<th align="left">��û�� ������ �̹���</th>
					<th align="left">����</th>
					<th align="left">�������</th>
					<th align="left">�Ұ���</th>
					<th align="left">����/����</th>
				  </tr>
				</thead>
			   
				<tbody>
				
				  <c:set var="i" value="0" />
				  <c:forEach var="meeting" items="${listAPL}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
					  <td align="center">${ meeting.meetingCrewNo }</td>
					  <td align="left" data-param="${meeting.meetingMasterId}" >${meeting.crewNickName}</td>
					  <td align="left"><img src="/resources/images/userprofile/${meeting.masterProfileImg}" width="170" height="170"/></td>
					  <td align="left"><c:if test="${listAPLUser[i-1].gender eq 'M'}">����</c:if>
					  				   <c:if test="${listAPLUser[i-1].gender eq 'F'}">����</c:if></td>
					  <td align="left">${listAPLUser[i-1].birthday}</td>
					  <td align="left">
					   <div class="panel panel-info">
						  <div class="panel-heading">
							<h3 class="panel-title">${meeting.interviewTitle}</h3>
						  </div>
						  <div class="panel-body">
							${meeting.interview}
						  </div>
						</div>
					  </td>
					  <td align="left">
						<a class="btn btn-primary btn" href="/act/judgmentApply/yes/${meetingNo}/${meeting.meetingMasterId}" role="button" id="applyOK">���� &nbsp;����</a>
						<a class="btn btn-primary btn" href="/act/judgmentApply/no/${meetingNo}/${meeting.meetingMasterId}" role="button" id="applyNO">���� &nbsp;����</a>
						
					  </td>
					  <tr>
						 <td id="${meeting.meetingCrewNo}" colspan="11" height="1"></td>
					  </tr>
					</tr>
				  </c:forEach>
				</tbody>
			  
			  </table>
			  <!--  table End /////////////////////////////////////-->
			  
			  <!--  table Start /////////////////////////////////////-->
			  <table class="table table-hover table-striped" >
			  
				<thead>
				  <tr>
					<th align="center">No</th>
					<th align="left">��û�� �г���</th>
					<th align="left">��û�� ������ �̹���</th>
					<th align="left">�Ұ���</th>
					<th align="left">����/����</th>
				  </tr>
				</thead>
			   
				<tbody>
				
				  <c:set var="i" value="0" />
				  <c:forEach var="meeting" items="${listYES}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
					  <td align="center">${ meeting.meetingCrewNo }</td>
					  <td align="left" data-param="${meeting.meetingMasterId}" >${meeting.crewNickName}</td>
					  <td align="left"><img src="/resources/images/userprofile/${meeting.masterProfileImg}" width="170" height="170"/></td>
					  <td align="left">
					   <div class="panel panel-info">
						  <div class="panel-heading">
							<h3 class="panel-title">${meeting.interviewTitle}</h3>
						  </div>
						  <div class="panel-body">
							${meeting.interview}
						  </div>
						</div>
					  </td>
					  <td align="left">
						������
					  </td>
					</tr>
				  </c:forEach>
				
				</tbody>
			  
			  </table>
			  <!--  table End /////////////////////////////////////-->
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>