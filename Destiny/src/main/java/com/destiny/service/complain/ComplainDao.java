package com.destiny.service.complain;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Complain;

public interface ComplainDao {
	
	//insert
	public void addComplain(Complain complain) throws Exception;
	
	//select list
	public List<Complain> getComplainList(Search search) throws Exception;
	
	//게시판 page 처리를 위한 전체 row(totalCount) return
	public int getTotalCount(Search search) throws Exception;

}
