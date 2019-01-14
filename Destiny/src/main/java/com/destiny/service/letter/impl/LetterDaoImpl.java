package com.destiny.service.letter.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.service.letter.LetterDao;

@Repository("letterDaoImpl")
public class LetterDaoImpl implements LetterDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public LetterDaoImpl() {
		System.out.println(this.getClass());
	}
}
