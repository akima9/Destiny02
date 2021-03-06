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
				/* 글 제목 클릭 : end */
				
				$( "button:contains('확인')" ).on("click" , function() {
					alert("처리를 완료하시겠습니까?");
					$("form").attr("method" , "POST").attr("action" , "/complain/updateComplain?complainNo=${complain.complainNo}").submit();
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
		<input type="hidden" name="complainNo" value="${complain.complainNo}"/>
		<input type="hidden" name="defendantId" value="${complain.defendantId}"/>
		
			<hr/>
			<div class="row">
				<div class="col-xs-4 col-md-2"><strong>신고처리상태</strong></div>
				<div class="col-xs-8 col-md-4" name="complainState">
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
			  		<div class="col-xs-8 col-md-4 getComplainLink" name="complainDetail" data-param="${complain.communityNo}"> ${complain.complainDetail} </div>
				</c:if>
				<c:if test="${complain.complainKind == 'MT'}">
			  		<div class="col-xs-4 col-md-2"><strong>모임명</strong></div>
			  		<div class="col-xs-8 col-md-4 getComplainLink" name="complainDetail" data-param1="${complain.meetingNo}"> ${complain.complainDetail} </div>
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
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>신고처리</strong></div>
				<div class="col-xs-8 col-md-4">
					<input type="radio" class="complainCondition" name="complainCondition" value='NOT'>무고</input>
					<input type="radio" class="complainCondition" name="complainCondition" value='WAR'>경고</input>
					<input type="radio" class="complainCondition" name="complainCondition" value='BLK'>블랙리스트</input>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group text-center">
				<button type="button" class="btn btn-default btn-mg">확인</button>
			</div>
			
		</form>
		
		
	
	</div>
	
</body>
</html>