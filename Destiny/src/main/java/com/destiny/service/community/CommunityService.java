package com.destiny.service.community;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

public interface CommunityService {

	//게시글 등록
	public void addCommunity(Community community) throws Exception;
	
	//게시글 상세보기
	public Community getCommunity(int communityNo) throws Exception;
	
	//게시글 리스트
	public Map<String, Object> getCommunityList(Search search) throws Exception;
	
	//게시글 수정
	public void updateCommunity(Community community) throws Exception;
	
	//게시글 삭제로 변경
	public void deleteCommunity(Community community) throws Exception;
	
	//게시물 조회수
	public void updateViews(int communityNo) throws Exception;
	
	//게시물 공감수
	public void addLikeCommunity(int communityNo) throws Exception;
	
	//게시물 공감수
	public void subLikeCommunity(int communityNo) throws Exception;
	
	//공감id 체크
	public  LikeCount checkId(LikeCount likeCount) throws Exception;
	
	//공감 등록
	public void addLikeCount(LikeCount likeCount) throws Exception;
	
	//공감 수정
	public void updateLikeCount(LikeCount likeCount) throws Exception;

	//공감 상세보기
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception;
	
	//viewCondition 수정
	public void updateViewsCondition(Community community) throws Exception;
}
