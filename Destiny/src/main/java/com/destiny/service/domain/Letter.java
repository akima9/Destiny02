package com.destiny.service.domain;

import java.util.Date;

public class Letter {
	
	private	int			letterNo;
	private	String		senderId;
	private	String		receiverId;
	private	Date		sendLetterDate;
	private	Date		getLetterDate;
	private	String		letterText;
	private	String		letterTitle;
	public int getLetterNo() {
		return letterNo;
	}
	public void setLetterNo(int letterNo) {
		this.letterNo = letterNo;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public Date getSendLetterDate() {
		return sendLetterDate;
	}
	public void setSendLetterDate(Date sendLetterDate) {
		this.sendLetterDate = sendLetterDate;
	}
	public Date getGetLetterDate() {
		return getLetterDate;
	}
	public void setGetLetterDate(Date getLetterDate) {
		this.getLetterDate = getLetterDate;
	}
	public String getLetterText() {
		return letterText;
	}
	public void setLetterText(String letterText) {
		this.letterText = letterText;
	}
	public String getLetterTitle() {
		return letterTitle;
	}
	public void setLetterTitle(String letterTitle) {
		this.letterTitle = letterTitle;
	}
	@Override
	public String toString() {
		return "Letter [letterNo=" + letterNo + ", senderId=" + senderId + ", receiverId=" + receiverId
				+ ", sendLetterDate=" + sendLetterDate + ", getLetterDate=" + getLetterDate + ", letterText="
				+ letterText + ", letterTitle=" + letterTitle + "]";
	}
	
	

}
