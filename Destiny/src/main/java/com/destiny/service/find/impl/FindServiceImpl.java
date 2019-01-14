package com.destiny.service.find.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.community.CommunityDao;
import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;
import com.destiny.service.find.FindDao;
import com.destiny.service.find.FindService;

@Service("findServiceImpl")
public class FindServiceImpl implements FindService {
	
	///Field
	@Autowired
	@Qualifier("findDaoImpl")
	private FindDao findDao;
	public void setFindeDao(FindDao findDao) {
		this.findDao = findDao;
	}
	
	public FindServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public int getUserResult(Find find) throws Exception {
		return findDao.getUserResult(find);
	}

	@Override
	public Map<String, Object> getMeetingResult(String town) throws Exception {
		List<Meeting> list = findDao.getMeetingResult(town);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		
		return map;
	}

}
