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
		return sqlSession.selectList("MeetingMapper.getInterestList");
	}

	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		String picpath = "";
		if(meeting.getImgFile() !=null && !meeting.getImgFile().isEmpty()) {
			MultipartFile file = meeting.getImgFile();
			byte fileData[] = file.getBytes();
			picpath = file.getOriginalFilename();
			FileOutputStream fos = new FileOutputStream("C:\\Users\\Bitcamp\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\meeting" + picpath);
			fos.write(fileData);
			fos.close();
		}
		meeting.setTitleImg(picpath);
		
		sqlSession.insert("MeetingMapper.addMeeting", meeting);
	}

	@Override
	public List<Meeting> getMeetingList() throws Exception {
		return sqlSession.selectList("MeetingMapper.getMeetingList");
	}
}
