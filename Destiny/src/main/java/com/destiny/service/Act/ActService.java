package com.destiny.service.Act;

import java.util.Map;

import com.destiny.common.Search;

//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface ActService {
	
	public Map<String, Object> getMeetingListByMaster(Search search, String userId) throws Exception;
	
	public Map<String, Object> getCommunityListByWriter(Search search, String userId) throws Exception;
	
	public Map<String, Object> getCommentListByWriter(Search search, String userId) throws Exception;
	
}