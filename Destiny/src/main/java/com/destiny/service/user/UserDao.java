package com.destiny.service.user;

import java.util.List;
import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// SELECT ONE
	public User getUser(String userId) throws Exception;
	
	public User getUserByNickName(String nickName) throws Exception;
	
	public User getUserByEmail(String email) throws Exception;
	
	public User getUserByPhone(String phone) throws Exception;
	
	public void attendLogin(User user) throws Exception;
	
	public void addUser(User user) throws Exception;
	
	public List<Location> getLocationList(String city) throws Exception;
	
	public String getInterest(int interestNo) throws Exception;
	
	public String getType(int typeNo) throws Exception;
}