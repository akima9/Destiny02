package com.destiny.service.domain;

import org.springframework.web.multipart.MultipartFile;

public class Meeting {
	
	private	int		meetingNo;
	private	String	role;
	private	String	meetingMasterId;
	private	String	masterProfileImg;
	private String	meetingCenter;
	private String 	meetingName;
	private	String	titleImg;
	private	String	meetingDetail;
	private	String	meetingRule;
	private String	interestName;
	private	String	meetingLocation;
	private	String	meetingDate;
	private	String	meetingDay;
	private	String	meetingTime;
	private	String	snooze;
	private	String	meetingDues;
	private	String	meetingViews;
	private	String	meetingCondition;
	private	String	shutDownDate;
	private	String	meetingCrewLimit;
	private int		interestNo;
	private	String	actCountNo;
	private	String	interview;
	private MultipartFile  imgFile;
	
	public int getMeetingNo() {
		return meetingNo;
	}
	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getMeetingMasterId() {
		return meetingMasterId;
	}
	public void setMeetingMasterId(String meetingMasterId) {
		this.meetingMasterId = meetingMasterId;
	}
	public String getMasterProfileImg() {
		return masterProfileImg;
	}
	public void setMasterProfileImg(String masterProfileImg) {
		this.masterProfileImg = masterProfileImg;
	}
	public String getMeetingCenter() {
		return meetingCenter;
	}
	public void setMeetingCenter(String meetingCenter) {
		this.meetingCenter = meetingCenter;
	}
	public String getMeetingName() {
		return meetingName;
	}
	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getMeetingDetail() {
		return meetingDetail;
	}
	public void setMeetingDetail(String meetingDetail) {
		this.meetingDetail = meetingDetail;
	}
	public String getMeetingRule() {
		return meetingRule;
	}
	public void setMeetingRule(String meetingRule) {
		this.meetingRule = meetingRule;
	}
	public String getInterestName() {
		return interestName;
	}
	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}
	public String getMeetingLocation() {
		return meetingLocation;
	}
	public void setMeetingLocation(String meetingLocation) {
		this.meetingLocation = meetingLocation;
	}
	public String getMeetingDate() {
		return meetingDate;
	}
	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}
	public String getMeetingDay() {
		return meetingDay;
	}
	public void setMeetingDay(String meetingDay) {
		this.meetingDay = meetingDay;
	}
	public String getMeetingTime() {
		return meetingTime;
	}
	public void setMeetingTime(String meetingTime) {
		this.meetingTime = meetingTime;
	}
	public String getSnooze() {
		return snooze;
	}
	public void setSnooze(String snooze) {
		this.snooze = snooze;
	}
	public String getMeetingDues() {
		return meetingDues;
	}
	public void setMeetingDues(String meetingDues) {
		this.meetingDues = meetingDues;
	}
	public String getMeetingViews() {
		return meetingViews;
	}
	public void setMeetingViews(String meetingViews) {
		this.meetingViews = meetingViews;
	}
	
	public String getShutDownDate() {
		return shutDownDate;
	}
	public void setShutDownDate(String shutDownDate) {
		this.shutDownDate = shutDownDate;
	}
	public String getMeetingCrewLimit() {
		return meetingCrewLimit;
	}
	public void setMeetingCrewLimit(String meetingCrewLimit) {
		this.meetingCrewLimit = meetingCrewLimit;
	}
	public int getInterestNo() {
		return interestNo;
	}
	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}
	public String getActCountNo() {
		return actCountNo;
	}
	public void setActCountNo(String actCountNo) {
		this.actCountNo = actCountNo;
	}
	public String getInterview() {
		return interview;
	}
	public void setInterview(String interview) {
		this.interview = interview;
	}
	
	public String getMeetingCondition() {
		return meetingCondition;
	}
	public void setMeetingCondition(String meetingCondition) {
		this.meetingCondition = meetingCondition;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	@Override
	public String toString() {
		return "Meeting [meetingNo=" + meetingNo + ", role=" + role + ", meetingMasterId=" + meetingMasterId
				+ ", masterProfileImg=" + masterProfileImg + ", meetingCenter=" + meetingCenter + ", meetingName="
				+ meetingName + ", titleImg=" + titleImg + ", meetingDetail=" + meetingDetail + ", meetingRule="
				+ meetingRule + ", interestName=" + interestName + ", meetingLocation=" + meetingLocation
				+ ", meetingDate=" + meetingDate + ", meetingDay=" + meetingDay + ", meetingTime=" + meetingTime
				+ ", snooze=" + snooze + ", meetingDues=" + meetingDues + ", meetingViews=" + meetingViews
				+ ", meetingCondition=" + meetingCondition + ", shutDownDate=" + shutDownDate + ", meetingCrewLimit="
				+ meetingCrewLimit + ", interestNo=" + interestNo + ", actCountNo=" + actCountNo + ", interview="
				+ interview + ", imgFile=" + imgFile + "]";
	}
	
	
	
}
