package com.gd.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.HomeDAO;

@Service
public class HomeService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired HomeDAO dao;

	public boolean empLogin(String emp_id, String emp_pw) {
		
		String loginId = dao.empLogin(emp_id,emp_pw);
		
		boolean success = false;
		success = loginId == null ? false : true;
	
		return success;
	}

	public String empLoginName(String emp_id) {
		
		return dao.empLoginName(emp_id);
		
	}

	public int empNo(String emp_id) {
		return dao.empNo(emp_id);
	}
	
}
