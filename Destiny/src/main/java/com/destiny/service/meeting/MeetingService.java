package com.destiny.service.meeting;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;

public interface MeetingService {
	
	public Map<String , Object> getInterestList() throws Exception; /*개설하기 열떄 관심사 항목 가져오기*/
	
	public void addMeeting(Meeting meeting) throws Exception; /*새로 개설하기*/
	
	public void addAct(Meeting meeting) throws Exception; /*개설과 동시에 엑트 1회차 업데이트*/
	
	public void addCrewList(Meeting meeting) throws Exception; /*개설과 동시에  모임원 리스트에 모임장 자신 업데이트*/
	
	public Map<String , Object> getMeetingList(Search search) throws Exception; /*리스트 보여줄떄 목록 리스팅*/
	
	public Meeting getMeeting(int meetingNo) throws Exception; /*상세보기 */
	
	public void updateViews(int meetingNo) throws Exception; /*상세보기 들어갈때 조회수 올려주기*/
	
	public Map<String , Object> getBestProduct() throws Exception; /*리스트 불러올떄 베스트 테이브 불러오기*/

	public void updateMeeting(Meeting meeting) throws Exception; /*모임 삭제될떄 상태값 변경*/
	
	public void updateContentsMeeting(Meeting meeting) throws Exception; /*모임 수정*/
	
}
