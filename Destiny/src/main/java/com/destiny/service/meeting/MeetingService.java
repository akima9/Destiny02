package com.destiny.service.meeting;

import java.util.Map;

import com.destiny.service.domain.Meeting;

public interface MeetingService {
	
	public Map<String , Object> getInterestList() throws Exception;
	
	public void addMeeting(Meeting meeting) throws Exception;

}
