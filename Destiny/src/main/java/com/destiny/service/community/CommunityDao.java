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
	
	//������
	public void likeCommunity(int communityNo)throws Exception;
	
	//���� ���
	public void addLikecount(LikeCount likecount) throws Exception;
	
	//���� ����
	public void updateLikecount(LikeCount likecount) throws Exception;
	
	//���� �󼼺���
	public LikeCount getLikecount(int likecountNo) throws Exception;
	
	//viewCondition ����
	public void updateViewsCondition(Community community) throws Exception;

}
