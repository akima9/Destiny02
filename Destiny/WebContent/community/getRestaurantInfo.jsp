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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"
	integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css"
	integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"
	integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function(){
		
		/* ��� ��ư �̺�Ʈ : start */
		$("button:contains('���')").on("click", function() {
			self.location = "/info/listRestaurantInfo"
		});
		/* ��� ��ư �̺�Ʈ : end */
		
		/* �۾��� ��ư �̺�Ʈ : start */
		$("button:contains('�۾���')").on("click", function() {
			self.location = "/info/addRestaurantInfo"
		});
		/* �۾��� ��ư �̺�Ʈ : end */
		
		/* �Ű� ��ư �̺�Ʈ : start */
		$("button:contains('�Ű�')").on("click", function() {
			self.location = "/complain/addComplain?communityNo=${community.communityNo}"
		});
		/* �Ű� ��ư �̺�Ʈ : end */
		
		/* ���� ��ư �̺�Ʈ : start */
		$("button:contains('����')").on("click", function() {
			//self.location = "/info/updateRestaurantInfo?communityNo="+${community.communityNo}
			self.location = "/info/updateRestaurantInfo?communityNo=${community.communityNo}"
		});
		/* ���� ��ư �̺�Ʈ : end */
		
		/* ���� ��ư �̺�Ʈ : start */
		$("button:contains('����')").on("click", function() {
			//self.location = "/info/updateRestaurantInfo?communityNo="+${community.communityNo}
			self.location = "/info/deleteRestaurantInfo?communityNo=${community.communityNo}"
		});
		/* ���� ��ư �̺�Ʈ : end */
		
	});

</script>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">
	
		<div class="row">
			<h1>getRestaurantInfo.jsp</h1>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">����</div>
			<div class="col-xs-8 col-md-4">${ community.title }</div>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">�г���</div>
			<div class="col-xs-8 col-md-4">${ community.writerNickName }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">ȸ�����</div>
			<div class="col-xs-8 col-md-4">${ community.userGrade }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">����</div>
			<div class="col-xs-8 col-md-4">${ community.detail }</div>
		</div>		
		
		<div class="row">
			<div class="col-md-12 text-center">
				<button type="button" class="btn btn-primary">������</button>
				<button type="button" class="btn btn-primary">������</button>
				<button type="button" class="btn btn-primary">���</button>
				<button type="button" class="btn btn-primary">�۾���</button>
				<button type="button" class="btn btn-primary">�Ű�</button>
				
				<!-- �ۼ��ڸ� ���� ���� �����ϰ� �����ؾ� �Ǵ� �κ� : start -->
				<button type="button" class="btn btn-primary">����</button>
				<button type="button" class="btn btn-primary">����</button>
				<!-- �ۼ��ڸ� ���� ���� �����ϰ� �����ؾ� �Ǵ� �κ� : end -->
				
			</div>
		</div>
	
	</div>

</body>
</html>
















