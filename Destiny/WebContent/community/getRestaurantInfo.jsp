<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 


<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"
	integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+"
	crossorigin="anonymous"> -->

<!-- Optional theme -->
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css"
	integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR"
	crossorigin="anonymous"> -->

<!-- Latest compiled and minified JavaScript -->
<!-- <script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"
	integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw"
	crossorigin="anonymous">
	</script> -->

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
		$("button:contains('공감')").on("click", function() {
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

</script>

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
			<div class="col-md-12 text-center">
				<button type="button" class="btn btn-primary">이전글</button>
				<button type="button" class="btn btn-primary">다음글</button>
				<button type="button" class="btn btn-primary">목록</button>
				<button type="button" class="btn btn-primary">글쓰기</button>
				<button type="button" class="btn btn-primary">신고</button>
				<button type="button" class="btn btn-primary">공감</button>
				
				<!-- 작성자만 수정 삭제 가능하게 수정해야 되는 부분 : start -->
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary">삭제</button>
				<!-- 작성자만 수정 삭제 가능하게 수정해야 되는 부분 : end -->
				
			</div>
		</div>
		
		<!-- 댓글 : start -->
		<jsp:include page="/comment/addComment.jsp" />
		<!-- 댓글 : end -->
	
	</div>

</body>
</html>
















