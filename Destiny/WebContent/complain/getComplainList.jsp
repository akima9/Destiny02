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
	
	$(function() {
		$("button:contains('글쓰기')").on("click", function() {
			self.location = "/info/addRestaurantInfo"
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
	    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
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
						<th aligin="center">신고자</th>
						<th aligin="center">신고종류</th>
						<th aligin="center">신고날짜</th>
						<th aligin="center">처리상태</th>
						<th aligin="center">비고</th>
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
								<span class="getComplain" data-param="${ complain.complainNo }">${complain.complainerId }</span>
							</td>
							<td>
								<span>${complain.complainKind }</span>
							</td>
							<td>
								<span>${complain.complainDate }</span>
							</td>
							<td>
								<span>${complain.complainState }</span>
							</td>
							<td>
								<span>보기</span>
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