package com.destiny.service.comment;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Comment;

public interface CommentService {
	
	//´ñ±Û µî·Ï
	public void addComment(Comment comment) throws Exception;
	
	//´ñ±Û »ó¼¼º¸±â
	public Comment getComment(int commentNo) throws Exception;
	
	//´ñ±Û ¸®½ºÆ®
	public Map<String, Object> getCommentList(Search search) throws Exception;
	
	//´ñ±Û ¼öÁ¤
	public void updateComment(Comment comment) throws Exception;
	
	//´ñ±Û viewCondition ¼öÁ¤
	public void updateViewCondition(Comment comment) throws Exception;

}
