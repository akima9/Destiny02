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
	
	
	
	
	<script type="text/javascript">
		$(function() {
			
			/* $("button:contains('신고하기')").on("click", function() {
				alert("신고하시겠습니까?");
				$("form").attr("method" , "POST").attr("action" , "/complain/addComplain").submit();
			});		
			
			$( "button:contains('취소')" ).on("click" , function() {
				 history.go(-1);
			}); */
			
			// select 조건
			$("a[name='save']").on("click", function() {
				if( $('select[name="complainType"]').val() == 0 ) {
					alert('신고 사유를 선택해 주세요.');
				} else {
					$("form").attr("method" , "POST").attr("action" , "/complain/addComplain").submit();
				}
			});		
			
			$( "a[name='cancle']" ).on("click" , function() {
				 history.go(-1);
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
			display : block;
			position : absolute;
			top : 0;
			background-image : url("/resources/images/background/complainbg.jpg");
			background-repeat : no-repeat;
			background-position : center -280px;
			background-size : cover;
			width : 100%;
			height : 400px;
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
			line-height : 450px;
			width : 100%;
			text-align : center;
			color : white;
			z-index : 99;
			font-size : 60px;
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		.wrap{
			margin-top : 400px;
		}
		
		li{
			list-style-type : none;
		}
		
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -30px;
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
		
		section.wrapper, article.wrapper {
	    	padding: 500px 0;
		}
	
	</style>
	

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>신고<span class="slim">하기</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
				<input type="hidden" name="communityNo" value="${community.communityNo}"/>
				<input type="hidden" name="writerId" value="${ community.writerId }">
				<input type="hidden" name="title" value="${ community.title }">
				<input type="hidden" name="meetingNo" value="${ meeting.meetingNo }">
				<input type="hidden" name="meetingMasterId" value="${ meeting.meetingMasterId }">
				<input type="hidden" name="meetingName" value="${ meeting.meetingName }">
				
				<div>
					<table class="row-table">
						<caption>테이블 설명</caption>
						
						<colgroup>
							<col style="width:20%;">
							<col style="width:30%;">
							<col style="width:30%;">
							<col style="width:30%;">
						</colgroup>
						
						<thead class="hide">
							<tr>
								<th>구분</th>
								<td>내용</td>
							</tr>
						</thead>
						
						<tbody>
						
							<tr>
								<th>신고자</th>
								<td>
									<c:if test="${community.communityNo != 0}">
										<div class="6u$ 12u$(small)" name="complainType"> ${me.userId} </div>
									</c:if>
									<c:if test="${meeting.meetingNo != 0}">
										<div class="6u$ 12u$(small)" name="complainType"> ${meeting.meetingNo} </div>
									</c:if>
								</td>
								<th>작성자</th>
								<td>
									<c:if test="${community.communityNo != 0}">
										<div class="6u$ 12u$(small)" name="complainType"> ${community.writerId} </div>
									</c:if>
									<c:if test="${meeting.meetingNo != 0}">
										<div class="6u$ 12u$(small)" name="complainType"> ${meeting.meetingMasterId} </div>
									</c:if>
								</td>
							</tr>
							
							<tr>
								<c:if test="${community.communityNo != 0}">
									<th>제목</th>
									<td colspan="3">
										<div class="6u$ 12u$(small)" name="complainDetail"> ${community.title} </div>
									</td>
								</c:if>
								<c:if test="${meeting.meetingNo != 0}">
									<th>제목</th>
									<td colspan="3">
										<div class="6u$ 12u$(small)"  name="complainDetail"> ${meeting.meetingName} </div>
									</td>
								</c:if>
							</tr>
							
							<tr>
								<th>신고사유</th>
								<td colspan="3">
									<div class="row uniform">
										<div class="6u$ 12u$(small)">
											<div class="select-wrapper">
												<select name="complainType" id="complainType">
													<option value="">신고사유를 선택해주세요.</option>
													<option value="FKU">욕설/비방</option>
													<option value="SEX">음란</option>
													<option value="ADV">스팸/광고</option>
													<option value="ETC">기타</option>
												</select>
											</div>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>신고내용</th>
								<td colspan="3">
									<input name="complainText" type="text" placeholder="신고내용을 입력해주세요.">
								</td>
							</tr>
							
							
						</tbody>
					</table>
					
					<ul class="actions align-center">
						<li><a href="#" class="button" name="cancle">취소</a></li>
						<li><a href="#" class="button special" name="save">신고하기</a></li>
					</ul>
				</div>
			</form>
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>