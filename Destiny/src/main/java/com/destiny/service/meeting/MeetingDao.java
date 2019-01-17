package com.destiny.service.meeting;

import java.util.List;

import com.destiny.service.domain.Meeting;

public interface MeetingDao {
	
	public List<Meeting> getInterestList() throws Exception;

	public void addMeeting(Meeting meeting)throws Exception;
	
	public List<Meeting> getMeetingList() throws Exception;
	
	public Meeting getMeeting(int meetingNo)throws Exception;
	
	public void updateViews(int meetingNo)throws Exception;
	
	public List<Meeting> getBestProduct() throws Exception;
	
	public void updateMeeting(Meeting meeting)throws Exception;
	
	public void updateContentsMeeting(Meeting meeting)throws Exception;
	
	
}
