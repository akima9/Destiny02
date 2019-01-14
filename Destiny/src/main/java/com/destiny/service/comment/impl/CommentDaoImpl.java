package com.destiny.service.comment.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.service.comment.CommentDao;

@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public CommentDaoImpl() {
		System.out.println(this.getClass());
	}
	
}
