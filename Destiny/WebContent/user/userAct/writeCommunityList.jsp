<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�츮���� �����</title>


<!-- ���� : http://getbootstrap.com/css/   -->
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

	//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/act/getWriteCommunityList").submit();
	}
	
	//============= userId �� ȸ����������  Event  ó��(Click) =============	
	 $(function() {
	
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( ".getRestaurantLink" ).on("click" , function() {
			 self.location ="/info/getRestaurantInfo?communityNo="+$(this).data("param");
		});
					
		//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( "td:nth-child(2)" ).css("color" , "red");
		
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
  	
  	
    
    <!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1><span class="slim">�ۼ��� </span>�Խù� <span class="slim">��ȸ</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	<div class="container">
	
		<div class="wrap">
		
			<!-- ������ ���� �׺���̼� ��� : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>����������</li>
				<li>></li>
				<li>�ۼ��� �Խù� ��ȸ</li>
			</ul>
			<!-- ������ ���� �׺���̼� ��� : end -->
			
			<!-- PageNavigation ���� ������ ���� ������ �κ� -->
			<form>
				<div class="form-group search-group">
					<input type="hidden" id="currentPage" name="currentPage" value="">
				</div>
			</form>
			
			<div class="12u"> ��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</div>
			
			<!-- ���̺� ����Ʈ : start -->
			<table class="table table-hover table-striped">
			
				<thead>
					<tr>
						<th aligin="center">No</th>
						<th aligin="center">����</th>
						<th aligin="center">ī�װ�</th>
						<th aligin="center">�ۼ���</th>
						<th aligin="center">������</th>
						<th aligin="center">��ۼ�</th>
					</tr>
				</thead>
				
				<tbody>
					<c:set var="i" value="0"/>
					<c:forEach var="community" items="${list}">
						<c:set var="i" value="${i+1}"/>
						<tr>
							<td>
								<span>${ i }</span>
							</td>
							<td>
								<span class="getRestaurantLink" data-param="${ community.communityNo }">${community.title }</span>
							</td>
							<td>
								<c:if test="${community.category == 'RES'}">
									<span>��������</span>
								</c:if>
								<c:if test="${community.category == 'LUV'}">
									<span>��������</span>
								</c:if>
								<c:if test="${community.category == 'MET'}">
									<span>�����ı�</span>
								</c:if>
								<c:if test="${community.category == 'DAT'}">
									<span>�����ı�</span>
								</c:if>
								<c:if test="${community.category == 'NTC'}">
									<span>��������</span>
								</c:if>
								
							</td>
							<td>
								<span>${community.writeDate}</span>
							</td>
							<td>
								<span>${community.like}</span>
							</td>
							<td>
								<span>${listCommentCount[i-1]}</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			
			</table>
			<!-- ���̺� ����Ʈ : end -->
		</div>
		
		<!-- PageNavigation : start -->
		<jsp:include page="/common/pageNavigator_new.jsp" />
		<!-- PageNavigation : end -->
	
	
	
	</div>

</body>
</html>