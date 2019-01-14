package com.destiny.service.find;

import java.util.Map;

import com.destiny.service.domain.Find;

 
public interface FindService {
	
	//회원 수 찾기
	public int getUserResult(Find find) throws Exception;
	
	//모임찾기
	public Map<String, Object> getMeetingResult(String town) throws Exception;

}