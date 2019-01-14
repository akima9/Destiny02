package com.destiny.service.domain;

import java.util.List;

public class Telepathy {
	
	private int		chattingNo;
	private String	userId;
	private List	telepathyNo;
	private List	womanTelepathyResult;
	private List	manTelepathyResult;
	public int getChattingNo() {
		return chattingNo;
	}
	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List getTelepathyNo() {
		return telepathyNo;
	}
	public void setTelepathyNo(List telepathyNo) {
		this.telepathyNo = telepathyNo;
	}
	public List getWomanTelepathyResult() {
		return womanTelepathyResult;
	}
	public void setWomanTelepathyResult(List womanTelepathyResult) {
		this.womanTelepathyResult = womanTelepathyResult;
	}
	public List getManTelepathyResult() {
		return manTelepathyResult;
	}
	public void setManTelepathyResult(List manTelepathyResult) {
		this.manTelepathyResult = manTelepathyResult;
	}
	@Override
	public String toString() {
		return "Telepathy [chattingNo=" + chattingNo + ", userId=" + userId + ", telepathyNo=" + telepathyNo
				+ ", womanTelepathyResult=" + womanTelepathyResult + ", manTelepathyResult=" + manTelepathyResult + "]";
	}
	
	

}
