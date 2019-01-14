package com.destiny.service.domain;

public class Meeting {
	
	private	int		meetingNo;
	private	String	role;
	private	String	meetingMasterId;
	private	String	titleImg;
	private String 	meetingName;
	private	String	meetingDetail;
	private	String	meetingRule;
	private	String	meetingLocation;
	private	String	crewLimit;
	private	String	meetingDate;
	private	String	snooze;
	private	String	meetingTime;
	private	String	meetingDay;
	private	String	meetingDues;
	private	String	profile;
	private	String	actCountNo;
	private	String	interview;
	private int		interestNo;
	private String	interestName;
	private String	meetingCenter;
	
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
	public String getMeetingLocation() {
		return meetingLocation;
	}
	public void setMeetingLocation(String meetingLocation) {
		this.meetingLocation = meetingLocation;
	}
	public String getCrew() {
		return crewLimit;
	}
	public void setCrew(String crew) {
		this.crewLimit = crewLimit;
	}
	public String getMeetingDate() {
		return meetingDate;
	}
	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}
	public String getSnooze() {
		return snooze;
	}
	public void setSnooze(String snooze) {
		this.snooze = snooze;
	}
	public String getMeetingTime() {
		return meetingTime;
	}
	public void setMeetingTime(String meetingTime) {
		this.meetingTime = meetingTime;
	}
	public String getMeetingDay() {
		return meetingDay;
	}
	public void setMeetingDay(String meetingDay) {
		this.meetingDay = meetingDay;
	}
	public String getMeetingDues() {
		return meetingDues;
	}
	public void setMeetingDues(String meetingDues) {
		this.meetingDues = meetingDues;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
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
	public int getInterestNo() {
		return interestNo;
	}
	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}
	public String getInterestName() {
		return interestName;
	}
	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}
	public String getMeetingName() {
		return meetingName;
	}
	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}
	public String getCrewLimit() {
		return crewLimit;
	}
	public void setCrewLimit(String crewLimit) {
		this.crewLimit = crewLimit;
	}
	public String getMeetingCenter() {
		return meetingCenter;
	}
	public void setMeetingCenter(String meetingCenter) {
		this.meetingCenter = meetingCenter;
	}
	@Override
	public String toString() {
		return "Meeting [meetingNo=" + meetingNo + ", role=" + role + ", meetingMasterId=" + meetingMasterId
				+ ", titleImg=" + titleImg + ", meetingName=" + meetingName + ", meetingDetail=" + meetingDetail
				+ ", meetingRule=" + meetingRule + ", meetingLocation=" + meetingLocation + ", crewLimit=" + crewLimit
				+ ", meetingDate=" + meetingDate + ", snooze=" + snooze + ", meetingTime=" + meetingTime
				+ ", meetingDay=" + meetingDay + ", meetingDues=" + meetingDues + ", profile=" + profile
				+ ", actCountNo=" + actCountNo + ", interview=" + interview + ", interestNo=" + interestNo
				+ ", interestName=" + interestName + ", meetingCenter=" + meetingCenter + "]";
	}
	

}
