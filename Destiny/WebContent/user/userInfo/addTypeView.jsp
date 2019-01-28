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
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddType();
			});
		});	
		
		 $(function() {
			 $('.inter-chk').on('change', function() {
				
				if( $('.inter-chk:checked').length <= 2 ) {
					$('.inter-chk').attr('disabled', false);
				} else {
					$('.inter-chk').attr('disabled', true);
					$('.inter-chk:checked').attr('disabled', false);
				}
			}); 
		 });
		 
		 function fncAddType(){
			 var myType = $("select[name='myType']").val();
			 var otherType = [];
			 $('input:checkbox[type=checkbox]:checked').each(function () {
				 otherType.push($(this).val());
			 });
			 
			 alert(otherType);
			 
			$("input:hidden[name='firstType']").val( otherType[0] );
			$("input:hidden[name='secondType']").val( otherType[1] );
			$("input:hidden[name='thirdType']").val( otherType[2] );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addType").submit();		 
		 }
	
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
		<h3>MBTI 유형 선택</h3>
		
		<!-- form Start /////////////////////////////////////-->
		<form action="horizontal">
		
		

		<br/>
			<div class="box alt">
				<div class="row col-sm-12 col-md-12">
				
					<strong>성격유형</strong><br/><br/>
					<c:set var="i" value="0"/>
					<c:forEach var="file" items="${list}">
						<c:set var="i" value="${i+1}"/>
						<div class="col-sm-3 col-md-3"><img src="/resources/images/MBTI/${file}.JPG" width="300" height="300"/></div>
					</c:forEach>
					<br/></div>

					<div class="6u"><strong>당신의 성격유형</strong>
					<c:set var="i" value="10000"/>
					<select class="form-control" id="myType" name="myType">
					<c:forEach var="file" items="${list}">
						<option value="${i}" ${ (! empty userList) && (userList[0] == i) ? 'selected' : '' }>${file}</option>
						<c:set var="i" value="${i+1}"/>
					</c:forEach>
					</select>
					<br/></div>

					<div class="6u"><strong>당신이 원하는 상대방 성격유형</strong><br/>
						<c:set var="i" value="10000"/>
						<c:forEach var="file" items="${list}">
							<input type="checkbox" name="otherType" id="otherType${i}" value="${i}" class="inter-chk" ${ (! empty userList) && (userList[1] == i || userList[2] == i || userList[3] == i) ? 'checked' : '' }><label for="otherType${i}">${file}</label>
							<c:set var="i" value="${i+1}"/>
						</c:forEach>
						<input type="hidden" name="firstType">
						<input type="hidden" name="secondType">
						<input type="hidden" name="thirdType">
					</div>
				
				</div>

				<div class="row">
				<div class="4u">
					<a class="btn btn-primary btn" href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC" role="button">test 해보기</a>
					<button type="button" class="btn btn-primary">성격유형 등록</button>
				</div>
				</div>
			</form>
		</div>
		
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>