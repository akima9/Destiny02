<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		
		$("#save").on("click",function(){
			oEditors.getById["detail"].exec("UPDATE_CONTENTS_FIELD", []);
			$("form").attr("method","POST").attr("action","/info/addRestaurantInfo").submit();
		});
		
		$("input[value='사진']").on("click",function(){
			alert("눌림^^");
			self.location = "/info/"
		});
		
	});
</script>
</head>
<body>
	<h1>addRestaurantInfo.jsp</h1>
	<form>
		<table width="100%">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td><input type="button" value="사진"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="detail" id="detail" rows="10" cols="100"></textarea></td>
			</tr>
			<tr>
				<td><input type="button"  id="save" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	var oEditors = [];
	$(function(){
		nhn.husky.EZCreator.createInIFrame({
		    oAppRef: oEditors,
		    elPlaceHolder: "detail", //textarea에서 지정한 id와 일치해야 한다.
		    sSkinURI: "../se2/SmartEditor2Skin.html", //SmartEditor2Skin.html 파일이 존재하는 경로
		    htParams : {
		    	bUseToolbar : true, //툴바 사용 여부(true : 사용 / false : 사용X)
		    	bUseVerticalResizer : true, //입력창 크기 조절바 사용 여부( true : 사용 / false : 사용X)
		    	bUseModeChanger : false, //모드 탭(Editor | HTML | TEXT) 사용 여부 (true : 사용 / false : 사용X)
		    	fOnBeforeUnload : function(){
		    		
		    	}
		    },
		    fCreator: "createSEditor2"
		});	
	});
</script>
</html>