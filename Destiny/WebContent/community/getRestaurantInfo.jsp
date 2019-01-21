<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>

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
		
		/* 목록 버튼 이벤트 : start */
		$("button:contains('목록')").on("click", function() {
			self.location = "/info/listRestaurantInfo"
		});
		/* 목록 버튼 이벤트 : end */
		
		/* 글쓰기 버튼 이벤트 : start */
		$("button:contains('글쓰기')").on("click", function() {
			self.location = "/info/addRestaurantInfo"
		});
		/* 글쓰기 버튼 이벤트 : end */
		
		/* 신고 버튼 이벤트 : start */
		$("button:contains('신고')").on("click", function() {
			self.location = "/complain/addComplain?communityNo=${community.communityNo}"
		});
		/* 신고 버튼 이벤트 : end */
		
		/* 수정 버튼 이벤트 : start */
		$("button:contains('수정')").on("click", function() {
			//self.location = "/info/updateRestaurantInfo?communityNo="+${community.communityNo}
			self.location = "/info/updateRestaurantInfo?communityNo=${community.communityNo}"
		});
		/* 수정 버튼 이벤트 : end */
		
		/* 수정 버튼 이벤트 : start */
		$("button:contains('삭제')").on("click", function() {
			//self.location = "/info/updateRestaurantInfo?communityNo="+${community.communityNo}
			self.location = "/info/deleteRestaurantInfo?communityNo=${community.communityNo}"
		});
		/* 수정 버튼 이벤트 : end */
		
		/* 공감 버튼 이벤트 : start */
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
					
					/* 보미 작업중 */
					var likeCount = JSONData.likeCount.likeCountCheck;
					console.log('likecount : ' + likeCount);
					var likeId = JSONData.likeCount.likeCountId;
					console.log('likeId : ' + likeId);
					var likeCommunityNo = JSONData.likeCount.likeCountCommunityNo;
					console.log('likeCommunityNo : ' + likeCommunityNo);
					
					changeBtn(likeId, likeCount, likeCommunityNo);
					/* 보미 작업중 */
					
				}
			});
		});
		/* 공감 버튼 이벤트 : end */
		
		
		/* 작업중 */
		/* $("button:contains('공감')").on("click", function() {
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
				}
			});
		}); */
		/* 작업중 */
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
	.btn-heart{width:50px; height:50px; border:none; background:url(../resources/images/img_heart.png) no-repeat 0 0; cursor:pointer;}
	.btn-heart.on{background:url(../resources/images/img_heart_on.png) no-repeat 0 0;}
</style>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">
	
		<!-- 상세페이지에서 업데이트 컨트롤러로 보내는 데이터 : start -->
		<%-- <input type="text" name="likecountId" value="${ community.writerId }">
		<input type="text" name="likecountCommunityNo" value="${ community.communityNo }">
		<input type="text" name="likecountCheck" value="${ likecount.likecountCheck }"> --%>
		<!-- 상세페이지에서 업데이트 컨트롤러로 보내는 데이터 : end -->
	
		<div class="row">
			<h1>getRestaurantInfo.jsp</h1>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">제목</div>
			<div class="col-xs-8 col-md-4">${ community.title }</div>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2">닉네임</div>
			<div class="col-xs-8 col-md-4">${ community.writerNickName }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">회원등급</div>
			<div class="col-xs-8 col-md-4">${ community.userGrade }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">내용</div>
			<div class="col-xs-8 col-md-4">${ community.detail }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">조회수</div>
			<div class="col-xs-8 col-md-4">${ community.views }</div>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">공감수</div>
			<div id="likeCount" class="col-xs-8 col-md-4">${ community.like }</div>
		</div>		
		
		<div class="row">
			<div class="col-xs-4 col-md-2">likeCountCheck</div>
			<div class="col-xs-8 col-md-4">${ likeCount.likeCountCheck }</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 text-center">
				<button type="button" class="btn btn-primary">이전글</button>
				<button type="button" class="btn btn-primary">다음글</button>
				<button type="button" class="btn btn-primary">목록</button>
				<button type="button" class="btn btn-primary">글쓰기</button>
				<button type="button" class="btn btn-primary">신고</button>
				<!-- <button type="button" class="btn btn-primary">공감</button> -->
				
				<c:if test= '${likeCount.likeCountCheck=="Y"}'>
					<button type="button" class="btn-heart on"></button>
				</c:if>
				<c:if test= '${likeCount.likeCountCheck=="N" || likeCount.likeCountCheck==null}'>
					<button type="button" class="btn-heart"></button>
				</c:if>
				
				<!-- 작성자만 수정 삭제 가능하게 수정해야 되는 부분 : start -->
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary">삭제</button>
				<!-- 작성자만 수정 삭제 가능하게 수정해야 되는 부분 : end -->
				
			</div>
		</div>
	
	</div>

</body>
</html>
















