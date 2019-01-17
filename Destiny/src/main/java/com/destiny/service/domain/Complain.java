package com.destiny.service.domain;

import java.util.Date;

public class Complain {
	
	private int		complainNo;
	private String 	complainerId;
	private String 	defendantId;
	private int 		meetingNo;
	private int		communityNo;
	private int 		commentNo;
	private String 	complainDetail;	
	private String	complainType;
	private String	complainKind;
	private Date		compainDate;
	private Date 	checkDate;
	private String 	complainState;
	//private int		warningNo;
	
	public Complain() {
	}

	public int getComplainNo() {
		return complainNo;
	}

	public void setComplainNo(int complainNo) {
		this.complainNo = complainNo;
	}

	public String getComplainerId() {
		return complainerId;
	}

	public void setComplainerId(String complainerId) {
		this.complainerId = complainerId;
	}

	public String getDefendantId() {
		return defendantId;
	}

	public void setDefendantId(String defendantId) {
		this.defendantId = defendantId;
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getComplainDetail() {
		return complainDetail;
	}

	public void setComplainDetail(String complainDetail) {
		this.complainDetail = complainDetail;
	}

	public String getComplainType() {
		return complainType;
	}

	public void setComplainType(String complainType) {
		this.complainType = complainType;
	}

	public String getComplainKind() {
		return complainKind;
	}

	public void setComplainKind(String complainKind) {
		this.complainKind = complainKind;
	}

	public Date getCompainDate() {
		return compainDate;
	}

	public void setCompainDate(Date compainDate) {
		this.compainDate = compainDate;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getComplainState() {
		return complainState;
	}

	public void setComplainState(String complainState) {
		this.complainState = complainState;
	}

	@Override
	public String toString() {
		return "Complain [complainNo=" + complainNo + ", complainerId=" + complainerId + ", defendantId=" + defendantId
				+ ", meetingNo=" + meetingNo + ", communityNo=" + communityNo + ", commentNo=" + commentNo
				+ ", complainDetail=" + complainDetail + ", complainType=" + complainType + ", complainKind="
				+ complainKind + ", compainDate=" + compainDate + ", checkDate=" + checkDate + ", complainState="
				+ complainState + "]";
	}
	
	
}
