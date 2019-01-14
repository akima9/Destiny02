package com.destiny.service.meeting;

import java.util.List;

import com.destiny.service.domain.Meeting;

public interface MeetingDao {
	
	public List<Meeting> getInterestList() throws Exception;

	public void addMeeting(Meeting meeting)throws Exception;
}
