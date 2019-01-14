package com.destiny.service.chatting.impl;

import java.util.HashMap;
import java.util.List;
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
		chattingDao.addRandomChatting(chatting);
		System.out.println("addRandomChatting");
	}

	@Override
	public void addPerfectChatting(Chatting chatting) throws Exception {
		chattingDao.addPerfectChatting(chatting);
		System.out.println("addPerfectChatting");
		
	}

	@Override
	public Map<String, Object> listContactMeeting(Chatting chatting) throws Exception {
		List<Chatting> list = chattingDao.listContactMeeting(chatting);
		int totalCount = chattingDao.getTotalCount(chatting);
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		System.out.println("listContactMeeting : "+chattingDao.listContactMeeting(chatting));
		return map;
	}

	@Override
	public String addVoice(String voiceFileName) throws Exception {
		chattingDao.addVoice(voiceFileName);
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
