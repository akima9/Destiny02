package com.destiny.service.meeting.impl;

import java.io.FileOutputStream;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.destiny.service.domain.Meeting;
import com.destiny.service.meeting.MeetingDao;

@Repository("meetingDaoImpl")
public class MeetingDaoImpl implements MeetingDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public MeetingDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<Meeting> getInterestList() throws Exception {
		System.out.println("관심사 맵퍼연결부");
		return sqlSession.selectList("MeetingMapper.getInterestList");
	}

	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		sqlSession.insert("MeetingMapper.addMeeting", meeting);
	}
}
