<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�츮���� �������</title>
		<!-- ���� : http://getbootstrap.com/css/   -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
			$(function() {
				
				/* �� ���� ���콺 ���� : start */
				$(".getComplainLink").on("mouseover",function(){
					$(".getComplainLink").css("cursor","pointer")
				});
				/* �� ���� ���콺 ���� : end */
				
				/* �� ���� Ŭ�� : start */
				$(".getComplainLink").on("click", function(){
					var communityNo = $(this).data("param");
					var meetingNo = $(this).data("param1");
					
					if(meetingNo == null){
						/* if(${community.category == "RES"}){
							self.location="/info/getRestaurantInfo?communityNo="+communityNo
						}  */
						
						self.location="/info/getRestaurantInfo?communityNo="+communityNo

						
					}else if(communityNo == null){
						self.location="/meeting/getMeeting?meetingNo="+meetingNo
					}
					
				});
				/* �� ���� Ŭ�� : end */
				
				$( "button:contains('Ȯ��')" ).on("click" , function() {
					alert("ó���� �Ϸ��Ͻðڽ��ϱ�?");
					$("form").attr("method" , "POST").attr("action" , "/complain/updateComplain?complainNo=${complain.complainNo}").submit();
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
			<h1>�Ű�ó��</h1>
		</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="complainNo" value="${complain.complainNo}"/>
		<input type="hidden" name="defendantId" value="${complain.defendantId}"/>
		
			<hr/>
			<div class="row">
				<div class="col-xs-4 col-md-2"><strong>�Ű�ó������</strong></div>
				<div class="col-xs-8 col-md-4" name="complainState">
				 	${complain.complainState=='N' ? "�Ű�ó�� �����":"�Ű�ó�� �Ϸ�"}
				 </div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>�Ű���¥</strong></div>
				<div class="col-xs-8 col-md-4" name="complainDate"> ${complain.complainDate}  </div>
			</div>
				
			<hr/>
		
			<div class="row">
				<div class="col-xs-4 col-md-2"><strong>�Ű���</strong></div>
				<div class="col-xs-8 col-md-4" name="complainType"> ${complain.complainerId} ( ${user.warningCount} )</div>
			</div>
				
			<hr/>
				
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>�ۼ���</strong></div>
				<div class="col-xs-8 col-md-4" name="complainType"> ${complain.defendantId} (${user.warningCount}) </div>
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
				<c:if test="${complain.complainKind == 'BD'}">
			  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			  		<div class="col-xs-8 col-md-4 getComplainLink" name="complainDetail" data-param="${complain.communityNo}"> ${complain.complainDetail} </div>
				</c:if>
				<c:if test="${complain.complainKind == 'MT'}">
			  		<div class="col-xs-4 col-md-2"><strong>���Ӹ�</strong></div>
			  		<div class="col-xs-8 col-md-4 getComplainLink" name="complainDetail" data-param1="${complain.meetingNo}"> ${complain.complainDetail} </div>
				</c:if>
				
				
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
		  		<div class="col-xs-4 col-md-2"><strong>�Ű�����</strong></div>
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
		  		<div class="col-xs-4 col-md-2"><strong>�Ű�����</strong></div>
				<div class="col-xs-8 col-md-4">${complain.complainText}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>�Ű�ó��</strong></div>
				<div class="col-xs-8 col-md-4">
					<input type="radio" class="complainCondition" name="complainCondition" value='NOT'>����</input>
					<input type="radio" class="complainCondition" name="complainCondition" value='WAR'>���</input>
					<input type="radio" class="complainCondition" name="complainCondition" value='BLK'>��������Ʈ</input>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group text-center">
				<button type="button" class="btn btn-default btn-mg">Ȯ��</button>
			</div>
			
		</form>
		
		
	
	</div>
	
</body>
</html>