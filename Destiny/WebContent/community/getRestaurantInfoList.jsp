<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>
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
	$("form").attr("method","POST").attr("action","/info/listRestaurantInfo").submit();
}

$(function() {
	
	$("button:contains('글쓰기')").on("click", function() {
		self.location = "/info/addRestaurantInfo"
	});
	
	/* 글 제목 마우스 오버 : start */
	$(".getRestaurantLink").on("mouseover",function(){
		$(".getRestaurantLink").css("cursor","pointer")
	});
	/* 글 제목 마우스 오버 : end */
	
	/* 글 제목 클릭 : start */
	$(".getRestaurantLink").on("click", function(){
		var communityNo = $(this).data("param")
		self.location="/info/getRestaurantInfo?communityNo="+communityNo
	});
	/* 글 제목 클릭 : end */
	
});

</script>
</head>
<body>
	 <!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolBar.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
    
	
	<div class="container">
	
		<h1>getRestaurantInfoList.jsp</h1>
		
		<form>
			<div class="form-group">
				<input type="hidden" id="currentPage" name="currentPage" value="">
			</div>
		</form>
		
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th aligin="center">글번호</th>
					<th aligin="center">제목</th>
					<th aligin="center">작성자</th>
					<th aligin="center">작성일</th>
					<th aligin="center">조회</th>
					<th aligin="center">공감</th>
				</tr>
			</thead>
			
			<tbody>
				<c:set var="i" value="0"/>
				<c:forEach var="community" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<tr>
						<td>
							<span>${community.communityNo }</span>
						</td>
						<td>
							<span class="getRestaurantLink" data-param="${ community.communityNo }">${community.title }</span>
						</td>
						<td>
							<span>${community.writerNickName }</span>
						</td>
						<td>
							<span>${community.writeDate }</span>
						</td>
						<td>
							<span>${community.views }</span>
						</td>
						<td>
							<span>${community.like }</span>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
		
		<div class="form-group text-center">
			<button type="button" class="btn btn-default btn-lg">글쓰기</button>
		</div>
	
	</div>
	
	<!-- PageNavigation : start -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation : end -->
	
</body>
</html>