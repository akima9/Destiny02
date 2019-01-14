package com.destiny.service.comment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.comment.CommentDao;
import com.destiny.service.comment.CommentService;

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
}
