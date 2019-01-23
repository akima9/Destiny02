<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>AddComplainConfirm</title>
		<!-- 참조 : http://getbootstrap.com/css/   -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		<script type="text/javascript">
			$(function() {	
				var communityNo = ${community.communityNo};
				console.log(communityNo);
				var meetingNo = ${meeting.meetingNo};
				console.log(meetingNo);
				
				$( "button:contains('확인')" ).on("click" , function() {
					if(communityNo != 0){
						$("form").attr("method" , "POST").attr("action" , "/info/listRestaurantInfo").submit();
					}else if(meetingNo != 0){
						$("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting").submit();
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
			<h1>신고확인</h1>
		</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<%-- <input type="hidden" name="communityNo" value="${community.communityNo}"/> --%>
		
			<div class="row">
			
				<div class="col-xs-4 col-md-2"><strong>신고자</strong></div>
			  	<c:if test="${community.communityNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${community.communityNo} </div>
				</c:if>
				<c:if test="${meeting.meetingNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${meeting.meetingNo} </div>
				</c:if>
			</div>
				
			<hr/>
				
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>작성자</strong></div>
			  	<c:if test="${community.communityNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${community.writerId} </div>
				</c:if>
				<c:if test="${meeting.meetingNo != 0}">
					<div class="col-xs-8 col-md-4" name="complainType"> ${meeting.meetingMasterId} </div>
				</c:if>
			</div>
				
			<hr/>
			
			<div class="row">
				<%-- 게시글:제목 / 댓글:내용 / 모임:모임명 --%>
				<c:if test="${community.communityNo != 0}">
			  		<div class="col-xs-4 col-md-2"><strong>제목</strong></div>
				</c:if>
				<c:if test="${meeting.meetingNo != 0}">
			  		<div class="col-xs-4 col-md-2"><strong>모임명</strong></div>
				</c:if>
				<div class="col-xs-8 col-md-4" name="complainDetail"> ${complain.complainDetail} </div>
				
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
			
			<div class="form-group text-center">
				
				<button type="button" class="btn btn-default btn-lg" id="save">확인</button>
					
			</div>
			
		</form>
		
		
	
	</div>
	
</body>
</html>