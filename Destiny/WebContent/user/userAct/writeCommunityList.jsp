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

<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

<script type="text/javascript">

	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/act/getWriteCommunityList/${me.userId}").submit();
	}
	
	//============= 해당 게시물로 이동하는  Event  처리(Click) =============	
	 $(function() {
	
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( ".getCommunityLink" ).on("click" , function() {
			var category = $(this).data("param1");
			
			if(category=='RES'){
				self.location ="/info/getRestaurantInfo?communityNo="+$(this).data("param");
			}else if(category =='LUV'){
				self.location ="/love/getLoveAdvice?communityNo="+$(this).data("param");
			}else if(category == 'MET'){
				self.location ="/meetingStory/getMeetingStory?communityNo="+$(this).data("param");
			}else if(category == 'DAT'){
				self.location ="/date/getDateStory?communityNo="+$(this).data("param");
			}else if(category == 'NTC'){
				self.location ="/notice/getNotice?communityNo="+$(this).data("param");
			}
			 
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
	form{
		/* padding-top : 5em; */
	}
	
	.getCommunityLink{cursor:pointer;}
	/* table sytle 추가 */
	.wrap{max-width:1440px; margin-top: 400px;}
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
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->

    <!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1><span class="slim">작성한 </span>게시글<span class="slim"></span></h1>
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
				<li>활동관리</li>
				<li>></li>
				<li>작성한 게시글</li>
			</ul>
			<!-- 페이지 내부 네비게이션 경로 : end -->
			
			<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			<form class="form-horizontal">			  
			  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
			  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			</form>
			
			<div class="12u" style="clear:both;"> 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지</div>
			
			<!-- 테이블 리스트 : start -->
			<table class="table-type01">
	            <colgroup>
	                <col style="width:5%">
	                <col style="width:15%">
	                <col style="width:50%">
	                <col style="width:20%">
	                <col style="width:10%">
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>No</th>
	                    <th>카테고리</th>
	                    <th>제목</th>
	                    <th>작성일</th>
	                    <th>공감수</th>
	                </tr>
	            </thead>
	    
	            <tbody>
	            
	            	<c:if test="${list[0] == null}">
	            		<tr>
	            			<td colspan="7"> 작성한 게시글이 없습니다. </td>
	            		</tr>
	           		</c:if>
	            
	            	<c:set var="i" value="0"/>
	            	<c:forEach var="community" items="${list}">
	            		<c:set var="i" value="${i+1}"/>
	            		
	            		<tr>
		                    <td>${ i }</td>
		                    <td>
		                    	<c:if test="${community.category == 'RES'}"> [맛집정보] </c:if>
		                    	<c:if test="${community.category == 'LUV'}"> [연애조언] </c:if>
		                    	<c:if test="${community.category == 'MET'}"> [모임후기] </c:if>
		                    	<c:if test="${community.category == 'DAT'}"> [만남후기] </c:if>
		                    	<c:if test="${community.category == 'NTC'}"> [공지사항] </c:if>
		                    </td>
		                    <td class="getCommunityLink" data-param="${ community.communityNo }" data-param1="${ community.category }">
		                    	${community.title }
		                    </td>
		                    <td>${community.writeDate}</td>
		                    <td>${community.like}</td>
		                </tr>
	            		
	            	</c:forEach>
	            </tbody>
        	</table>
			<!-- 테이블 리스트 : end -->
		</div>
		
		
		
		<!-- PageNavigation : start -->
		<jsp:include page="/common/pageNavigator.jsp" />
		<!-- PageNavigation : end -->
	</div>
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->

</body>
</html>