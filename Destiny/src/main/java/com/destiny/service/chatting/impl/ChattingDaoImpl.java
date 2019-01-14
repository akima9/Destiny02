package com.destiny.service.chatting.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import com.destiny.service.chatting.ChattingDao;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;

@Repository("chattingDaoImpl")
public class ChattingDaoImpl implements ChattingDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public ChattingDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addRandomChatting(Chatting chatting) throws Exception {
		sqlSession.insert("ChattingMapper.addChatting", chatting);
		
	}

	@Override
	public void addPerfectChatting(Chatting chatting) throws Exception {
		sqlSession.insert("ChattingMapper.addChatting", chatting);
		
	}

	@Override
	public List<Chatting> listContactMeeting(Chatting chatting) throws Exception {
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

	@Override
	public int getTotalCount(Chatting chatting) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
