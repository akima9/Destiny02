package com.destiny.service.find.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.domain.Find;
import com.destiny.service.find.FindDao;

@Repository("findDaoImpl")
public class FindDaoImpl implements FindDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public FindDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int getUserResult(Find find) throws Exception {
		return sqlSession.selectOne("FindMapper.getUserResult", find);
	}

	@Override
	public List<Find> getMeetingResult(Find find) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("find", find);
		return sqlSession.selectList("FindMapper.getMeetingResult", map);
	}

	@Override
	public int getTotalCount(Find find) throws Exception {
		return sqlSession.selectOne("FindMapper.getTotalCount", find);
	}

}
