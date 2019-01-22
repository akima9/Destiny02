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
		
		/* ���� ��ư �̺�Ʈ : start */
			$('.btn-heart').on("click", function() {
			var communityNo = ${community.communityNo}
			console.log(communityNo);
			
			$.ajax({
				method : "POST",
				url : '/info/json/likeRestaurantInfo/'+communityNo,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(JSONData, state){
					console.log(JSONData);
					var like = JSONData.community.like;
					$("#likeCount").html(like);
					
					/* ���� �۾��� */
					var likeCount = JSONData.likeCount.likeCountCheck;
					console.log('likecount : ' + likeCount);
					var likeId = JSONData.likeCount.likeCountId;
					console.log('likeId : ' + likeId);
					var likeCommunityNo = JSONData.likeCount.likeCountCommunityNo;
					console.log('likeCommunityNo : ' + likeCommunityNo);
					
					changeBtn(likeId, likeCount, likeCommunityNo);
					/* ���� �۾��� */
					
				}
			});
		});
		/* ���� ��ư �̺�Ʈ : end */
	});
		
	function changeBtn(likeId, likeCount, likeCommunityNo){
		
		/* $('.btn-heart').on('click', function() { */
			var $this = $('.btn-heart');
			if( likeId=='${me.userId}' && (likeCount == 'Y' || likeCount == null)){
				$this.addClass('on');
			}else if( likeId=='${me.userId}' && likeCount == 'N' ){
				$this.removeClass('on');
			}
		/* }); */
	}
		
</script>

<style>

	body{
		position : relative;
	}
	.topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/getRestaurantInfo_background.jpg");
		background-repeat : no-repeat;
		background-position : center center;
		background-size : cover;
		width : 100%;
		height : 400px;
	}
	.topImg::after{
		content : "";
		background : rgba(0, 0, 0, 0.2);
		position : absolute;
		top : 0;
		left : 0;
		width : 100%;
		height : 400px;
		z-index : 1;
	}
	.topImg h1{
		position : absolute;
		line-height : 450px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 2;
		font-size : 60px;
		font-weight : bold;
	}
	h1 .slim{
		font-weight : lighter;
	}
	
	.wrap{
		margin-top : 400px;
	}
	
	.wrap .button{
		padding : 0 30px 10px 30px;
	}
	
	.wrap .button .rightBtn{
		float : right;
	}
	
	.wrapContents{
		margin-bottom : 100px;
		border : 1px solid #E3E4E6;
		padding : 30px;
	}


	.btn-heart{width:50px; height:50px; border:none; background:url(../resources/images/img_heart.png) no-repeat 0 0; cursor:pointer;}
	.btn-heart.on{background:url(../resources/images/img_heart_on.png) no-repeat 0 0;}
	
	
	.righttSort{
		text-align : right;
	}
	
	.firstRow{
		padding-bottom : 10px;
		border-bottom : 1px dashed #E3E4E6;
	}
	
	.secondRow{
		padding-top : 10px;
	}
	
	.contentsDetail{
		padding : 50px 10px;
	}
	
	.firstColumn {
		font-weight : bold;
	}
	
	
</style>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="topImg">
		<h1>����<span class="slim">����</span></h1>
	</div>

	<div class="container">
	
		<div class="wrap">
		
		<div class="row button">
			<button type="button" class="btn btn-default">������</button>
			<button type="button" class="btn btn-default">������</button>
			<button type="button" class="btn btn-default rightBtn">���</button>
		</div>
		
		<div class="wrapContents">
		
		<div class="row firstRow">
			<div class="col-xs-4 col-md-2 firstColumn">${ community.title }</div>
			<c:if test="${community.category == 'RES'}">
				<div class="col-xs-8 col-md-8">��������</div>
			</c:if>
			<c:if test="${community.category == 'MET'}">
				<div class="col-xs-8 col-md-8">�����ı�</div>
			</c:if>
			<c:if test="${community.category == 'DAT'}">
				<div class="col-xs-8 col-md-8">�����ı�</div>
			</c:if>
			<c:if test="${community.category == 'LUV'}">
				<div class="col-xs-8 col-md-8">��������</div>
			</c:if>
			<c:if test="${community.category == 'NTC'}">
				<div class="col-xs-8 col-md-8">��������</div>
			</c:if>
			<div class="col-xs-4 col-md-2 righttSort">${ community.writeDate }</div>
		</div>

		<div class="row secondRow">
			<div class="col-xs-4 col-md-2 firstColumn">${ community.writerNickName }</div>
			<c:if test="${community.userGrade == 'NEW'}">
				<div class="col-xs-8 col-md-4">�ű�ȸ��</div>
			</c:if>
			<c:if test="${community.userGrade == 'NOR'}">
				<div class="col-xs-8 col-md-4">�Ϲ�ȸ��</div>
			</c:if>
			<c:if test="${community.userGrade == 'VIP'}">
				<div class="col-xs-8 col-md-4">���ȸ��</div>
			</c:if>
			<c:if test="${community.userGrade == 'ADM'}">
				<div class="col-xs-8 col-md-4">������</div>
			</c:if>
		</div>
		
		<div class="row">
			<div class="contentsDetail">${ community.detail }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">��ȸ��</div>
			<div class="col-xs-8 col-md-4">${ community.views }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">������</div>
			<div id="likeCount" class="col-xs-8 col-md-4">${ community.like }</div>
		</div>		
		
		<div class="row">
			<div class="col-xs-4 col-md-2">likeCountCheck</div>
			<div class="col-xs-8 col-md-4">${ likeCount.likeCountCheck }</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 text-center">
				<button type="button" class="btn btn-primary">�۾���</button>
				<button type="button" class="btn btn-primary">�Ű�</button>
				<!-- <button type="button" class="btn btn-primary">����</button> -->
				
				<c:if test= '${likeCount.likeCountCheck=="Y"}'>
					<button type="button" class="btn-heart on"></button>
				</c:if>
				<c:if test= '${likeCount.likeCountCheck=="N" || likeCount.likeCountCheck==null}'>
					<button type="button" class="btn-heart"></button>
				</c:if>
				
				<!-- �ۼ��ڸ� ���� ���� �����ϰ� �����ؾ� �Ǵ� �κ� : start -->
				<button type="button" class="btn btn-primary">����</button>
				<button type="button" class="btn btn-primary">����</button>
				<!-- �ۼ��ڸ� ���� ���� �����ϰ� �����ؾ� �Ǵ� �κ� : end -->
				
			</div>
		</div>
		
		<!-- ��� : start -->
		<jsp:include page="/comment/addComment.jsp" />
		<!-- ��� : end -->
		
		</div>
		
		</div>
	
	</div>

</body>
</html>
















