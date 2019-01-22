package com.destiny.service.Act.impl;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.destiny.service.user.UserDao;
import com.destiny.common.Search;
import com.destiny.service.Act.ActDao;
import com.destiny.service.Act.ActService;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;


@Service("actServiceImpl")
public class ActServiceImpl implements ActService {

	@Autowired
	@Qualifier("actDaoImpl")
	private ActDao actDao;

	public void setUserDao(ActDao actDao) {
		this.actDao = actDao;
	}
	
	public ActServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getMeetingListByMaster(Search search, String userId) throws Exception {
		List<Meeting> list = actDao.getMeetingListByMaster(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int totalCountByMaster = actDao.getTotalCountByMaster(userId);
		System.out.println("ServiceImpl 에서의 totalCountByMaster : " + totalCountByMaster);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCountByMaster", totalCountByMaster);
		
		return map;
	}

	@Override
	public Map<String, Object> getCommunityListByWriter(Search search, String userId) throws Exception {
		List<Community> list = actDao.getCommunityListByWriter(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int getTotalCountByWriter = actDao.getTotalCountByWriter(userId);
		System.out.println("ServiceImpl 에서의 getTotalCountByWriter : " + getTotalCountByWriter);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("getTotalCountByWriter", getTotalCountByWriter);
		
		return map;
	}

	@Override
	public Map<String, Object> getCommentListByWriter(Search search, String userId) throws Exception {
		List<Comment> list = actDao.getCommentListByWriter(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int getCommentListByWriter = actDao.getTotalCountByCommentSwiter(userId);
		System.out.println("ServiceImpl 에서의 getCommentListByWriter : " + getCommentListByWriter);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("getTotalCountByWriter", getCommentListByWriter);
		
		return map;
	}
	
	

}
