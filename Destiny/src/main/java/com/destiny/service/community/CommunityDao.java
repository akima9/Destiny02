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
	
	//게시판 page 처리를 위한 전체 row(totalCount) return
	public int getTotalCount(Search search) throws Exception;
	
	//조회수
	public void updateViews(int communityNo)throws Exception;
	
	//공감수
	public void likeCommunity(int communityNo)throws Exception;
	
	//공감 등록
	public void addLikecount(LikeCount likecount) throws Exception;
	
	//공감 수정
	public void updateLikecount(LikeCount likecount) throws Exception;
	
	//공감 상세보기
	public LikeCount getLikecount(int likecountNo) throws Exception;
	
	//viewCondition 수정
	public void updateViewsCondition(Community community) throws Exception;

}
