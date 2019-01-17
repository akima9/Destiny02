package com.destiny.service.meeting;

import java.util.Map;

import com.destiny.service.domain.Meeting;

public interface MeetingService {
	
	public Map<String , Object> getInterestList() throws Exception;
	
	public void addMeeting(Meeting meeting) throws Exception;
	
	public Map<String , Object> getMeetingList() throws Exception;
	
	public Meeting getMeeting(int meetingNo) throws Exception;
	
	public void updateViews(int meetingNo) throws Exception;
	
	public Map<String , Object> getBestProduct() throws Exception;

	public void updateMeeting(Meeting meeting) throws Exception;
	
	public void updateContentsMeeting(Meeting meeting) throws Exception;
}
