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
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getWriteCommunityList").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/info/getRestaurantInfo?communityNo="+$(this).data("param");
			});
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			
			<h3>�ۼ��� ���ñ� �����ȸ</h3>
				
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			
			<div class="col-md-6 text-left">
				<p class="text-primary">
					��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
				</p>
			</div>

			<br/>
			
				<div class="box alt">
					<div class="row 50% uniform">

					
					
					
					  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
					
						 <!--  table Start /////////////////////////////////////-->
					  <table class="table table-hover table-striped" >
					  
						<thead>
						  <tr>
							<th align="center">No</th>
							<th align="center">���ñ� ����</th>
							<th align="center">ī�װ�</th>
							<th align="center">�ۼ���</th>
							<th align="center">������</th>
							<th align="center">��ۼ�</th>
						  </tr>
						</thead>
					   
						<tbody>
						
						  <c:set var="i" value="0" />
						  <c:forEach var="community" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr height="200">
							  <td align="center">${ i }</td>
							  <td align="center"  title="Click : ���ñ� �̵�" data-param="${community.communityNo}"
							  style="background-image : url('/resources/images/uploadImg/${community.fileName}'); background-size : 310px 200px;">${community.title}</td>
							  <td align="center">${community.category}</td>
							  <td align="center">${community.writeDate}</td>
							  <td align="center">${community.like}</td>
							  <td align="center"><span class="badge">${listCommentCount[i-1]}</span></td>
							</tr>
						  </c:forEach>
						
						</tbody>
					  
					  </table>
					  <!--  table End /////////////////////////////////////-->

			
		</div>
		 <!-- PageNavigation Start... -->
		<jsp:include page="/common/pageNavigator_new.jsp"/>
		</div>
		</form>
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>