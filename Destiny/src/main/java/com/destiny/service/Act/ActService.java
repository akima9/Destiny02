package com.destiny.service.Act;

import java.util.Map;

import com.destiny.common.Search;

//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface ActService {
	
	public Map<String, Object> getMeetingListByMaster(Search search, String userId) throws Exception;
	
	public Map<String, Object> getMeetingListByApply(Search search, String userId) throws Exception;
	
	public Map<String, Object> getCommunityListByWriter(Search search, String userId) throws Exception;
	
	public Map<String, Object> getCommentListByWriter(Search search, String userId) throws Exception;
	
	public Map<String, Object> getContactList(Search search, String userId) throws Exception;
	
	public int getCommunityComentCount(int communityNo) throws Exception;
}