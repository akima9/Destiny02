package com.destiny.service.chatting.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.chatting.ChattingDao;
import com.destiny.service.chatting.ChattingService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;


@Service("chattingServiceImpl")
public class ChattingServiceImpl implements ChattingService {
	@Autowired
	@Qualifier("chattingDaoImpl")
	private ChattingDao chattingDao;
	
	public void setChattingtDao(ChattingDao chattingDao) {
		this.chattingDao = chattingDao;
	}	
	
	public ChattingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addRandomChatting(Chatting chatting) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addPerfectChatting(Chatting chatting) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> listContactMeeting(Chatting chatting) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String addVoice(String voiceFileName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String addImage(String imageFileName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateContactMeeting(String contact) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> listTelepathy(Telepathy telepathy) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
