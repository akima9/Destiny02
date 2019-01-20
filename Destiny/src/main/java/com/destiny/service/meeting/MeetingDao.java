package com.destiny.service.meeting;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;

public interface MeetingDao {
	
	public List<Meeting> getInterestList() throws Exception;

	public void addMeeting(Meeting meeting)throws Exception;/*���� �����ϱ� */
	
	public void addAct(Meeting meeting)throws Exception; /*���� �ֵ��Ҷ� ��Ʈ ���̺� ���� ������Ʈ*/
	
	public void addCrewList(Meeting meeting)throws Exception; 
	
	public List<Meeting> getMeetingList(Search search) throws Exception;
	
	public Meeting getMeeting(int meetingNo)throws Exception;
	
	public int getAct(int meetingNo)throws Exception;
	
	public int getCrewCount(int meetingNo)throws Exception;
	
	public List<Meeting> getCrew(int meetingNo) throws Exception;
	
	public void updateViews(int meetingNo)throws Exception;
	
	public List<Meeting> getBestProduct() throws Exception;
	
	public void updateMeeting(Meeting meeting)throws Exception;
	
	public void updateContentsMeeting(Meeting meeting)throws Exception;
	
	public int addCrewM(Meeting meeting)throws Exception;
	
	public int addCrewAct(Meeting meeting)throws Exception;
	
	public int checkDuplicationCrew(Meeting meeting)throws Exception;
	
	public Meeting getActNo(Meeting meeting) throws Exception; /*�����ҋ� ������ȣ ��������*/
	
	public Meeting getCrewNo(Meeting meeting) throws Exception; /*�����ҋ� ȸ����ȣ ��������*/
	
}
