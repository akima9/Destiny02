package com.destiny.service.complain.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.complain.ComplainDao;
import com.destiny.service.complain.ComplainService;

@Service("complainServiceImpl")
public class ComplainServiceImpl implements ComplainService{
	@Autowired
	@Qualifier("complainDaoImpl")
	private ComplainDao complainDao;

	public void setComplainDao(ComplainDao complainDao) {
		this.complainDao = complainDao;
	}

	public ComplainServiceImpl() {
		System.out.println(this.getClass());
	}
}
