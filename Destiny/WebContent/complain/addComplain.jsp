<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>AddComplain</title>
		<!-- ���� : http://getbootstrap.com/css/   -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		
		<script type="text/javascript">
			$(function() {
				
				$("button:contains('�Ű��ϱ�')").on("click", function() {
					alert("�Ű��Ͻðڽ��ϱ�?");
					$("form").attr("method" , "POST").attr("action" , "/complain/addComplain").submit();
				});		
				
				$( "button:contains('���')" ).on("click" , function() {
					 history.go(-1);
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
			<h1>�Ű��ϱ�</h1>
		</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="communityNo" value="${community.communityNo}"/>
		<input type="hidden" name="writerId" value="${ community.writerId }">
		<input type="hidden" name="title" value="${ community.title }">
		<input type="hidden" name="meetingNo" value="${ meeting.meetingNo }">
		<input type="hidden" name="meetingMasterId" value="${ meeting.meetingMasterId }">
		<input type="hidden" name="meetingName" value="${ meeting.meetingName }">
		
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
					<div class="col-xs-8 col-md-4" name="complainDetail"> ${community.title} </div>
				</c:if>
				
				<c:if test="${meeting.meetingNo != 0}">
			  		<div class="col-xs-4 col-md-2"><strong>���Ӹ�</strong></div>
					<div class="col-xs-8 col-md-4" name="complainDetail"> ${meeting.meetingName} </div>
				</c:if>
				
				<%-- <c:if test="${comment.commentNo != 0}">
			  		<div class="col-xs-4 col-md-2"><strong>���</strong></div>
					<div class="col-xs-8 col-md-4" name="complainType"> ${comment.commentContents} </div>
				</c:if> --%>
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
		  		<div class="col-xs-4 col-md-2"><strong>�Ű����</strong></div>
				<div class="col-xs-8 col-md-4">
					<select class="form-control" id="complainType" name="complainType">
				    	<option value="">�Ű������ �������ּ���.</option>
						<option value="FKU">�弳/���</option>
						<option value="SEX">����</option>
						<option value="ADV">����/����</option>
						<option value="ETC">��Ÿ</option>
					</select>
				</div>
			</div>
				
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>�Ű���</strong></div>
				<input type="text" class="form-control" name="complainText" placeholder="�Ű����� �Է����ּ���.">
			</div>
				
			<hr/>
			
			<div class="form-group text-center">
				
				<button type="button" class="btn btn-default btn-lg" id="save">�Ű��ϱ�</button>
				<button type="button" class="btn btn-default btn-lg" id="cancle">���</button>
					
			</div>
			
		</form>
		
		
	
	</div>
	
</body>
</html>