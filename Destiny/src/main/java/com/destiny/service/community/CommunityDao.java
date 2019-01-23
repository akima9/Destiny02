package com.destiny.service.community;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

public interface CommunityDao {
	
	//insert
	public void addCommunity(Community community) throws Exception;
	
	//select one
	public Community getCommunity(int communityNo) throws Exception;
	
	//������ �󼼺���
	public Community getPreCommunity(int communityNo) throws Exception;
	
	//������ �󼼺���
	public Community getNextCommunity(int communityNo) throws Exception;
	
	//select list
	public List<Community> getCommunityList(Search search) throws Exception;
	
	//update
	public void updateCommunity(Community community) throws Exception;
	
	//delete
	public void deleteCommunity(Community community) throws Exception;
	
	//�Խ��� page ó���� ���� ��ü row(totalCount) return
	public int getTotalCount(Search search) throws Exception;
	
	//��ȸ��
	public void updateViews(int communityNo)throws Exception;
	
	//������(+1)
	public void addLikeCommunity(int communityNo)throws Exception;
	
	//������(-1)
	public void subLikeCommunity(int communityNo)throws Exception;
	
	//����id üũ
	public  LikeCount checkId(LikeCount likeCount) throws Exception;
	
	//���� ���
	public void addLikeCount(LikeCount likeCount) throws Exception;
	
	//���� ����
	public void updateLikeCount(LikeCount likeCount) throws Exception;
	
	//���� �󼼺���
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception;
	
	//viewCondition ����
	public void updateViewsCondition(Community community) throws Exception;
	
	//viewCondition ���� (Admin)
	public void updateViewsConditionAdmin(Community community) throws Exception;

}
