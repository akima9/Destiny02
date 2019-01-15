<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$("button:contains('글쓰기')").on("click", function() {
		self.location = "/info/addRestaurantInfo"
	});
	
});
</script>
</head>
<body>
	<h1>getRestaurantInfoList.jsp</h1>
	<button>글쓰기</button>
</body>
</html>