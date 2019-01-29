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
	<script>
		
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/user/listUser").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
			 
			 $("input[name='searchKeyword']").keypress(function(e) {
				if(e.which == 13) {
					$(this).blur();
					$('button.btn.btn-default').focus().click();
				}
			});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser/"+$(this).text().trim();
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(6)" ).on("click" , function() {

				//var userId = $(this).next().val();
				var userId = $(this).data("param");
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								if($( "#"+userId+" #aa" ).html() != null){
									$("#aa").remove();
									$("#bb").remove();
									$("#cc").remove();
									$("#dd").remove();
									return;
								}
								
							
								var images = "";
									$.each( JSONData.filelist, function(i, v){
										images = "<img src='/resources/images/userprofile/"+v+"' width='200px' height='200px'/>"
									});
									
								var displayValue ='<td class="userInfo" id="aa"  ></td>'
									+'<td colspan="2" class="userInfo" id="bb"  >'
									+ images
									+'</td>'
									+'<td class="userInfo" id="cc">'
									+'<h5>'
										+'아이디 : '+JSONData.user.userId+'<br/>'
										+'이  름 : '+JSONData.user.nickName+'<br/>'
										+'이메일 : '+JSONData.user.email+'<br/>'
										+'등  급 : '+JSONData.user.userGrade+'<br/>'
										+'생 일  : '+JSONData.user.birthday+'<br/>'
									+'</h5>'
									+'</td>'
									+'<td colspan="2" class="userInfo" id="dd">'
									+'<h5>'
										+'누르면 해당 회원정보로 넘어갑니다.'
									+'</h5>'
									+'</td>';
								
								
									$("#aa").remove();
									$("#bb").remove();
									$("#cc").remove();
									$("#dd").remove();
								$( "#"+userId+"" ).html(displayValue);
								
								$('tr[id="'+userId+'"]').on("click", function(){
									self.location = "/user/getUser/"+userId;
								});
							}
					});
					////////////////////////////////////////////////////////////////////////////////////////////
				
			});
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
		});	
	
	
	</script>
	<!-- //All js -->
	
	<style>
		.userInfo {vertical-align: middle; background-color: #F8E6E0; }
	</style>
	
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h2>회원목록조회</h2>
			</header>
			
			<form class="form-horizontal">
			
			<div class="col-md-5">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    <hr class="major">
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			
				<!-- 검색 Start /////////////////////////////////////-->
				<div class="row uniform">
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<select  name="searchSortingOption">
								<option value="">검색종류를 선택해 주세요</option>
								<option value="0" ${! empty search.searchSortingOption && search.searchSortingOption==0 ? "selected" : ""}>기본</option>
								<option value="1" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>출석일수 낮은순(이 페이지)</option>
								<option value="2" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>출석일수 높은순(이 페이지)</option>
								<option value="3" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>출석일수 낮은순(전체)</option>
								<option value="4" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>출석일수 높은순(전체)</option>
							</select>
						</div>
					</div>
					
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<select  name="searchCondition" >
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
								<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원닉네임</option>
							</select>
						</div>
					</div>
					
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<label class="sr-only" for="searchKeyword">검색어</label>
				    		<input type="text"  id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
						</div>
					</div>
					
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<button type="button" class="btn btn-default">검색</button>
						</div>
					</div>
					
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				</div>
				<!-- 검색 End /////////////////////////////////////-->
				
				
				<!-- List Start /////////////////////////////////////-->
				<div>
					<table class="row-table">
						<caption>테이블 설명</caption>
						
						<colgroup>
							<col style="width:5%;">
							<col style="width:15%;">
							<col style="width:15%;">
							<col style="width:30%;">
							<col style="width:20%;">
							<col style="width:15%;">
						</colgroup>
						
						<thead>
							<tr>
								<th>No</th>
								<th>회원ID</th>
								<th>닉네임</th>
								<th>이메일</th>
								<th>회원등급</th>
								<th>간략정보</th>
								
							</tr>
						</thead>
						
						<tbody>
							<c:set var="i" value="0"/>
							<c:forEach var="user" items="${list}">
								<c:set var="i" value="${i+1}"/>
								
								<tr>
									<td>${i}</td>
									<td title="Click:회원 정보 확인"> ${user.userId}</td>
									<td>${user.nickName}</td>
									<td>${user.email}</td>
									
									<!-- 회원등급 추가 -->
									<c:if test="${user.userGrade=='NEW'}">
										<td> 신규회원 </td>
									</c:if>
									<c:if test="${user.userGrade=='NOR'}">
										<td> 일반회원 </td>
									</c:if>
									<c:if test="${user.userGrade=='VIP'}">
										<td> 우수회원 </td>
									</c:if>
									<c:if test="${user.userGrade=='ADM'}">
										<td> 관리자 </td>
									</c:if>
									<c:if test="${user.userGrade=='BLK'}">
										<td> 블랙리스트 </td>
									</c:if>
									<!-- 회원등급 추가 -->
									
									<td data-param="${user.userId}"> 간략보기</td>
								</tr>
							
								<tr id="${user.userId}" colspan="6" height="1" >
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</form>
		</div>
		
		<!-- pageNavigator -->
		<jsp:include page="/common/pageNavigator_new.jsp"/>	
		<!-- pageNavigator -->
		
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
</body>
</html>