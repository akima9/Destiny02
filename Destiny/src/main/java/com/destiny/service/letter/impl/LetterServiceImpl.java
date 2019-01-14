package com.destiny.service.letter.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.letter.LetterDao;
import com.destiny.service.letter.LetterService;

@Service("letterServiceImpl")
public class LetterServiceImpl implements LetterService{
	@Autowired
	@Qualifier("letterDaoImpl")
	private LetterDao letterDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	public LetterServiceImpl() {
		System.out.println(this.getClass());
	}
}
