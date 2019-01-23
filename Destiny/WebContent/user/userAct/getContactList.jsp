<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getContactList").submit();
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
			/*$( "td:nth-child(3)" ).on("click" , function() {
				 self.location ="/info/getRestaurantInfo?communityNo="+$(this).data("param");
			});*/
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(3)" ).css("color" , "red");
			
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			/* 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5)" ).on("click" , function() {

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
			*/
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[id='writeStoryButton']" ).on("click" , function() {
			 	//var userId = $("input[name='getUserId']").val();
			 	var userId = "${me.userId}";
				self.location = "/act/addStoryView";
		    });
		});
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  <!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>����� ä�ø����ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			     <div class="form-group">
				  	<select  class="form-control" name="searchSortingOption">
						<!--  <option value="0" ${! empty search.searchSortingOption && search.searchSortingOption==0 ? "selected" : ""}>�⺻</option>
						<option value="1" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
						<option value="2" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
						<option value="3" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>
						<option value="4" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>-->
					</select>
				  </div>
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<!-- <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ���г���</option> -->
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">���� ������ ����</th>
            <th align="left">���� �г���</th>
            <th align="left">ä����</th>
            <th align="left">�����ۼ�</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="chatting" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ chatting.chattingNo }</td>
			  <td align="left">
			  	<c:forEach var="file" items="${fileList}" >
					<c:set var="i" value="${ i+1 }" />
						   <img src="/resources/images/userprofile/${file}" width="150" height="150"/>
				</c:forEach>
			  </td>	
			  
			  <c:if test="${me.userId eq chatting.manId}">
			  	<td align="left">${chatting.womanId}</td>
			  </c:if>
			  <c:if test="${me.userId eq chatting.womanId}">
			  	<td align="left">${chatting.manId}</td>
			  </c:if>
			  
			  <td align="left">${chatting.chattingDate}</td>
			  <td align="left"><button id="writeStoryButton" type="button">���� �ۼ�</button></td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="/common/pageNavigator_new.jsp"/>
		
	<!-- PageNavigation End... -->
	
</body>

</html>