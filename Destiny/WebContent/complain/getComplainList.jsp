<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�츮���� �����</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">
	
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	
	function fncGetList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/complain/listComplain").submit();
	}
	
	$(function (){
		$("button:contains('����')").on("click", function(){
			var complainNo = $(this).data("param");
			self.location = "/complain/getComplain?complainNo="+complainNo;
		});
	});
	
	</script>
</head>
<body>
	 <!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolBar.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
    
	
	<div class="container">
	
		<h1>getComplainList.jsp</h1>
		
		<div class="col-md-5 text-left">
	    	<p class="text-primary">
	    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
	    	</p>
	    </div>
		
		<form>
			<div class="form-group">
				<input type="hidden" id="currentPage" name="currentPage" value="">
			</div>
		
			<table class="table table-hover table-striped">
			
				<thead>
					<tr>
						<th aligin="center">No</th>
						<th aligin="center">�Ű���</th>
						<th aligin="center">�Ű�����</th>
						<th aligin="center">�Ű�¥</th>
						<th aligin="center">ó������</th>
						<th aligin="center">���</th>
					</tr>
				</thead>
				
				<tbody>
					<c:set var="i" value="0"/>
					<c:forEach var="complain" items="${list}">
						<c:set var="i" value="${i+1}"/>
						<tr>
							<td>
								<span>${i}</span>
							</td>
							<td>
								<span class="getComplain">${complain.complainerId }</span>
							</td>
							<td>
								<c:if test="${complain.complainKind == 'BD'}">
									<span>�Խù�</span>
								</c:if>
								<c:if test="${complain.complainKind == 'MT'}">
									<span>����</span>
								</c:if>
							</td>
							<td>
								<span>${complain.complainDate }</span>
							</td>
							<td>
								<c:if test="${complain.complainState=='N'}">
									<span>���</span>
								</c:if>
								<c:if test="${complain.complainState=='Y'}">
									<span>�Ϸ�
										<c:if test="${complain.complainCondition == 'NOT'}">(����)</c:if>
										<c:if test="${complain.complainCondition == 'WAR'}">(���)</c:if>
										<c:if test="${complain.complainCondition == 'BLK'}">(������Ʈ)</c:if>
									</span>
								</c:if>
							</td>
							<td>
								<button type="button" class="btn btn-default btn-mg" data-param="${complain.complainNo}">����</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			
			</table>	
		</form>
	</div>
	
	<!-- PageNavigation : start -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation : end -->
	
</body>
</html>