package com.destiny.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserDao;
import com.destiny.service.domain.Letter;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

	@Override
	public User getUserByNickName(String nickName) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserByNickName", nickName);
	}
	
	@Override
	public User getUserByEmail(String email) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserByEmail", email);
	}

	@Override
	public User getUserByPhone(String phone) throws Exception {
		return sqlSession.selectOne("UserMapper.getUserByPhone", phone);
	}

	@Override
	public void attendLogin(User user) throws Exception {
		sqlSession.update("UserMapper.attendLogin", user);
	}
	
	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}

	@Override
	public List<Location> getLocationList(String city) throws Exception {
		return sqlSession.selectList("UserMapper.locationList", city);
	}

	@Override
	public String getInterest(int interestNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getInterest", interestNo);
	}

	@Override
	public String getType(int typeNo) throws Exception {
		return sqlSession.selectOne("UserMapper.getType", typeNo);
	}

	@Override
	public List<String> getTypeList() throws Exception {
		return sqlSession.selectList("UserMapper.getTypeList");
	}

	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public void updateType(User user) throws Exception {
		sqlSession.update("UserMapper.updateType", user);
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}

	@Override
	public int getUserTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
	

	public void sendLetter(Letter letter) throws Exception{
		sqlSession.insert("UserMapper.sendLetter", letter);
	}
	
	public Letter getLetter(int no) throws Exception{
		sqlSession.update("UserMapper.updateReceiveDate", no);
		return sqlSession.selectOne("UserMapper.getLetter", no);
	}
	
	public Map<String, Object> getLetterList(Search search, String Id) throws Exception{
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("Id", Id);
		inputMap.put("search", search);
		
		List<Letter> listReceive = sqlSession.selectList("UserMapper.getReceiveLetterList", inputMap);
		List<Letter> listSend = sqlSession.selectList("UserMapper.getSendLetterList", inputMap);
		
		Map<String, Object> getMap = new HashMap<String, Object>();
		
		getMap.put("listReceive", listReceive);
		getMap.put("listSend", listSend);
		
		System.out.println("dao에서 전달된 값들 : " + Id + search);
		System.out.println("dao에 매핑된 값 : " + inputMap);
		System.out.println("dao에서 확보한 map : " + getMap);
		
		return getMap;
	}
	
	public int getReceiveLetterTotalCount(String Id) throws Exception{
		return sqlSession.selectOne("UserMapper.getReceiveLetterTotalCount", Id);
	}
	
	public int getSendLetterTotalCount(String Id) throws Exception{
		return sqlSession.selectOne("UserMapper.getSendLetterTotalCount", Id);
	}
	
	
}
