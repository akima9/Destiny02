<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>우리들의 연결고리</title>
		<!-- 참조 : http://getbootstrap.com/css/   -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
			$(function() {
				
				$( "#okBtn" ).on("click" , function() {
					history.go(-1);
				});
				
				$( "#okBtn" ).on("click" , function() {
					self.location = "/complain/listComplain"
				});
				
				$( "#doComplainBtn" ).on("click", function(){
					var complainNo = ${complain.complainNo}
					console.log(complainNo);
					
					var displayValue = '<div class="row">\n'
				  		+'<div class="col-xs-4 col-md-2"><strong>신고처리</strong></div>\n'
				  		+'<div class="col-xs-8 col-md-4" id="complainCondition">\n'
				  		+'	<input type="radio" class="complainCondition" name="complainCondition" value="NOT">무고</input>\n'
				  		+'	<input type="radio" class="complainCondition" name="complainCondition" value="WAR">경고</input>\n'
				  		+'	<input type="radio" class="complainCondition" name="complainCondition" value="BLK">블랙리스트</input>\n'
				  		+'</div>\n'
				  		+'</div>\n'
				  		+'<hr/>\n'
				  		+'<div class="form-group text-center">\n'
				  		+'	<button type="button" class="btn btn-default btn-mg" id="endBtn" onClick="okComplainBtn()">확인</button>\n'
				  		+'</div>\n'
				  		
				  	$('.doComplain').append(displayValue);
				  	$('#doComplainBtn').hide();
				  	$('#okBtn').hide();
			  		
				});
			});
			

			function okComplainBtn(){
				
				var complainNo = ${complain.complainNo}
				console.log('okComplainBtn : ' + complainNo);
				var complainCondition = '';
				
				complainCondition = $('.complainCondition:checked').val()
				console.log('complainCondition : ' + complainCondition);
				
				$.ajax(
						{
					method : "GET",
					url : '/complain/json/updateComplain/'+complainNo+'/'+complainCondition,
					success : function(JSONData){
						var complainState = JSONData.complainState;
						var complainCondition = JSONData.complainCondition;
						console.log(complainState);
						console.log(complainCondition);
						
						$('#complainState').html("${complainState=='Y' ? '신고처리 대기중':'신고처리 완료'}");
						
						if(complainCondition=="NOT"){
							$('#complainCondition').html('<div class="col-xs-8 col-md-4">무죄</div>');
						}else if(complainCondition=="WAR"){
							$('#complainCondition').html('<div class="col-xs-8 col-md-4">경고</div>');
						}else if(complainCondition=="BLK"){
							$('#complainCondition').html('<div class="col-xs-8 col-md-4">블랙리스트</div>');
						}
						
						
						$('#endBtn').hide();
						$('#okBtn').show();
						
					}
				});
			}
			
			$(function() {
				
				/* 글 제목 마우스 오버 : start */
				$(".getComplainLink").on("mouseover",function(){
					$(".getComplainLink").css("cursor","pointer")
				});
				/* 글 제목 마우스 오버 : end */
				
				/* 글 제목 클릭 : start */
				$(".getComplainLink").on("click", function(){
					var communityNo = $(this).data("param");
					var meetingNo = $(this).data("param1");
					
					if(meetingNo == null){
						/* if(${community.category == "RES"}){
							self.location="/info/getRestaurantInfo?communityNo="+communityNo
						}  */
						
						self.location="/info/getRestaurantInfo?communityNo="+communityNo


						
					}else if(communityNo == null){
						self.location="/meeting/getMeeting?meetingNo="+meetingNo
					}
					
				});
				
			});
			
			
		</script>
		
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">
	
		<div class="row text-center">
			<h1>신고처리</h1>
		</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="category" value="${community.category}"/>
			<hr/>
			<div class="row">
				<div class="col-xs-4 col-md-2"><strong>신고처리상태</strong></div>
				<div class="col-xs-8 col-md-4" name="complainState" id="complainState">
				 	${complain.complainState=='N' ? "신고처리 대기중":"신고처리 완료"}
				 </div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>신고날짜</strong></div>
				<div class="col-xs-8 col-md-4" name="complainDate"> ${complain.complainDate}  </div>
			</div>
				
			<hr/>
		
			<div class="row">
				<div class="col-xs-4 col-md-2"><strong>신고자</strong></div>
				<div class="col-xs-8 col-md-4" name="complainType"> ${complain.complainerId} ( ${user.warningCount} )</div>
			</div>
				
			<hr/>
				
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>작성자</strong></div>
				<div class="col-xs-8 col-md-4" name="complainType"> ${complain.defendantId} (${user.warningCount}) </div>
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- 게시글:제목 / 댓글:내용 / 모임:모임명 --%>
				<c:if test="${complain.complainKind == 'BD'}">
			  		<div class="col-xs-4 col-md-2"><strong>제목</strong></div>
			  		<div class="col-xs-8 col-md-4" name="complainDetail" data-param="${complain.communityNo}" value="${community.category}"> 
			  			<a href="/info/getRestaurantInfo?communityNo=${complain.communityNo}" target=“_blank”>${complain.complainDetail}</a>
			  		</div>
				</c:if>
				<c:if test="${complain.complainKind == 'MT'}">
			  		<div class="col-xs-4 col-md-2"><strong>모임명</strong></div>
			  		<div class="col-xs-8 col-md-4 getComplainLink" name="complainDetail" data-param="${complain.meetingNo}">
			  		 	<a href="/meeting/getMeeting?meetingNo=${complain.meetingNo}" target=“_blank”>${complain.complainDetail}</a>
			  		</div>
				</c:if>
				
				
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- 게시글:제목 / 댓글:내용 / 모임:모임명 --%>
		  		<div class="col-xs-4 col-md-2"><strong>신고사유</strong></div>
				<div class="col-xs-8 col-md-4">
					<c:if test="${complain.complainType == 'FKU'}"> 욕설/비방 </c:if>
					<c:if test="${complain.complainType == 'SEX'}"> 음란 </c:if>
					<c:if test="${complain.complainType == 'ADV'}"> 스팸/광고 </c:if>
					<c:if test="${complain.complainType == 'ETC'}"> 기타 </c:if>
				</div>
			</div>
			
			<hr/>
			
			<div class="row">
				<%-- 게시글:제목 / 댓글:내용 / 모임:모임명 --%>
		  		<div class="col-xs-4 col-md-2"><strong>신고내용</strong></div>
				<div class="col-xs-8 col-md-4">${complain.complainText}</div>
			</div>
			
			<hr/>
			
			<div class="row doComplain">
			</div>
			
			<div class="form-group text-center">
				<c:if test="${complain.complainState=='N'}">
					<button type="button" class="btn btn-default btn-mg" id="doComplainBtn">신고처리</button>
					<button type="button" class="btn btn-default btn-mg" id="okBtn">확인</button>
				</c:if>
				<c:if test="${complain.complainState=='Y'}">
					<button type="button" class="btn btn-default btn-mg" id="okBtn">확인2</button>
				</c:if>
			</div>
			
			
		</form>
		
		
	
	</div>
</body>

</html>