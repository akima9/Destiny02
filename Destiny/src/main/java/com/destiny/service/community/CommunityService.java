package com.destiny.service.community;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;

public interface CommunityService {

	//�Խñ� ���
	public void addCommunity(Community community) throws Exception;
	
	//�Խñ� �󼼺���
	public Community getCommunity(int communityNo) throws Exception;
	
	//�Խñ� ����Ʈ
	public Map<String, Object> getCommunityList(Search search) throws Exception;
	
	//�Խñ� ����
	public void updateCommunity(Community community) throws Exception;

}
