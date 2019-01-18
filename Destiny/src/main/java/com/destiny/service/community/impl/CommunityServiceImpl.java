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
	public void likeCommunity(int communityNo) throws Exception {
		communityDao.likeCommunity(communityNo);
	}

	@Override
	public void addLikecount(LikeCount likecount) throws Exception {
		communityDao.addLikecount(likecount);
	}

	@Override
	public void updateLikecount(LikeCount likecount) throws Exception {
		communityDao.updateLikecount(likecount);
	}

	@Override
	public LikeCount getLikecount(int likecountNo) throws Exception {
		return communityDao.getLikecount(likecountNo);
	}

	@Override
	public void updateViewsCondition(Community community) throws Exception {
		communityDao.updateViewsCondition(community);
	}

}
