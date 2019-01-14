package com.destiny.service.community.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.community.CommunityDao;
import com.destiny.service.domain.Community;

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

}
