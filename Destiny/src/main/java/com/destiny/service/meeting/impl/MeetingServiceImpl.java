package com.destiny.service.meeting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;
import com.destiny.service.letter.LetterDao;
import com.destiny.service.meeting.MeetingDao;
import com.destiny.service.meeting.MeetingService;

@Service("meetingServiceImpl")
public class MeetingServiceImpl implements MeetingService {
	@Autowired
	@Qualifier("meetingDaoImpl")
	private MeetingDao meetingDao;

	public void setLetterDao(MeetingDao meetingDao) {
		this.meetingDao = meetingDao;
	}
	
	public MeetingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getInterestList() throws Exception {
		List<Meeting> list= meetingDao.getInterestList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		return map;
	}

	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		meetingDao.addMeeting(meeting);
	}
	
	@Override
	public void addAct(Meeting meeting) throws Exception {
		meetingDao.addAct(meeting);
		
	}
	
	@Override
	public void addCrewList(Meeting meeting) throws Exception {
		meetingDao.addCrewList(meeting);
		
	}

	@Override
	public Map<String, Object> getMeetingList(Search search) throws Exception {
		List<Meeting> list= meetingDao.getMeetingList(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		return map;
	}

	@Override
	public Meeting getMeeting(int meetingNo) throws Exception {
		return meetingDao.getMeeting(meetingNo);
	}
	
	@Override
	public int getAct(int meetingNo) throws Exception {
		return meetingDao.getAct(meetingNo);
	}
	
	@Override
	public int getCrewCount(int meetingNo) throws Exception {
		return meetingDao.getCrewCount(meetingNo);
	}

	@Override
	public Map<String, Object> getCrew(int meetingNo) throws Exception {
		List<Meeting> crewList= meetingDao.getCrew(meetingNo);
		
		Map<String, Object> crewMap = new HashMap<String, Object>();
		crewMap.put("crewList", crewList );
		return crewMap;
	}
	
	@Override
	public void updateViews(int meetingNo) throws Exception {
		meetingDao.updateViews(meetingNo);
	}

	@Override
	public Map<String, Object> getBestProduct() throws Exception {
		List<Meeting> bestList= meetingDao.getBestProduct();
		
		Map<String, Object> bestMap = new HashMap<String, Object>();
		bestMap.put("bestList", bestList );
		return bestMap;
	}

	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		meetingDao.updateMeeting(meeting);
		
	}

	@Override
	public void updateContentsMeeting(Meeting meeting) throws Exception {
		meetingDao.updateContentsMeeting(meeting);
		
	}

	@Override
	public int addCrewM(Meeting meeting) throws Exception {
		return meetingDao.addCrewM(meeting);
		
	}

	@Override
	public int checkDuplicationCrew(Meeting meeting) throws Exception {
		return meetingDao.checkDuplicationCrew(meeting);
	}

	@Override
	public int addCrewAct(Meeting meeting) throws Exception {
		return meetingDao.addCrewAct(meeting);
	}

	@Override
	public Meeting getActNo(Meeting meeting) throws Exception {
		return meetingDao.getActNo(meeting);
	}

	@Override
	public Meeting getCrewNo(Meeting meeting) throws Exception {
		return meetingDao.getCrewNo(meeting);
	}

	

	

	

	

	
	
}
