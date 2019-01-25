<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	    <!-- 모달창 디자인 부분 -->
        <div id="nextDialog">
        <!-- //////////////////////////모달창  내용부/////////////////////////////////////////////////// -->
        	<form id="nextDialogForm" class="form-horizontal">
				 <div  id="dateOrDay" class="form-group col-sm-12 col-md-12" >
		 			<input 	id="nextDay" type="text" class="datepicker form-control" readonly="readonly" class="form-control" placeholder="모임날짜" name="meetingDate"/>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<select id="nextTime" name="meetingTime" class="form-control">
				 		<option>모임시간</option>
				 		<option value="12:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='12:00' ? "selected" : "" }>12:00</option>
				 		<option value="13:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='13:00' ? "selected" : "" }>13:00</option>
				 		<option value="14:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='14:00' ? "selected" : "" }>14:00</option>
				 	</select>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	회비가 있다면 아래 입력해주세요
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input id="nextDues" name="meetingDues" type="text" class="form-control" placeholder="ex)식비 1만원">
				 </div>
				 
				 <div class="form-group col-sm-10 col-md-10">
				 <input name="meetingLocation" type="text" class="form-control nextLocation" id="sample6_address" readonly="readonly">
				 </div>
				 
				 <div class="form-group col-sm-2 col-md-2">
					<input type="button" class="btn btn-warning" onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				 </div>
				  
				 <div class="form-group">
				   <div class="col-sm-offset-4  col-sm-4 text-center">
				     <button type="button" class="btn btn-susses"  id="nextSchedul" value="nextSchedul">등록</button>
					 <a class="btn btn-susses btn" id="pushCancle" role="button">취소</a>
				   </div>
				 </div>
		</form>
		<!-- //////////////////////////모달창  내용부 끝/////////////////////////////////////////////////// -->
		</div>