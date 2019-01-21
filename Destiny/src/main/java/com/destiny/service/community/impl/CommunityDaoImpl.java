package com.destiny.service.community.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.community.CommunityDao;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CommunityDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addCommunity(Community community) throws Exception {
		sqlSession.insert("CommunityMapper.addCommunity", community);
	}

	@Override
	public Community getCommunity(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommunity", communityNo);
	}

	@Override
	public List<Community> getCommunityList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getCommunityList", search);
	}

	@Override
	public void updateCommunity(Community community) throws Exception {
		sqlSession.update("CommunityMapper.updateCommunity", community);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getTotalCount", search);
	}

	@Override
	public void deleteCommunity(Community community) throws Exception {
		sqlSession.delete("CommunityMapper.deleteCommunity", community);		
	}

	@Override
	public void updateViews(int communityNo) throws Exception {
		sqlSession.update("CommunityMapper.updateViews", communityNo);
		
	}

	@Override
	public void addLikeCommunity(int communityNo) throws Exception {
		sqlSession.update("CommunityMapper.addLikeCommunity", communityNo);
	}
	
	@Override
	public void subLikeCommunity(int communityNo) throws Exception {
		sqlSession.update("CommunityMapper.subLikeCommunity", communityNo);
	}
	
	@Override
	public LikeCount checkId(LikeCount likeCount) throws Exception {
		return sqlSession.selectOne("LikeCountMapper.checkId", likeCount);
	}

	@Override
	public void addLikeCount(LikeCount likeCount) throws Exception {
		sqlSession.insert("LikeCountMapper.addLikeCount", likeCount);
	}

	@Override
	public void updateLikeCount(LikeCount likeCount) throws Exception {
		sqlSession.update("LikeCountMapper.updateLikeCount", likeCount);
	}

	@Override
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception {
		return sqlSession.selectOne("LikeCountMapper.getLikeCount", likeCount);
	}

	@Override
	public void updateViewsCondition(Community community) throws Exception {
		sqlSession.update("CommunityMapper.updateViewsCondition", community);
	}

}
