package com.destiny.service.community;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

public interface CommunityService {

	//�Խñ� ���
	public void addCommunity(Community community) throws Exception;
	
	//�Խñ� �󼼺���
	public Community getCommunity(int communityNo) throws Exception;
	
	//�Խñ� ����Ʈ
	public Map<String, Object> getCommunityList(Search search) throws Exception;
	
	//�Խñ� ����
	public void updateCommunity(Community community) throws Exception;
	
	//�Խñ� ������ ����
	public void deleteCommunity(Community community) throws Exception;
	
	//�Խù� ��ȸ��
	public void updateViews(int communityNo) throws Exception;
	
	//�Խù� ������
	public void likeCommunity(int communityNo) throws Exception;
	
	//���� ���
	public void addLikecount(LikeCount likecount) throws Exception;
	
	//���� ����
	public void updateLikecount(LikeCount likecount) throws Exception;

	//���� �󼼺���
	public LikeCount getLikecount(int likecountNo) throws Exception;
	
	//viewCondition ����
	public void updateViewsCondition(Community community) throws Exception;
}
