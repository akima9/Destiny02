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
	<!--  템플릿 사용하기 위해 필요한 js -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getWriteCommentList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/info/getRestaurantInfo?communityNo="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
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
		
			<h3>작성한 댓글목록조회</h3>
		
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			
			<div class="col-md-6 text-left">
				<p class="text-primary">
					전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
				</p>
			</div>

			<br/>
			
				<div class="box alt">
					<div class="row 50% uniform">

					
					
					
					 
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
						<!--  table Start /////////////////////////////////////-->
					  <table class="table table-hover table-striped" >
					  
						<thead>
						  <tr>
							<th align="center">No</th>
							<th align="left">개시글</th>
							<th align="left">작성자 닉네임</th>
							<th align="left">댓글 내용</th>
							<th align="left">작성일</th>
						  </tr>
						</thead>
					   
						<tbody>
						
						  <c:set var="i" value="0" />
						  <c:forEach var="comment" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr>
							  <td align="center">${ comment.commentNo }</td>
							  <td align="left"  title="Click : 개시글 이동">${comment.commentComuNo}</td>
							  <td align="left">${comment.commentWriterId}</td>
							  <td align="left">${comment.commentDetail}</td>
							  <td align="left">${comment.commentDate}</td>
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