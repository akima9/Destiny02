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
	
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<script>
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getMeetingAct/${contextMeeting.meetingNo}").submit();
		}
		
		//============= 모임 가입 수락/거절  Event  처리=============
		 $(function() {
			//==>가입 수락
			$(".applyOK").on("click", function(){
				var meetingNo = $(this).data("param");
				var meetingMasterId = $(this).data("param1");
				alert("가입을 수락하시겠습니까?");
				self.location = "/act/judgmentApply/yes/"+meetingNo+"/"+meetingMasterId;
			});
			
			//==> 가입 거절
			$(".applyNO").on("click", function(){
				var meetingNo = $(this).data("param");
				var meetingMasterId = $(this).data("param1");
				
				alert("가입을 거절하시겠습니까?");
				self.location = "/act/judgmentApply/no/"+meetingNo+"/"+meetingMasterId;
			});
			 
		});	
		
	</script>
	<!-- //All js -->
	
			<style>

		body{
			position : relative;
			font-family: 'Nanum Myeongjo', serif;
		}
		.container{
			font-weight : 700;
		}
		.tumTitle{
			font-weight : 700;
		}
	
		.topImg{
			max-width : 100%;
			height : 400px;
			background-image : url("/resources/images/background/loveAdvice_background.jpg");
			background-position : center center;
			background-size : cover;
			background-repeat : no-repeat;
		}
		
		.topImg::after{
			content : "";
			background : rgba(0, 0, 0, 0.2);
			position : absolute;
			top : 0;
			left : 0;
			width : 100%;
			height : 400px;
		}
		
		.topImg h1{
			position : absolute;
			width : 100%;
			margin : 0;
			padding : 0;
			font-family: 'Nanum Myeongjo', serif;
			font-size : 60px;
			text-align : center;
			height : 400px;
			line-height : 450px;
			color : white;
			z-index : 99;
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		
		li{
			list-style-type : none;
		}
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -70px;
			margin-bottom : 60px;
		}
		
		.smallNavi li{
			float : left;
			margin-right : 20px;
			margin-top : 8em;
		}
		
		.homeImg{
			margin-top : -2px;
		}
		
		button{padding: 0 2em; height:30px;}
		
		/* table sytle 추가 */
		table{border-collapse:collapse; table-layout:fixed; margin-top:20px;}
		.table-type01{width:100%;}
		.table-type01 thead tr th{position:relative; padding:10px 5px; vertical-align:middle; text-align:center; border-top:2px solid #000; font-size:16px; font-weight:600;}
		.table-type01 thead tr th:before{content:''; position:absolute; top:50%; left:0; width:1px; height:20px; background:#DDD; transform:translateY(-50%);}
		.table-type01 thead tr th:first-child:before{display:none;}
		.table-type01 tbody tr td{padding:10px 5px; vertical-align:middle; text-align:center; border-bottom:1px solid #DDD; font-size:14px;}
		.table-type01 tbody tr td:nth-child(3){padding:10px 20px; vertical-align:middle; text-align:left; border-bottom:1px solid #DDD; font-size:14px;}
		.table-type01 tbody tr:first-child td{border-top:1px solid #DDD;}
		/* table sytle 추가 */
		
	
	</style>
	

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>모임 신청자 <span class="slim">조회</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
		
			<!-- 페이지 내부 네비게이션 경로 : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>마이페이지</li>
				<li>></li>
				<li>개설한 모임</li>
				<li>></li>
				<li>모임 신청자</li>
			</ul>
			<!-- 페이지 내부 네비게이션 경로 : end -->
			
			
			<div>
					<table class="row-table tablebm">
						<caption>테이블 설명</caption>
						
						<colgroup>
							<col style="width:50%;">
							<col style="width:20%;">
							<col style="width:30%;">
						</colgroup>
						
						<tbody>
							<tr>
								<td rowspan="5" background="/resources/images/meeting/${contextMeeting.titleImg}">
								</td>
								<th>모임명</th>
								<td>${contextMeeting.meetingName}</td>
							</tr>
							<tr>
								<th>관심사</th>
								<td>${contextMeeting.interestName}</td>
							</tr>
							<tr>
								<th>장소</th>
								<td>${contextMeetingAct.meetingLocation}</td>
							</tr>
							<tr>
								<th>날짜 / 시간</th>
								<td>${contextMeetingAct.meetingDate} / ${contextMeetingAct.meetingTime}</td>
							</tr>
							<tr>
								<th>모임정원</th>
								<td>${limit}명</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr/>
			
			
		
			<%-- <div>
				<img src="/resources/images/meeting/${contextMeeting.titleImg}" width="1050" height="300"/><br/><br/>
			
				<h4>모임 명 : ${contextMeeting.meetingName}</h4>
				<h4>회원 리미트 : ${limit}</h4>
				<br/><br/>
				
			</div> --%>
			
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			<%-- <form class="form-horizontal">
			  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			</form>
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			
			<div class="12u" style="clear:both;"> 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지</div> --%>
			<div>
				<h4>Message : ${reason}</h4>
				<br/><br/>
			</div>
			
			<!-- 테이블 리스트 : start -->
			<table class="table-type01">
	            <colgroup>
	                <col style="width:5%">
	                <col style="width:20%">
	                <col style="width:10%">
	                <col style="width:10%">
	                <col style="width:10%">
	                <col style="width:25%">
	                <col style="width:20%">
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>No</th>
	                    <th>프로필</th>
	                    <th>닉네임</th>
	                    <th>성별</th>
	                    <th>생년월일</th>
	                    <th>소개글</th>
	                    <th>수락 / 거절</th>
	                </tr>
	            </thead>
	    
	            <tbody>
	            
		            <c:if test="${listAPL[0] == null}">
	            		<tr>
	            			<td colspan="7"> 모임 신청자가 없습니다. </td>
	            		</tr>
	           		</c:if>
	            		
	            	<c:set var="i" value="0" />
	            	<c:forEach var="meeting" items="${listAPL}">
	            		<c:set var="i" value="${ i+1 }" />
	            		<tr>
	            			<td>${ meeting.meetingCrewNo }</td>
	            			<td>
	            				<img src="/resources/images/userprofile/${meeting.masterProfileImg}" width="100px" height="100px"/>
	            			</td>
	            			<td data-param="${meeting.meetingMasterId}">${meeting.crewNickName}</td>
	            			<td>
	            				<c:if test="${listAPLUser[i-1].gender eq 'M'}">남성</c:if>
	            				<c:if test="${listAPLUser[i-1].gender eq 'W'}">여성</c:if>
	            			</td>
	            			<td>${listAPLUser[i-1].birthday}</td>
	            			<td>
	            				<div class="panel panel-info">
								  <div class="panel-heading">
									<h3 class="panel-title">${meeting.interviewTitle}</h3>
								  </div>
								  <div class="panel-body">
									${meeting.interview}
								  </div>
								</div>
	            			</td>
	            			<td>
								<button type="button" class="applyOK" id="applyOK" data-param="${meetingNo}" data-param1="${meeting.meetingMasterId}">수락</button>
								<button type="button" class="applyNO" id="applyNO" data-param="${meetingNo}" data-param1="${meeting.meetingMasterId}">거절</button>
	            			</td>
	            		</tr>
	            		
	            	</c:forEach>
	            	
	            </tbody>
        	</table>
			<!-- 테이블 리스트 : end -->
			
			
			<!-- 테이블 리스트 : start -->
			<%-- <table class="table-type01">
	            <colgroup>
	                <col style="width:5%">
	                <col style="width:20%">
	                <col style="width:10%">
	                <col style="width:10%">
	                <col style="width:45%">
	                <col style="width:10%">
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>No</th>
	                    <th>프로필</th>
	                    <th>닉네임</th>
	                    <th>성별</th>
	                    <th>소개글</th>
	                    <th>수락 / 거절</th>
	                </tr>
	            </thead>
	    
	            <tbody>
	            
	            	<c:set var="i" value="0" />
	            	<c:forEach var="meeting" items="${listYES}">
	            		<c:set var="i" value="${ i+1 }" />
	            		<tr>
	            			<td>${ meeting.meetingCrewNo }</td>
	            			<td>
	            				<img src="/resources/images/userprofile/${meeting.masterProfileImg}" width="150" height="150"/>
	            			</td>
	            			<td data-param="${meeting.meetingMasterId}">${meeting.crewNickName}</td>
	            			<td>
	            				<c:if test="${listYESUser[i-1].gender eq 'M'}">남성</c:if>
	            				<c:if test="${listYESUser[i-1].gender eq 'W'}">여성</c:if>
	            			</td>
	            			<td>
	            				<div class="panel panel-info">
								  <div class="panel-heading">
									<h3 class="panel-title">${meeting.interviewTitle}</h3>
								  </div>
								  <div class="panel-body">
									${meeting.interview}
								  </div>
								</div>
	            			</td>
	            			<td>수락됨</td>
	            		</tr>
	            		
	            	</c:forEach>
	            	
	            </tbody>
        	</table> --%>
			<!-- 테이블 리스트 : end -->
			
			<%-- <!-- PageNavigation Start... -->
			<jsp:include page="/common/pageNavigator_new.jsp"/>
			<!-- PageNavigation End... --> --%>
		
		</div>
	</div>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>