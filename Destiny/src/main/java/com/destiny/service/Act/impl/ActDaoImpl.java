package com.destiny.service.Act.impl;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.Act.ActDao;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;


@Repository("actDaoImpl")
public class ActDaoImpl implements ActDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public ActDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Meeting> getMeetingListByMaster(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("search", search);
		
		List<Meeting> list = sqlSession.selectList("ActMapper.getMeetingListByMaster", map);
		
		System.out.println("dao에서 전달된 값들 : " + userId + search);
		System.out.println("dao에 매핑된 값 : " + map);
		System.out.println("dao에서 확보한 list : " + list);

		return list;
	}

	@Override
	public int getTotalCountByMaster(String userId) throws Exception {
		return sqlSession.selectOne("ActMapper.getTotalCountByMaster", userId);
	}

	@Override
	public List<Community> getCommunityListByWriter(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("search", search);
		
		List<Community> list = sqlSession.selectList("ActMapper.getCommunityListByWriter", map);
		
		System.out.println("dao에서 전달된 값들 : " + userId + search);
		System.out.println("dao에 매핑된 값 : " + map);
		System.out.println("dao에서 확보한 list : " + list);
		
		return list;
	}

	@Override
	public int getTotalCountByWriter(String userId) throws Exception {
		return sqlSession.selectOne("ActMapper.getTotalCountByWriter", userId);
	}

	@Override
	public List<Comment> getCommentListByWriter(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("search", search);
		
		List<Comment> list = sqlSession.selectList("ActMapper.getCommentListByWriter", map);
		
		System.out.println("dao에서 전달된 값들 : " + userId + search);
		System.out.println("dao에 매핑된 값 : " + map);
		System.out.println("dao에서 확보한 list : " + list);
		
		return list;
	}

	@Override
	public int getTotalCountByCommentSwiter(String userId) throws Exception {
		return sqlSession.selectOne("ActMapper.getTotalCountByCommentSwiter", userId);
	}

	@Override
	public List<Chatting> getContactList(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("search", search);
		
		List<Chatting> list = sqlSession.selectList("ActMapper.getContactList", map);
		
		System.out.println("dao에서 전달된 값들 : " + userId + search);
		System.out.println("dao에 매핑된 값 : " + map);
		System.out.println("dao에서 확보한 list : " + list);
		
		return list;
	}

	@Override
	public int getTotalContact(String userId) throws Exception {
		return sqlSession.selectOne("ActMapper.getTotalContact", userId);
	}

	@Override
	public int getCommunityComentCount(int communityNo) throws Exception {
		return sqlSession.selectOne("ActMapper.getCommunityComentCount", communityNo);
	}
	
	
	
	
	
}
