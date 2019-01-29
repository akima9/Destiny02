<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 
<!-- //All CSS Insert -->

<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">

		function fncGetList(currentPage){
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/complain/listComplain").submit();
		}
		
		$(function (){
			$("button:contains('보기')").on("click", function(){
				var complainNo = $(this).data("param");
				self.location = "/complain/getComplain?complainNo="+complainNo;
			});
		});
		
		</script>
	<!-- //All js -->
	
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h2>신고함</h2>
			</header>
			
			<div class="col-md-5">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    <hr class="major">
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">

				<div>
					<table class="row-table">
						<caption>테이블 설명</caption>
						
						<colgroup>
							<col style="width:5%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:15%;">
						</colgroup>
						
						<thead>
							<tr>
								<th>No</th>
								<th>신고자</th>
								<th>신고종류</th>
								<th>신고날짜</th>
								<th>처리상태</th>
								<th>비고</th>
								
							</tr>
						</thead>
						
						<tbody>
							<c:set var="i" value="0"/>
							<c:forEach var="complain" items="${list}">
								<c:set var="i" value="${i+1}"/>
								
								<tr>
									<td>${i}</td>
									<td>
										<span class="getComplain">${complain.complainerId }</span>
									</td>
									<td>
										<c:if test="${complain.complainKind == 'BD'}">
											<span>게시물</span>
										</c:if>
										<c:if test="${complain.complainKind == 'MT'}">
											<span>모임</span>
										</c:if>
									</td>
									<td>
										<span>${complain.complainDate }</span>
									</td>
									<td>
										<c:if test="${complain.complainState=='N'}">
											<span>대기</span>
										</c:if>
										<c:if test="${complain.complainState=='Y'}">
											<span>완료
												<c:if test="${complain.complainCondition == 'NOT'}">(무고)</c:if>
												<c:if test="${complain.complainCondition == 'WAR'}">(경고)</c:if>
												<c:if test="${complain.complainCondition == 'BLK'}">(블랙리스트)</c:if>
											</span>
										</c:if>
									</td>
									<td>
										<button type="button" class="btn btn-default btn-mg" data-param="${complain.complainNo}">보기</button>
									</td>
								</tr>
							
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
</body>
</html>