package com.destiny.service.complain.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.complain.ComplainDao;
import com.destiny.service.complain.ComplainService;
import com.destiny.service.domain.Complain;

@Service("complainServiceImpl")
public class ComplainServiceImpl implements ComplainService{
	
	///Field
	@Autowired
	@Qualifier("complainDaoImpl")
	private ComplainDao complainDao;

	public void setComplainDao(ComplainDao complainDao) {
		this.complainDao = complainDao;
	}

	///Constructor
	public ComplainServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addComplain(Complain complain) throws Exception {
		complainDao.addComplain(complain);
	}
	
	
}
