package com.destiny.service.domain;

import java.util.Date;

public class Comment {
	
	private String	commentNo;
	private Date	commentDate;
	private String	commentContents;
	private User	writerId;
	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentContents() {
		return commentContents;
	}
	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}
	public User getWriterId() {
		return writerId;
	}
	public void setWriterId(User writerId) {
		this.writerId = writerId;
	}
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentContents=" + commentContents + ", writerId=" + writerId
				+ "]";
	}
	
	

}
