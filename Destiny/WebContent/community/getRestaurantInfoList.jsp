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




<script type="text/javascript">

var userId = "${me.userId}";
console.log("userId : "+userId);


function fncGetList(currentPage){
	$("#currentPage").val(currentPage)
	$("form").attr("method","POST").attr("action","/info/listRestaurantInfo").submit();
}

$(function() {
	
	/* �˻� ��ư : start */
	$(".btn:contains('�˻�')").on("click", function(){
		fncGetList(1);			
	});
	/* �˻� ��ư : end */
	
	/* �۾��� ��ư : start */
	$("button:contains('�۾���')").on("click", function() {
		if(userId == ""){
			alert("�α��� �� �̿� �����մϴ�.");
			$("#my-dialog,#dialog-background").toggle();
		}
		else{
			self.location = "/info/addRestaurantInfo"	
		}
	});
	/* �۾��� ��ư : end */
	
	/* �� ���� ���콺 ���� : start */
	$(".getRestaurantLink").on("mouseover",function(){
		$(".getRestaurantLink").css("cursor","pointer")
	});
	/* �� ���� ���콺 ���� : end */
	
	/* �� ���� Ŭ�� : start */
	$(".getRestaurantLink").on("click", function(){
		if(userId == ""){
			alert("�α��� �� �̿� �����մϴ�.");
			$("#my-dialog,#dialog-background").toggle();
		}
		else{
			var communityNo = $(this).data("param")
			self.location="/info/getRestaurantInfo?communityNo="+communityNo	
		}
	});
	/* �� ���� Ŭ�� : end */
	
	/* ��ȸ�� Ŭ�� : start */
	$("th:contains('��ȸ')").on("click", function(){
		self.location="/info/listRestaurantInfo?viewSort=1"
	});
	/* ��ȸ�� Ŭ�� : end */
	
	/* ������ Ŭ�� : start */
	$("th:contains('����')").on("click", function(){
		self.location="/info/listRestaurantInfo?likeSort=1"
	});
	/* ������ Ŭ�� : end */
	
	/* �۹�ȣ Ŭ�� : start */
	$("th:contains('�۹�ȣ')").on("click", function(){
		self.location="/info/listRestaurantInfo?noSort=1"
	});
	/* �۹�ȣ Ŭ�� : end */
	
});

</script>
<style>
	body{
		position : relative;
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
	.topImg h1{
		position : absolute;
		line-height : 450px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 99;
		font-size : 60px;
		font-weight : bold;
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
		margin-top : -30px;
		margin-bottom : 60px;
	}
	
	.smallNavi li{
		float : left;
		margin-right : 20px;
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
</style>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
    
    <!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>����<span class="slim">����</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	<div class="container">
	
		<div class="wrap">
		
		<input type="hidden" name="views" value="${ community.views }">
		<input type="hidden" name="searchCondition" value="${ search.searchCondition }">
		<input type="hidden" name="searchKeyword" value="${ search.searchKeyword }">
		
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
			<div class="form-group">
			    <select class="form-control" name="searchCondition" >
					<option value="0"
						${ !empty search.searchCondition && search.searchCondition=="0" ? "selected" : ""}>�������� �˻�</option>
					<option value="1"
						${ !empty search.searchCondition && search.searchCondition=="1" ? "selected" : ""}>�ۼ��ڷ� �˻�</option>
				</select>
			    <label class="sr-only" for="searchKeyword">�˻���</label>
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻�� �Է����ּ���."
			    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				<button type="button" class="btn btn-default">�˻�</button>
				  
				<!-- PageNavigation ���� ������ ���� ������ �κ� -->
				<input type="hidden" id="currentPage" name="currentPage" value="">
			</div>
		</form>
		
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th aligin="center" class="noSort">�۹�ȣ��</th>
					<th aligin="center">����</th>
					<th aligin="center">�ۼ���</th>
					<th aligin="center">�ۼ���</th>
					<th aligin="center" class="viewSort">��ȸ��</th>
					<th aligin="center" class="likeSort">������</th>
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
		
		</table>
		
		<div class="form-group text-center">
			<button type="button" class="btn btn-default btn-lg">�۾���</button>
		</div>
		
		
	
	</div>
	
	<!-- PageNavigation : start -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation : end -->
	
	</div>
	
</body>
</html>