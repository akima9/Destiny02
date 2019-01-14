package com.destiny.service.complain.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.service.complain.ComplainDao;

@Repository("complainDaoImpl")
public class ComplainDaoImpl implements ComplainDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public ComplainDaoImpl() {
		System.out.println(this.getClass());
	}
}
