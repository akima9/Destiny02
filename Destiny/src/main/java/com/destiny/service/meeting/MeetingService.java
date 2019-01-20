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
	
	public int getAct(int meetingNo) throws Exception; /*�󼼺��� ���� ��Ʈ �������� */
	
	public int getCrewCount(int meetingNo) throws Exception; /*�󼼺��� �����*/
	
	public Map<String , Object> getCrew(int meetingNo) throws Exception; /*�󼼺��� ��� ����Ʈ*/
	
	public void updateViews(int meetingNo) throws Exception; /*�󼼺��� ���� ��ȸ�� �÷��ֱ�*/
	
	public Map<String , Object> getBestProduct() throws Exception; /*����Ʈ �ҷ��Ë� ����Ʈ ���̺� �ҷ�����*/

	public void updateMeeting(Meeting meeting) throws Exception; /*���� �����ɋ� ���°� ����*/
	
	public void updateContentsMeeting(Meeting meeting) throws Exception; /*���� ����*/
	
	public int addCrewM(Meeting meeting) throws Exception; /*���ӿ� ����Ʈ�� ������Ʈ*/
	
	public int addCrewAct(Meeting meeting) throws Exception; /*������ ����Ʈ�� ������Ʈ*/
	
	public int checkDuplicationCrew(Meeting meeting) throws Exception; /*�����ҋ� �ߺ�üũ*/
	
	public Meeting getActNo(Meeting meeting) throws Exception; /*�����ҋ� ������ȣ ��������*/
	
	public Meeting getCrewNo(Meeting meeting) throws Exception; /*�����ҋ� ȸ����ȣ ��������*/
	
}
