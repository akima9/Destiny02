package com.destiny.service.find;

import java.util.List;

import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;

 
public interface FindService {
	
	//ȸ�� �� ã��
	public int getUserResult(Find find) throws Exception;
	
	//����ã��
	public List<Meeting> getMeetingResult(String town) throws Exception;

}