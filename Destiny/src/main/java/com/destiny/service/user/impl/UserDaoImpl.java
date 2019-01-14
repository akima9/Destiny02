package com.destiny.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserDao;

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
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
		
	}
	
	
	
	
	
}
