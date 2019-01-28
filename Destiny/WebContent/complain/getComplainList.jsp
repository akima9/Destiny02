<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>
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
			$("button:contains('����')").on("click", function(){
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
				<h2>�Ű���</h2>
			</header>
			
			<div class="col-md-5">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    <hr class="major">
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">

				<div>
					<table class="row-table">
						<caption>���̺� ����</caption>
						
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
								<th>�Ű���</th>
								<th>�Ű�����</th>
								<th>�Ű�¥</th>
								<th>ó������</th>
								<th>���</th>
								
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