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
	public Chatting getChatting(Chatting chatting) throws Exception {
		sqlSession.selectOne("ChattingMapper.getChatting", chatting);
		return sqlSession.selectOne("ChattingMapper.getChatting", chatting);
	}

	@Override
	public List<Chatting> listContactMeeting(Chatting chatting) throws Exception {
		sqlSession.selectList("ChattingMapper.getChatting", chatting);
		return sqlSession.selectList("ChattingMapper.getChatting", chatting);
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
		sqlSession.update(contact);
		
	}

	@Override
	public List<Telepathy> listTelepathy(int chattingNo) throws Exception {
		sqlSession.selectList("ChattingMapper.getChatting", chattingNo);
		return sqlSession.selectList("ChattingMapper.getChatting", chattingNo);
	}

	@Override
	public int getTotalCount(Chatting chatting) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public String getTelepathyResult(Telepathy telepathy) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
