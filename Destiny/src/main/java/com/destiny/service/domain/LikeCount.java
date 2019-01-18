package com.destiny.service.domain;

public class LikeCount {
	
	private int likecountNo;
	private String likecountId;
	private int likecountCommunityNo;
	private String likecountCheck;
	
	
	public int getLikecountNo() {
		return likecountNo;
	}
	public void setLikecountNo(int likecountNo) {
		this.likecountNo = likecountNo;
	}
	public String getLikecountId() {
		return likecountId;
	}
	public void setLikecountId(String likecountId) {
		this.likecountId = likecountId;
	}
	public int getLikecountCommunityNo() {
		return likecountCommunityNo;
	}
	public void setLikecountCommunityNo(int likecountCommunityNo) {
		this.likecountCommunityNo = likecountCommunityNo;
	}
	public String getLikecountCheck() {
		return likecountCheck;
	}
	public void setLikecountCheck(String likecountCheck) {
		this.likecountCheck = likecountCheck;
	}
	@Override
	public String toString() {
		return "LikeCount [likecountNo=" + likecountNo + ", likecountId=" + likecountId + ", likecountCommunityNo="
				+ likecountCommunityNo + ", likecountCheck=" + likecountCheck + "]";
	}
	
	
	
}
