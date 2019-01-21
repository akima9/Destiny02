package com.destiny.service.comment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.comment.CommentDao;
import com.destiny.service.comment.CommentService;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.Community;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService{
	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	public CommentServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		commentDao.addComment(comment);
	}

	@Override
	public Comment getComment(int commentNo) throws Exception {
		return commentDao.getComment(commentNo);
	}

	@Override
	public Map<String, Object> getCommentList(Search search) throws Exception {
		
		List<Comment> list = commentDao.getCommentList(search);
		int totalCount = commentDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		commentDao.updateComment(comment);
	}

	@Override
	public void updateViewCondition(Comment comment) throws Exception {
		commentDao.updateViewCondition(comment);
	}
}
