<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>AddComplainConfirm</title>
		<!-- ���� : http://getbootstrap.com/css/   -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
			$(function() {	
				var communityNo = ${community.communityNo};
				console.log(communityNo);
				var meetingNo = ${meeting.meetingNo};
				console.log(meetingNo);
				
				$( "button:contains('Ȯ��')" ).on("click" , function() {
					if(communityNo != 0){
						$("form").attr("method" , "POST").attr("action" , "/info/listRestaurantInfo").submit();
					}else if(meetingNo != 0){
						$("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting").submit();
					}
					
				});
				
			});
		</script>
		
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">
	
		<div class="row text-center">
			<h1>�Ű�Ȯ��</h1>
		</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<%-- <input type="hidden" name="communityNo" value="${community.communityNo}"/> --%>
		
			<div class="row">
			
				<div class="col-xs-4 col-md-2"><strong>�Ű���</strong></div>
			  	<c:if test="${community.communityNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${community.communityNo} </div>
				</c:if>
				<c:if test="${meeting.meetingNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${meeting.meetingNo} </div>
				</c:if>
			</div>
				
			<hr/>
				
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>�ۼ���</strong></div>
			  	<c:if test="${community.communityNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${community.writerId} </div>
				</c:if>
				<c:if test="${meeting.meetingNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${meeting.meetingMasterId} </div>
				</c:if>
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
				<c:if test="${community.communityNo != 0}">
			  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
				</c:if>
				<c:if test="${meeting.meetingNo != 0}">
			  		<div class="col-xs-4 col-md-2"><strong>���Ӹ�</strong></div>
				</c:if>
				<div class="col-xs-8 col-md-4" name="complainDetail"> ${complain.complainDetail} </div>
				
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
		  		<div class="col-xs-4 col-md-2"><strong>�Ű����</strong></div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${complain.complainType == 'FKU'}"> �弳/��� </c:if>
					<c:if test="${complain.complainType == 'SEX'}"> ���� </c:if>
					<c:if test="${complain.complainType == 'ADV'}"> ����/���� </c:if>
					<c:if test="${complain.complainType == 'ETC'}"> ��Ÿ </c:if>
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
				<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
		  		<div class="col-xs-4 col-md-2"><strong>�Ű���</strong></div>
				<div class="col-xs-8 col-md-4">${complain.complainText}</div>
			</div>
			
			<hr/>
			
			<div class="form-group text-center">
				
				<button type="button" class="btn btn-default btn-lg" id="save">Ȯ��</button>
					
			</div>
			
		</form>
		
		
	
	</div>
	
</body>
</html>