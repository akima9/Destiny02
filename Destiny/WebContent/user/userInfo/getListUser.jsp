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
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
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

								if($( "#"+userId+" h3" ).html() != null){
									$("h3").remove();
									$("h2").remove();
									return;
								}
								
								var displayValue = "<h3>"
									+"���̵� : "+JSONData.user.userId+"<br/>"
									+"��  �� : "+JSONData.user.nickName+"<br/>"
									+"�̸��� : "+JSONData.user.email+"<br/>"
									+"��  �� : "+JSONData.user.userGrade+"<br/>"
									+"�� ��  : "+JSONData.user.birthday+"<br/>"
									+"������ �ش� ȸ�������� �Ѿ�ϴ�.</h3>";
								
								var images = "<h2>";
								$.each( JSONData.filelist, function(i, v){
									//alert(v);
									//images += "<img src='/images/uploadFiles/"+v+"' width='170' height='170'/>"
									//images += "<img src='/mtdata/product/imgfiles/"+v+"' width='170' height='170'/>"
									images += "<img src='/resources/images/userprofile/"+v+"' width='170' height='170'/>"
								});
								
								images += "</h2>";
								displayValue += images;
								
								
								$("h3").remove();
								$("h2").remove();
								$( "#"+userId+"" ).html(displayValue);
								
								$('td[id="'+userId+'"] h3').on("click", function(){
									self.location = "/user/getUser/"+userId;
								});
							}
					});
					////////////////////////////////////////////////////////////////////////////////////////////
				
			});
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	
	</script>
<!-- //All js -->
	
	
	<style>
		body {
            padding-top : 50px;
        }
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
		
		<h3>ȸ�������ȸ</h3>
		
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

				
				
			    
			     <div class="3u">
				  	<select  name="searchSortingOption">
						<option value="0" ${! empty search.searchSortingOption && search.searchSortingOption==0 ? "selected" : ""}>�⺻</option>
						<option value="1" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
						<option value="2" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
						<option value="3" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>
						<option value="4" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>
					</select>
				  </div>
				  
				
			    
				  <div class="3u">
				    <select  name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ���г���</option>
					</select>
				  </div>
				  
				  <div class="3u">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text"  id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  <div class="3u">
					  <button type="button" class="btn btn-default">�˻�</button>
				  </div>
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				

				
				 <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">ȸ�� ID</th>
            <th align="left">�г���</th>
            <th align="left">�̸���</th>
            <th align="left">ȸ�����</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : ȸ������ Ȯ��">${user.userId}</td>
			  <td align="left">${user.nickName}</td>
			  <td align="left">${user.email}</td>
			  
			  <!-- ȸ����� �߰� -->
			  <c:if test="${user.userGrade=='NEW'}">
			  	<td align="left">�ű�ȸ��</td>
			  </c:if>
			  <c:if test="${user.userGrade=='NOR'}">
			  	<td align="left">�Ϲ�ȸ��</td>
			  </c:if>
			  <c:if test="${user.userGrade=='VIP'}">
			  	<td align="left">���ȸ��</td>
			  </c:if>
			  <c:if test="${user.userGrade=='ADM'}">
			  	<td align="left">������</td>
			  </c:if>
			  <c:if test="${user.userGrade=='BLK'}">
			  	<td align="left">������Ʈ</td>
			  </c:if>
			  <!-- ȸ����� �߰� -->
			  
			  <td align="left" data-param="${user.userId}">������ ����</td>
			  <tr>
				 <td id="${user.userId}" colspan="11" height="1"></td>
				 <td id="${user.userId}2"  ></td>
			  </tr>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
		
			</div>
			
		</div>
		</form>
		</div>
	<jsp:include page="/common/pageNavigator_new.jsp"/>	
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
	
</body>
</html>