package com.destiny.web.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.service.comment.CommentService;
import com.destiny.service.domain.Comment;

@RestController
@RequestMapping("/comment/*")
public class CommentRestController {

	///Field
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	//setter Method 구현 않음
	
	public CommentRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/rest/addComment/{communityNo}", method=RequestMethod.POST)
	public Map<String, Object> addComment(@PathVariable("communityNo") int communityNo, @ModelAttribute("comment") Comment comment) throws Exception{
		System.out.println("CommentRestController/addComment():POST 실행==========================");
		
		comment.setCommentWriterId("kimgiyong");
		comment.setViewCondition("DEF");
		comment.setCommentComuNo(communityNo);
		/*comment.setCommentDetail(commentDetail);*/
		
		commentService.addComment(comment);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comment", comment);
		return map;
	}
}
