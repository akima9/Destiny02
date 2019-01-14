package com.destiny.service.chatting;

import java.util.Map;

import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;

public interface ChattingService {
	
	public void addRandomChatting(Chatting chatting) throws Exception;
	
	public void addPerfectChatting(Chatting chatting) throws Exception;
	
	public Map<String, Object> listContactMeeting(Chatting chatting) throws Exception;
	
	public String addVoice(String voiceFileName) throws Exception;
	
	public String addImage(String imageFileName) throws Exception;
	
	public void updateContactMeeting(String contact) throws Exception;
	
	public Map<String, Object> listTelepathy(Telepathy telepathy) throws Exception;
	
}
