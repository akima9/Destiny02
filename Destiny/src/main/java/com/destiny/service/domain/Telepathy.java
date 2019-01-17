package com.destiny.service.domain;

import java.util.List;

public class Telepathy {
	
	private int		chattingNo;
	private String	userId;
	private int	telepathyNo;
	private String telepathyQuestion;
	private String exOne;
	private String exTwo;
	private String exOneImg;
	private String exTwoImg;
	private List	womanTelepathyResult;
	private List	manTelepathyResult;
	public int getChattingNo() {
		return chattingNo;
	}
	public String getUserId() {
		return userId;
	}
	public int getTelepathyNo() {
		return telepathyNo;
	}
	public String getTelepathyQuestion() {
		return telepathyQuestion;
	}
	public String getExOne() {
		return exOne;
	}
	public String getExTwo() {
		return exTwo;
	}
	public String getExOneImg() {
		return exOneImg;
	}
	public String getExTwoImg() {
		return exTwoImg;
	}
	public List getWomanTelepathyResult() {
		return womanTelepathyResult;
	}
	public List getManTelepathyResult() {
		return manTelepathyResult;
	}
	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setTelepathyNo(int telepathyNo) {
		this.telepathyNo = telepathyNo;
	}
	public void setTelepathyQuestion(String telepathyQuestion) {
		this.telepathyQuestion = telepathyQuestion;
	}
	public void setExOne(String exOne) {
		this.exOne = exOne;
	}
	public void setExTwo(String exTwo) {
		this.exTwo = exTwo;
	}
	public void setExOneImg(String exOneImg) {
		this.exOneImg = exOneImg;
	}
	public void setExTwoImg(String exTwoImg) {
		this.exTwoImg = exTwoImg;
	}
	public void setWomanTelepathyResult(List womanTelepathyResult) {
		this.womanTelepathyResult = womanTelepathyResult;
	}
	public void setManTelepathyResult(List manTelepathyResult) {
		this.manTelepathyResult = manTelepathyResult;
	}
	@Override
	public String toString() {
		return "Telepathy [chattingNo=" + chattingNo + ", userId=" + userId + ", telepathyNo=" + telepathyNo
				+ ", telepathyQuestion=" + telepathyQuestion + ", exOne=" + exOne + ", exTwo=" + exTwo + ", exOneImg="
				+ exOneImg + ", exTwoImg=" + exTwoImg + ", womanTelepathyResult=" + womanTelepathyResult
				+ ", manTelepathyResult=" + manTelepathyResult + "]";
	}
	
	
	
	

}
