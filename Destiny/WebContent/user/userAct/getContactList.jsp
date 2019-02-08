<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

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


<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

<script type="text/javascript">
	
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/act/getContactList").submit();
	}
	
	
	//============= userId 에 회원정보보기  Event  처리(Click) =============	
	 $(function() {
	
		$( "td:nth-child(3)" ).css("color" , "red");
		
	});	
	
	
	//============= userId 에 회원정보보기  Event  처리 (double Click)=============
	 $(function() {
		
		//==> userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> 아래와 같이 정의한 이유는 ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});	
	
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "button[id='writeStoryButton']" ).on("click" , function() {
		 	//var userId = $("input[name='getUserId']").val();
		 	var userId = "${me.userId}";
			self.location = "/act/addStoryView/DAT";
	    });
	});	
</script>

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
	.button{
		font-size : 16px;
		font-weight : 700;
	}
	.topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/notice02_background.jpg");
		background-repeat : no-repeat;
		background-position : center -500px;
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
		line-height : 330px;
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
	
	/*  .container{
		overflow : hidden;
	} */
	
	.smallNavi{
		overflow : hidden;
		float : right;
		margin-top : -80px;
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
	
	.viewSort{
		cursor : pointer;
	}
	
	.likeSort{
		cursor : pointer;
	}
	
	.noSort{
		cursor : pointer;
	}
	
	.thumbnail{
		cursor : pointer;
		padding : 20px;
	}
	
	.tumTitle{
		text-align : center;
	}
	
	.infoFirst, .infoSecond{
		overflow : hidden;
		padding-left : 0;
	}
	
	.infoFirst li, .infoSecond li{
		float : left;
	}
	
	.infoFirst li:last-child, .infoSecond li:last-child{
		float : right;
	}
	
	.caption p{
		text-align : center;
	}
	form{
		/* padding-top : 5em; */
		content:"";
		display:block;
		clear:both;
	}
	.search-group{
		width : 63%;
		text-align : right;
		content:"";
		display:block;
		clear:both;
		float : right;
	}
	select{
		width : 9em;
		font-family: 'Nanum Myeongjo', serif;
		font-weight : 700;
		margin-right : 1em;
		margin-top : 5px;
		float : left;
	}
	
	#searchKeyword{
		width : 20em;
		margin-top : 5px;
		float : left;
	}
</style>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
  	
  	
    
    <!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1><span class="slim">성사된 </span>채팅 <span class="slim">조회</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	<div class="container">
	
		<div class="wrap">
		
			<!-- 페이지 내부 네비게이션 경로 : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>마이페이지</li>
				<li>></li>
				<li>개설한 모임</li>
			</ul>
			<!-- 페이지 내부 네비게이션 경로 : end -->
			
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			<form>
				<div class="form-group search-group">
					<input type="hidden" id="currentPage" name="currentPage" value="">
				</div>
			</form>
			
			<div class="12u"> 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지</div>
			
			<!-- 테이블 리스트 : start -->
			<table class="table table-hover table-striped">
			
				<thead>
					<tr>
						<th align="center">No</th>
						<th align="center">상대방 프로필 사진</th>
						<th align="center">상대방 닉네임</th>
						<th align="center">채팅일</th>
						<th align="center">리뷰작성</th>
					</tr>
				</thead>
				
				<tbody>
					<c:set var="i" value="0"/>
					<c:forEach var="chatting" items="${list}">
						<c:set var="i" value="${i+1}"/>
						<tr>
							<td>
								<span>${ i }</span>
							</td>
							<td>
								<img src="/resources/images/userprofile/${fileList[i-1]}" width="150" height="150"/>
							</td>
							<c:if test="${me.userId eq chatting.manId}">
								<td>${chatting.womanId}</td>
							</c:if>
							<c:if test="${me.userId eq chatting.womanId}">
								<td>${chatting.manId}</td>
							</c:if>
							<td>
								<span>${chatting.chattingDate}</span>
							</td>
							<td>
								<span>
									<button id="writeStoryButton" type="button">리뷰 작성</button>
								</span>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			
			</table>
			<!-- 테이블 리스트 : end -->
		</div>
		
		<!-- PageNavigation : start -->
		<jsp:include page="/common/pageNavigator_new.jsp" />
		<!-- PageNavigation : end -->
	
	
	
	</div>

</body>
</html>