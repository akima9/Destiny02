package com.destiny.service.comment.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.comment.CommentDao;
import com.destiny.service.domain.Comment;

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

	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
	}

	@Override
	public Comment getComment(int commentNo) throws Exception {
		return sqlSession.selectOne("CommentMapper.getComment", commentNo);
	}

	@Override
	public List<Comment> getCommentList(Search search) throws Exception {
		return sqlSession.selectList("CommentMapper.getCommentList", search);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.updateComment", comment);
	}

	@Override
	public void updateViewCondition(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.updateViewCondition", comment);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommentMapper.getTotalCount", search);
	}
	
}
