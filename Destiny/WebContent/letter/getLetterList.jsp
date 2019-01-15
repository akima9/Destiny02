<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetLetterList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/user/getLetterList").submit();
	}
	
	$(function() {
		$(".ct_list_pop td:nth-child(8n+7)").on("click" , function() {
			var letterNo = $(this).data("param");
			
			self.location = "/user/getLetter?no="+letterNo;
			
		});
	});
	
	$(function() {
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 $("form").attr("method" , "POST").attr("action" , "/letter/sendletter.jsp").submit();
		});
	});
	
	</script>
	
</head>


<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
   		<h1 class="bg-primary text-center">쪽지함</h1>
   	
   		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		    <label for="senderId" class="col-sm-offset-1 col-sm-3 control-label">받은 쪽지함 ${totalReceiveCount}</label>
		    <div class="col-sm-4">
		      <span id="receiverId"></span>
		    </div>
		 </div>
		 
		 <table class="table table-hover table-striped" >
		 	<thead>
				<tr>
				 	<td class="ct_list_b" width="100">쪽지번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">발신자</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">발신일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">쪽지제목</td>
					<td class="ct_line02"></td>
				</tr>
			</thead>
			
			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="letter" items="${listReceive}">
					<c:set var="i" value="${ i+1 }" />
	
					<tr class="ct_list_pop">
					<td align="left">${letter.letterNo}</td>
					<td></td>		
					<td align="left">${letter.senderId}</td>
					<td></td>
					<td align="left">${letter.sendLetterDate}</td>
					<td></td>
					<td align="left" data-param="${letter.letterNo}">${letter.letterTitle}</td>
					<td></td>
			
				</c:forEach>
			</tbody>
			
			
		 </table>
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     	<button type="button" class="btn btn-primary"  >작&nbsp;성</button>
		    </div>
		  </div>
		 <!-- PageNavigation Start... -->
		<jsp:include page="/common/pageNavigator_new.jsp">
			<jsp:param value="Letter" name="type"/>
		</jsp:include>
		<!-- PageNavigation End... -->

	   </form>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
		  
	
</body>
</html>

