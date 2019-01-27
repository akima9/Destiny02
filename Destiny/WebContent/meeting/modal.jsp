<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	    <!-- ���â ������ �κ� -->
        <div id="nextDialog">
        <!-- //////////////////////////���â  �����/////////////////////////////////////////////////// -->
        	<form id="nextDialogForm" class="form-horizontal">
				 <div  id="dateOrDay" class="form-group col-sm-12 col-md-12" >
		 			<input 	id="nextDay" type="text" class="datepicker form-control" readonly="readonly" class="form-control" placeholder="���ӳ�¥" name="meetingDate"/>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<select id="nextTime" name="meetingTime" class="form-control">
				 		<option>���ӽð�</option>
				 		<option value="12:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='12:00' ? "selected" : "" }>12:00</option>
				 		<option value="13:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='13:00' ? "selected" : "" }>13:00</option>
				 		<option value="14:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='14:00' ? "selected" : "" }>14:00</option>
				 	</select>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	ȸ�� �ִٸ� �Ʒ� �Է����ּ���
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input id="nextDues" name="meetingDues" type="text" class="form-control" placeholder="ex)�ĺ� 1����">
				 </div>
				 
				 <div class="form-group col-sm-10 col-md-10">
				 <input name="meetingLocation" type="text" class="form-control nextLocation" id="sample6_address" readonly="readonly">
				 </div>
				 
				 <div class="form-group col-sm-2 col-md-2">
					<input type="button" class="btn btn-warning" onclick="sample6_execDaumPostcode()" value="�ּ� �˻�"><br>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				 </div>
				  
				 <div class="form-group">
				   <div class="col-sm-offset-4  col-sm-4 text-center">
				     <button type="button" class="btn btn-susses"  id="nextSchedul" value="nextSchedul">���</button>
					 <a class="btn btn-susses btn" id="pushCancle" role="button">���</a>
				   </div>
				 </div>
		</form>
		<!-- //////////////////////////���â  ����� ��/////////////////////////////////////////////////// -->
		</div>