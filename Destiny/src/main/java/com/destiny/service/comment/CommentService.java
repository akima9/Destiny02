package com.destiny.service.comment;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Comment;

public interface CommentService {
	
	//��� ���
	public void addComment(Comment comment) throws Exception;
	
	//��� �󼼺���
	public Comment getComment(int commentNo) throws Exception;
	
	//��� ����Ʈ
	public Map<String, Object> getCommentList(Search search) throws Exception;
	
	//��� ����
	public void updateComment(Comment comment) throws Exception;
	
	//��� viewCondition ����
	public void updateViewCondition(Comment comment) throws Exception;

}
