<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�츮���� �����</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<script type="text/javascript">
	$(function(){
		
		$(document).ready(function(){
			$("#summernote").summernote({ //summernote�� ����ϱ� ���� ����
				placeholder : '������ �Է����ּ���.',
				height : 500
				
			});
		});
		
		$("#save").on("click",function(){
			$("form").attr("method","POST").attr("action","/info/addRestaurantInfo").submit();
		});
		
	});
</script>
</head>
<body>
	<h1>addRestaurantInfo.jsp</h1>
	<form>
		<table width="100%">
			<tr>
				<td>����</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea id="summernote" name="detail"></textarea></td>
			</tr>
			<tr>
				<td><input type="button"  id="save" value="Ȯ��"></td>
			</tr>
		</table>
	</form>
</body>
</html>