package com.destiny.service.user.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserDao;
import com.destiny.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}
	
	@Override
	public User getUserByNickName(String nickName) throws Exception {
		return userDao.getUserByNickName(nickName);
	}
	
	@Override
	public User getUserByEmail(String email) throws Exception {
		return userDao.getUserByEmail(email);
	}

	@Override
	public User getUserByPhone(String phone) throws Exception {
		return userDao.getUserByPhone(phone);
	}

	@Override
	public void attendLogin(User user) throws Exception {
		userDao.attendLogin(user);
	}
	
	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	@Override
	public Map<String, Object> getLocationList(String city) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Location> list = userDao.getLocationList(city);
		map.put("list", list);
		return map;
	}

	@Override
	public List<String> getInterestByUser(int[] interestNo) throws Exception {
		List<String> list = new ArrayList<String>();
		
		list.add(userDao.getInterest(interestNo[0]));
		list.add(userDao.getInterest(interestNo[1]));
		list.add(userDao.getInterest(interestNo[2]));
		
		return list;
	}

	@Override
	public Map<String, Object> getTypeByUser(int[] typeNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("myType", userDao.getType(typeNo[0]));
		map.put("firstType", userDao.getType(typeNo[1]));
		map.put("secondType", userDao.getType(typeNo[2]));
		map.put("thirdType", userDao.getType(typeNo[3]));
		
		return map;
	}
	
	
}
