package com.destiny.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.community.CommunityDao;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

	///Field
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	///Constructor
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addCommunity(Community community) throws Exception {
		communityDao.addCommunity(community);
	}

	@Override
	public Community getCommunity(int communityNo) throws Exception {
		return communityDao.getCommunity(communityNo);
	}

	@Override
	public Map<String, Object> getCommunityList(Search search) throws Exception {
		
		List<Community> list = communityDao.getCommunityList(search);
		int totalCount = communityDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateCommunity(Community community) throws Exception {
		communityDao.updateCommunity(community);
	}

	@Override
	public void deleteCommunity(Community community) throws Exception {
		communityDao.deleteCommunity(community);		
	}

	@Override
	public void updateViews(int communityNo) throws Exception {
		communityDao.updateViews(communityNo);		
	}

	@Override
	public void addLikeCommunity(int communityNo) throws Exception {
		communityDao.addLikeCommunity(communityNo);
	}
	
	@Override
	public void subLikeCommunity(int communityNo) throws Exception {
		communityDao.subLikeCommunity(communityNo);
	}
	
	@Override
	public LikeCount checkId(LikeCount likeCount) throws Exception {
		return communityDao.checkId(likeCount);
	}

	@Override
	public void addLikeCount(LikeCount likeCount) throws Exception {
		communityDao.addLikeCount(likeCount);
	}

	@Override
	public void updateLikeCount(LikeCount likeCount) throws Exception {
		communityDao.updateLikeCount(likeCount);
	}

	@Override
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception {
		return communityDao.getLikeCount(likeCount);
	}

	@Override
	public void updateViewsCondition(Community community) throws Exception {
		communityDao.updateViewsCondition(community);
	}
	
	@Override
	public void updateViewsConditionAdmin(Community community) throws Exception {
		communityDao.updateViewsConditionAdmin(community);
	}

	@Override
	public Community getPreCommunity(int communityNo) throws Exception {
		return communityDao.getPreCommunity(communityNo);
	}

	@Override
	public Community getNextCommunity(int communityNo) throws Exception {
		return communityDao.getNextCommunity(communityNo);
	}

}
