package com.destiny.service.community;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;

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

}
