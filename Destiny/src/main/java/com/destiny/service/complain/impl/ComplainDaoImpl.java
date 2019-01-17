package com.destiny.service.complain.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.service.complain.ComplainDao;
import com.destiny.service.domain.Complain;

@Repository("complainDaoImpl")
public class ComplainDaoImpl implements ComplainDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	///Constructor
	public ComplainDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addComplain(Complain complain) throws Exception {
		sqlSession.insert("ComplainMapper.addComplain", complain);
	}

	
}
