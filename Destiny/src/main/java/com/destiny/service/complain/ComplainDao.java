package com.destiny.service.complain;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Complain;

public interface ComplainDao {
	
	//insert
	public void addComplain(Complain complain) throws Exception;
	
/*	//select one
	public Complain getComplain(int compalinNo) throws Exception;
	
	//select list
	public List<Complain> getComplainList(Search search) throws Exception;
	
	//update
	public void updateComplain(Complain compalin) throws Exception;
	
	//�Խ��� page ó���� ���� ��ü row(totalCount) return
	public int getTotalCount(Search search) throws Exception;*/

}
