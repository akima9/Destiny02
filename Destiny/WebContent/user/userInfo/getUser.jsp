<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
	<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>우연</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	
   <!-- All CSS Insert -->
	<link rel="stylesheet" href="/resources/css/main.css" > 
   
   <script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#updateButton" ).on("click" , function() {
					self.location = "/user/updateUser/${user.userId}";
				});
		});
		
	</script>
	
</head>

<body>

	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<br/>
		<div class="page-header">
	       <h3>회원정보조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>닉네임</strong></div>
			<div class="col-xs-8 col-md-4">${user.nickName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>회원등급</strong></div>
	  		<div class="col-xs-8 col-md-4">
	  			<c:if test="${user.userGrade=='NEW'}">신규회원</c:if>
	  		</div>
	  		<div class="col-xs-8 col-md-4">
	  			<c:if test="${user.userGrade=='NOR'}">일반회원</c:if>
	  		</div>
	  		<div class="col-xs-8 col-md-4">
	  			<c:if test="${user.userGrade=='VIP'}">우수회원</c:if>
	  		</div>
	  		<div class="col-xs-8 col-md-4">
	  			<c:if test="${user.userGrade=='ADM'}">관리자</c:if>
	  		</div>
	  		<div class="col-xs-8 col-md-4">
	  			<c:if test="${user.userGrade=='BLK'}">블랙리스트</c:if>
	  		</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>출석일</strong></div>
			<div class="col-xs-8 col-md-4">${user.attendCount}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>경고횟수</strong></div>
			<div class="col-xs-8 col-md-4">${user.warningCount} 회</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주소</strong></div>
			<div class="col-xs-8 col-md-4">${user.address}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대전화번호</strong></div>
			<div class="col-xs-8 col-md-4">${user.phone}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이 메 일</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>생년월일</strong></div>
			<div class="col-xs-8 col-md-4">${user.birthday}</div>
		</div>
		
		<hr/>
		
		<div class="row">
		  	<div class="col-xs-4 col-md-2"><strong>프로필사진</strong></div>
			<div class="col-xs-8 col-md-4">
				<c:set var="i" value="0" />
				<c:forEach var="file" items="${filelist}" >
					<c:set var="i" value="${ i+1 }" />
						   <img src="/resources/images/userprofile/${file}" width="500" height="500"/>
				</c:forEach>
			</div>
		</div>
	
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>관심사</strong></div>
			<div class="col-xs-8 col-md-2">${interestList[0]}</div>
			<div class="col-xs-8 col-md-2">${interestList[1]}</div>
			<div class="col-xs-8 col-md-2">${interestList[2]}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>내 성격유형</strong></div>
			<div class="col-xs-8 col-md-2">${typeMap.myType}</div>
			<img src="/resources/images/MBTI/${typeFileMap.myTpyeFile}" width="150" height="200"/>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상대방 성격유형</strong></div>
			<div class="col-xs-8 col-md-2">${typeMap.firstType}</div>
			<div class="col-xs-8 col-md-2">${typeMap.secondType}</div>
			<div class="col-xs-8 col-md-2">${typeMap.thirdType}</div>
			<br/>
			<div class="col-xs-4 col-md-2"></div>
			<img src="/resources/images/MBTI/${typeFileMap.typeFileList[0]}" width="150" height="200"/>
			<img src="/resources/images/MBTI/${typeFileMap.typeFileList[1]}" width="150" height="200"/>
			<img src="/resources/images/MBTI/${typeFileMap.typeFileList[2]}" width="150" height="200"/>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<ul class="actions small">	
	  				<li><a id="updateButton" href="#" class="button special small">회원정보수정</a></li>
	  			</ul>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>