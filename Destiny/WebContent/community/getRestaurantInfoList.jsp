<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우리들의 연결고리</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">



</head>



<script type="text/javascript">

var userId = "${me.userId}";
console.log("userId : "+userId);

/* function fncGetList(currentPage){
	$("#currentPage").val(currentPage)
	$("form").attr("method","POST").attr("action","/info/listRestaurantInfo").submit();
} */


$(function() {
	
	
	/* 무한스크롤 : start */
	var currentPage = 0;
	
	function fncNextList(searchCondition, searchKeyword){
		console.log("fncNextList메소드로는 가나?")
		currentPage++;
		$.ajax({
			url : "/info/json/listRestaurantInfo",
			method : "post",
			async : false,
			dataType : "json",
			data : JSON.stringify({
				currentPage : currentPage,
				searchCondition : searchCondition,
				searchKeyword : searchKeyword
			}),
			headers : {
				"Accept" : "application/json",
				"Content-type" : "application/json"
			},
			success : function(JSON){
				var list = "";
				for ( var i in JSON.list) {
					var community = JSON.list[i];
					console.log("writeDate : "+community.writeDate);
					list += '<div class="col-sm-6 col-md-4 giyong">';
					list += '<div class="thumbnail headline" data-param="'+community.communityNo+'">';
					list += '<div style="width:100%;height:300px;background:url(\'../resources/images/uploadImg/'+community.fileName+'\');background-size:cover;background-position : center center;"></div>';
					list += '<div class="caption">';
					list += '<h3 class="tumTitle">'+community.title+'</h3>';
					list += '<p>'+community.writeDate+'</p>';
					list += '<ul class="infoFirst">';
					list += '<li>'+community.writerNickName+'</li>';
					list += '<li><span>조회수</span> : '+community.views+'</li>';
					list += '</ul>';
					list += '<ul class="infoSecond">';
					if(community.userGrade == 'NEW'){
						list += '<li>신규회원</li>';	
					}
					if(community.userGrade == 'NOR'){
						list += '<li>일반회원</li>';	
					}
					if(community.userGrade == 'VIP'){
						list += '<li>우수회원</li>';	
					}
					if(community.userGrade == 'ADM'){
						list += '<li>관리자</li>';	
					}
					list += '<li><span>공감수</span> : '+community.like+'</li>';
					list += '</ul></div></div></div>';
				}
				
				/* $(".rowList").html($(".rowList").html()+list); */
				
				$(".rowList").html($(".rowList").html()+list);
				/* $(".giyong").hide();
				$(".giyong").fadeIn(1000); */
				
				init();
			}
		});
	}
	
	/* 썸네일 클릭 : start */
	function init(){
		$(".thumbnail").on("click", function(){
			if(userId == ""){
				$("#my-dialog,#dialog-background").toggle();
			}
			else{
				var communityNo = $(this).data("param")
				self.location="/info/getRestaurantInfo?communityNo="+communityNo	
			}
		});
	};
	/* 썸네일 클릭 : end */
	
	$(function(){
		while ($(document).height()==$(window).height() && currentPage < $("input:hidden[name='maxPage']").val()) {
			fncNextList();
		}
	});
	
	$(window).scroll(function(){
		if (currentPage < $("input:hidden[name='maxPage']").val()) {
			if ($(window).scrollTop()==$(document).height()-$(window).height()) {
				var searchCondition = $('select[name=searchCondition]').val();
				var searchKeyword = $('#searchKeyword').val();
				fncNextList(searchCondition, searchKeyword);
			}
		}
	});
	/* 무한스크롤 : end */
	
	$("#searchKeyword").keypress(function(e) {
		if(e.which == 13) {
			$(this).blur();
			$(".button:contains('검색')").focus().trigger('click');
			return false;
		}
	});
	
	/* 검색 버튼 : start */
	$(".button:contains('검색')").on("click", function(){
		var searchCondition = $('select[name=searchCondition]').val();
		var searchKeyword = $('#searchKeyword').val();
		alert("searchCondition : "+searchCondition);
		alert("searchKeyword : "+searchKeyword);
		currentPage = 0;
		$(".rowList").empty();
		fncNextList(searchCondition, searchKeyword);
	});
	/* 검색 버튼 : end */
	
	/* 글쓰기 버튼 : start */
	$("button:contains('글쓰기')").on("click", function() {
		if(userId == ""){
			$("#my-dialog,#dialog-background").toggle();
		}
		else{
			self.location = "/info/addRestaurantInfo"	
		}
	});
	/* 글쓰기 버튼 : end */
	
	/////////////아래는 리스트형////////////////////////////아래는 리스트형////////////////////////////아래는 리스트형///////////////
	
	/* 정렬 선택 : start*/
	/* $('.sort-control').change(function(){
		alert("정렬 선택!");
		var state = $('.sort-control option:selected').val();
		self.location="/info/listRestaurantInfo?searchSortingOption="+state+"&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"					
	}); */
	/* 정렬 선택 : end */
		
	/* 글 제목 마우스 오버 : start */
	/* $(".getRestaurantLink").on("mouseover",function(){
		$(".getRestaurantLink").css("cursor","pointer")
	}); */
	/* 글 제목 마우스 오버 : end */
	
	/* 글 제목 클릭 : start */
	/* $(".getRestaurantLink").on("click", function(){
		if(userId == ""){
			alert("로그인 후 이용 가능합니다.");
			$("#my-dialog,#dialog-background").toggle();
		}
		else{
			var communityNo = $(this).data("param")
			self.location="/info/getRestaurantInfo?communityNo="+communityNo	
		}
	}); */
	/* 글 제목 클릭 : end */
		
	/* 조회수 클릭 : start */
	/* $("th:contains('조회')").on("click", function(){
		self.location="/info/listRestaurantInfo?viewSort=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"
	}); */
	/* 조회수 클릭 : end */
	
	/* 공감수 클릭 : start */
	/* $("th:contains('공감')").on("click", function(){
		self.location="/info/listRestaurantInfo?likeSort=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"
	}); */
	/* 공감수 클릭 : end */
	
	/* 글번호 클릭 : start */
	/* $("th:contains('글번호')").on("click", function(){
		self.location="/info/listRestaurantInfo?noSort=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"
	}); */
	/* 글번호 클릭 : end */
	
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
	/* .topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/getRestaurantInfo07_background.jpg");
		background-repeat : no-repeat;
		background-position : center -400px;
		background-size : cover;
		width : 100%;
		height : 400px;
	} */
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/getRestaurantInfo_background.jpg");
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
	/* .topImg h1{
		position : absolute;
		line-height : 330px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 99;
		font-size : 60px;
		font-family: 'Nanum Myeongjo', serif;
	} */
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
		text-align : right;
		width : 800px;
		float : right;
	}
	select{
		width : 20%;
		font-family: 'Nanum Myeongjo', serif;
		font-weight : 700;
		float:left;
		margin-right : 1em;
		margin-top : 5px;
	}
	#searchKeyword{
		width : 50%;
		float:left;
		margin-top : 5px;
	}
	.filter{
		width : 50%;
		overflow : hidden;
		float : right;
	}
	.filter .searchCondition{
		width : 21%;
	}
	.filter button{
		float : right;
	}
	
	
	/* 빵메뉴 안맞아서 따로 만듬^^ */
	.fa{
		line-height : 50px;
	}
</style>
	


<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->

    <!-- 메인배경이미지 : start -->
   	<div class="topImg">
		<h1>맛집정보</h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	<div class="container">
	
		<div class="wrap">
		
		<!-- 페이지 내부 네비게이션 경로 : start -->
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>스토리</li>
			<li>></li>
			<li>맛집정보</li>
		</ul>
		<!-- 페이지 내부 네비게이션 경로 : end -->
		
		<form>
			<div class="filter">
			    <select class="searchCondition" name="searchCondition" >
					<option value="0"
						${ !empty search.searchCondition && search.searchCondition=="0" ? "selected" : ""}>제목으로 검색</option>
					<option value="1"
						${ !empty search.searchCondition && search.searchCondition=="1" ? "selected" : ""}>작성자로 검색</option>
				</select>
			    <label class="sr-only" for="searchKeyword">검색어</label>
				<input type="text" id="searchKeyword" name="searchKeyword"  placeholder="검색어를 입력해주세요."
			    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" autocomplete=off>
				<button type="button" class="button">검색</button>
				  
				<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				<input type="hidden" id="currentPage" name="currentPage" value="">
				
			</div>
			
			<div class="form-group text-left">
				<button type="button" class="button">글쓰기</button>
			</div>
			
		</form>
	
		<input type="hidden" name="maxPage" value="${resultPage.maxPage }">
		
		<%-- <div class="form-group">
			<select class="sort-control" name="searchCondition" >
				<option value="0"
					${ !empty search.searchSortingOption && search.searchSortingOption=="0" ? "selected" : ""}>최신 게시물 순</option>
				<option value="1"
					${ !empty search.searchSortingOption && search.searchSortingOption=="1" ? "selected" : ""}>조회수 순</option>
				<option value="2"
					${ !empty search.searchSortingOption && search.searchSortingOption=="2" ? "selected" : ""}>공감수 순</option>
				<option value="3"
					${ !empty search.searchSortingOption && search.searchSortingOption=="3" ? "selected" : ""}>이전 게시물 순</option>
			</select>
		</div> --%>
		
		<!-- <div class="form-group text-left">
			<button type="button" class="button">글쓰기</button>
		</div> -->
		
		<!-- 썸네일 리스트 : start -->
		<%-- <div class="row">
		<c:set var="i" value="0"/>
			<c:forEach var="community" items="${list}">
			<c:set var="i" value="${i+1}"/>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail" data-param="${ community.communityNo }">
					<img src="../resources/images/uploadImg/${community.fileName}" alt="대표이미지">
				    <div class="caption">
				    	<h3 class="tumTitle">${community.title}</h3>
				    	<p>${community.writeDate}</p>
				    	<ul class="infoFirst">
				    		<li>${community.writerNickName }</li>
				    		<li><span>조회수</span> : ${community.views }</li>
				    	</ul>
				    	<ul class="infoSecond">
				    		<c:if test="${community.userGrade == 'NEW'}">
				    			<li>신규회원</li>
				    		</c:if>
				    		<c:if test="${community.userGrade == 'NOR'}">
				    			<li>일반회원</li>
				    		</c:if>
				    		<c:if test="${community.userGrade == 'VIP'}">
				    			<li>우수회원</li>
				    		</c:if>
				    		<c:if test="${community.userGrade == 'ADM'}">
				    			<li>관리자</li>
				    		</c:if>
				    		<li><span>공감수</span> : ${community.like }</li>
				    	</ul>
				    </div>
				</div>
			</div>
		</c:forEach>
		</div> --%>
		
		<div class="rowList"></div>
		
		<!-- 썸네일 리스트 : end -->
		
		<!-- 테이블 리스트 : start -->
		<%-- <table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th aligin="center" class="noSort">글번호▼</th>
					<th aligin="center">제목</th>
					<th aligin="center">작성자</th>
					<th aligin="center">작성일</th>
					<th aligin="center" class="viewSort">조회▼</th>
					<th aligin="center" class="likeSort">공감▼</th>
				</tr>
			</thead>
			
			<tbody>
				<c:set var="i" value="0"/>
				<c:forEach var="community" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<tr>
						<td>
							<span>${community.communityNo }</span>
						</td>
						<td>
							<span class="getRestaurantLink" data-param="${ community.communityNo }">${community.title }</span>
						</td>
						<td>
							<span>${community.writerNickName }</span>
						</td>
						<td>
							<span>${community.writeDate }</span>
						</td>
						<td>
							<span>${community.views }</span>
						</td>
						<td>
							<span>${community.like }</span>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table> --%>
		<!-- 테이블 리스트 : end -->
	</div>
	
	<!-- PageNavigation : start -->
	
	<!-- PageNavigation : end -->
	
	</div>

</body>
</html>