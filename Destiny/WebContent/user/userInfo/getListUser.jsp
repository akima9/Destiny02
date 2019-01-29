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
	<script>
		
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/user/listUser").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
		
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser/"+$(this).text().trim();
			});
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
										+'���̵� : '+JSONData.user.userId+'<br/>'
										+'��  �� : '+JSONData.user.nickName+'<br/>'
										+'�̸��� : '+JSONData.user.email+'<br/>'
										+'��  �� : '+JSONData.user.userGrade+'<br/>'
										+'�� ��  : '+JSONData.user.birthday+'<br/>'
									+'</h5>'
									+'</td>'
									+'<td colspan="2" class="userInfo" id="dd">'
									+'<h5>'
										+'������ �ش� ȸ�������� �Ѿ�ϴ�.'
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
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
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
				<h2>ȸ�������ȸ</h2>
			</header>
			
			<form class="form-horizontal">
			
			<div class="col-md-5">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    <hr class="major">
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			
				<!-- �˻� Start /////////////////////////////////////-->
				<div class="row uniform">
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<select  name="searchSortingOption">
								<option value="">�˻������� ������ �ּ���</option>
								<option value="0" ${! empty search.searchSortingOption && search.searchSortingOption==0 ? "selected" : ""}>�⺻</option>
								<option value="1" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
								<option value="2" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
								<option value="3" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>
								<option value="4" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>
							</select>
						</div>
					</div>
					
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<select  name="searchCondition" >
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
								<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ���г���</option>
							</select>
						</div>
					</div>
					
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<label class="sr-only" for="searchKeyword">�˻���</label>
				    		<input type="text"  id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
						</div>
					</div>
					
					<div class="3u$ 12u$(small)">
						<div class="select-wrapper">
							<button type="button" class="btn btn-default">�˻�</button>
						</div>
					</div>
					
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				</div>
				<!-- �˻� End /////////////////////////////////////-->
				
				
				<!-- List Start /////////////////////////////////////-->
				<div>
					<table class="row-table">
						<caption>���̺� ����</caption>
						
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
								<th>ȸ��ID</th>
								<th>�г���</th>
								<th>�̸���</th>
								<th>ȸ�����</th>
								<th>��������</th>
								
							</tr>
						</thead>
						
						<tbody>
							<c:set var="i" value="0"/>
							<c:forEach var="user" items="${list}">
								<c:set var="i" value="${i+1}"/>
								
								<tr>
									<td>${i}</td>
									<td title="Click:ȸ�� ���� Ȯ��"> ${user.userId}</td>
									<td>${user.nickName}</td>
									<td>${user.email}</td>
									
									<!-- ȸ����� �߰� -->
									<c:if test="${user.userGrade=='NEW'}">
										<td> �ű�ȸ�� </td>
									</c:if>
									<c:if test="${user.userGrade=='NOR'}">
										<td> �Ϲ�ȸ�� </td>
									</c:if>
									<c:if test="${user.userGrade=='VIP'}">
										<td> ���ȸ�� </td>
									</c:if>
									<c:if test="${user.userGrade=='ADM'}">
										<td> ������ </td>
									</c:if>
									<c:if test="${user.userGrade=='BLK'}">
										<td> ������Ʈ </td>
									</c:if>
									<!-- ȸ����� �߰� -->
									
									<td data-param="${user.userId}"> ��������</td>
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