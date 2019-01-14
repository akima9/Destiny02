package com.destiny.service.domain;

import java.util.Date;

public class Complain {
	
	private int		complainNo;
	private String	complainType;
	private String	complainDetail;
	private String	complainKind;
	private String	complainState;
	private Date	compainDate;
	private String	complainantld;
	private String	defendantId;
	private int		warningNo;
	private Comment	coComment;
	private Comment	coCommunity;
	private Meeting	Meeting;
	public int getComplainNo() {
		return complainNo;
	}
	public void setComplainNo(int complainNo) {
		this.complainNo = complainNo;
	}
	public String getComplainType() {
		return complainType;
	}
	public void setComplainType(String complainType) {
		this.complainType = complainType;
	}
	public String getComplainDetail() {
		return complainDetail;
	}
	public void setComplainDetail(String complainDetail) {
		this.complainDetail = complainDetail;
	}
	public String getComplainKind() {
		return complainKind;
	}
	public void setComplainKind(String complainKind) {
		this.complainKind = complainKind;
	}
	public String getComplainState() {
		return complainState;
	}
	public void setComplainState(String complainState) {
		this.complainState = complainState;
	}
	public Date getCompainDate() {
		return compainDate;
	}
	public void setCompainDate(Date compainDate) {
		this.compainDate = compainDate;
	}
	public String getComplainantld() {
		return complainantld;
	}
	public void setComplainantld(String complainantld) {
		this.complainantld = complainantld;
	}
	public String getDefendantId() {
		return defendantId;
	}
	public void setDefendantId(String defendantId) {
		this.defendantId = defendantId;
	}
	public int getWarningNo() {
		return warningNo;
	}
	public void setWarningNo(int warningNo) {
		this.warningNo = warningNo;
	}
	public Comment getCoComment() {
		return coComment;
	}
	public void setCoComment(Comment coComment) {
		this.coComment = coComment;
	}
	public Comment getCoCommunity() {
		return coCommunity;
	}
	public void setCoCommunity(Comment coCommunity) {
		this.coCommunity = coCommunity;
	}
	public Meeting getMeeting() {
		return Meeting;
	}
	public void setMeeting(Meeting meeting) {
		Meeting = meeting;
	}
	@Override
	public String toString() {
		return "Complain [complainNo=" + complainNo + ", complainType=" + complainType + ", complainDetail="
				+ complainDetail + ", complainKind=" + complainKind + ", complainState=" + complainState
				+ ", compainDate=" + compainDate + ", complainantld=" + complainantld + ", defendantId=" + defendantId
				+ ", warningNo=" + warningNo + ", coComment=" + coComment + ", coCommunity=" + coCommunity
				+ ", Meeting=" + Meeting + "]";
	}
	
	

}
