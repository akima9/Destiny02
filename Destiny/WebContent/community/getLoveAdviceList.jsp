<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�츮���� �������</title>


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

var userId = "${me.userId}";
console.log("userId : "+userId);

$(function() {
	
	/* ���ѽ�ũ�� : start */
	var currentPage = 0;
	
	function fncNextList(searchCondition, searchKeyword){
		console.log("fncNextList�޼ҵ�δ� ����?")
		currentPage++;
		$.ajax({
			url : "/love/json/listLoveAdvice",
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
					list += '<img src="../resources/images/uploadImg/'+community.fileName+'" alt="��ǥ�̹���">';
					list += '<div class="caption">';
					list += '<h3 class="tumTitle">'+community.title+'</h3>';
					list += '<p>'+community.writeDate+'</p>';
					list += '<ul class="infoFirst">';
					list += '<li>'+community.writerNickName+'</li>';
					list += '<li><span>��ȸ��</span> : '+community.views+'</li>';
					list += '</ul>';
					list += '<ul class="infoSecond">';
					if(community.userGrade == 'NEW'){
						list += '<li>�ű�ȸ��</li>';	
					}
					if(community.userGrade == 'NOR'){
						list += '<li>�Ϲ�ȸ��</li>';	
					}
					if(community.userGrade == 'VIP'){
						list += '<li>���ȸ��</li>';	
					}
					if(community.userGrade == 'ADM'){
						list += '<li>������</li>';	
					}
					list += '<li><span>������</span> : '+community.like+'</li>';
					list += '</ul></div></div></div>';
				}
				
				$(".rowList").html($(".rowList").html()+list);
				
				init();
			}
		});
	}
	
	/* ����� Ŭ�� : start */
	function init(){
		$(".thumbnail").on("click", function(){
			if(userId == ""){
				alert("�α��� �� �̿� �����մϴ�.");
				self.location = "/user/userInfo/login.jsp"
			}
			else{
				var communityNo = $(this).data("param")
				self.location="/love/getLoveAdvice?communityNo="+communityNo	
			}
		});
	};
	/* ����� Ŭ�� : end */
	
	$(function(){
		while ($(document).height()==$(window).height() && currentPage < $("input:hidden[name='maxPage']").val()) {
			fncNextList();
		}
	});
	
	$(window).scroll(function(){
		if (currentPage < $("input:hidden[name='maxPage']").val()) {
			if ($(window).scrollTop()==$(document).height()-$(window).height()) {
				var state = $('.sort-control option:selected').val();
				var searchCondition = $('select[name=searchCondition]').val();
				var searchKeyword = $('#searchKeyword').val();
				fncNextList(searchCondition, searchKeyword);
			}
		}
	});
	/* ���ѽ�ũ�� : end */
	
	$("#searchKeyword").keypress(function(e) {
		if(e.which == 13) {
			$(this).blur();
			$(".button:contains('�˻�')").focus().trigger('click');
			return false;
		}
	});
	
	/* �˻� ��ư : start */
	$(".button:contains('�˻�')").on("click", function(){
		var state = $('.sort-control option:selected').val();
		var searchCondition = $('select[name=searchCondition]').val();
		var searchKeyword = $('#searchKeyword').val();
		currentPage = 0;
		$(".rowList").empty();
		$('#searchKeyword').val('');
		fncNextList(searchCondition, searchKeyword);
	});
	/* �˻� ��ư : end */
	
	/* �۾��� ��ư : start */
	$("button:contains('�۾���')").on("click", function() {
		if(userId == ""){
			alert("�α��� �� �̿� �����մϴ�.");
			self.location = "/user/userInfo/login.jsp"
			/* $("#my-dialog,#dialog-background").toggle(); */
		}
		else{
			self.location = "/love/addLoveAdvice"	
		}
	});
	/* �۾��� ��ư : end */
	
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
		background-image : url("/resources/images/background/getRestaurantInfo_background.jpg");
		background-repeat : no-repeat;
		background-position : center center;
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
	/* .topImg h1{
		position : absolute;
		line-height : 450px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 99;
		font-size : 60px;
		font-weight : bold;
	} */
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
		padding-top : 5em;
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
		width : 55%;
		float:left;
		margin-top : 5px;
	}
</style>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
  	
  	
    
    <!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>����<span class="slim">����</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	<div class="container">
	
		<div class="wrap">
		
		<!-- ������ ���� �׺���̼� ��� : start -->
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>���丮</li>
			<li>></li>
			<li>��������</li>
		</ul>
		<!-- ������ ���� �׺���̼� ��� : end -->
		
		<form>
			<div class="form-group search-group">
			    <select name="searchCondition" >
					<option value="0"
						${ !empty search.searchCondition && search.searchCondition=="0" ? "selected" : ""}>�������� �˻�</option>
					<option value="1"
						${ !empty search.searchCondition && search.searchCondition=="1" ? "selected" : ""}>�ۼ��ڷ� �˻�</option>
				</select>
			    <label class="sr-only" for="searchKeyword">�˻���</label>
				<input type="text" id="searchKeyword" name="searchKeyword"  placeholder="�˻�� �Է����ּ���."
			    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" autocomplete=off>
				<button type="button" class="button">�˻�</button>
				  
				<!-- PageNavigation ���� ������ ���� ������ �κ� -->
				<input type="hidden" id="currentPage" name="currentPage" value="">
				
			</div>
			
			<div class="form-group text-left">
				<button type="button" class="button">�۾���</button>
			</div>
			
		</form>
	
		<input type="hidden" name="maxPage" value="${resultPage.maxPage }">
		
		<div class="rowList"></div>
		
		<!-- ����� ����Ʈ : end -->
	</div>
	
	</div>

</body>
</html>