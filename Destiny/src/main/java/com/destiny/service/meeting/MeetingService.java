package com.destiny.service.meeting;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;

public interface MeetingService {
	
	public Map<String , Object> getInterestList() throws Exception; /*�����ϱ� ���� ���ɻ� �׸� ��������*/
	
	public void addMeeting(Meeting meeting) throws Exception; /*���� �����ϱ�*/
	
	public void addAct(Meeting meeting) throws Exception; /*������ ���ÿ� ��Ʈ 1ȸ�� ������Ʈ*/
	
	public void addCrewList(Meeting meeting) throws Exception; /*������ ���ÿ�  ���ӿ� ����Ʈ�� ������ �ڽ� ������Ʈ*/
	
	public Map<String , Object> getMeetingList(Search search) throws Exception; /*����Ʈ �����ً� ��� ������*/
	
	public Meeting getMeeting(int meetingNo) throws Exception; /*�󼼺��� */
	
	public void updateViews(int meetingNo) throws Exception; /*�󼼺��� ���� ��ȸ�� �÷��ֱ�*/
	
	public Map<String , Object> getBestProduct() throws Exception; /*����Ʈ �ҷ��Ë� ����Ʈ ���̺� �ҷ�����*/

	public void updateMeeting(Meeting meeting) throws Exception; /*���� �����ɋ� ���°� ����*/
	
	public void updateContentsMeeting(Meeting meeting) throws Exception; /*���� ����*/
	
}
