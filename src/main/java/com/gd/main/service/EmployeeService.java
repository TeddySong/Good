package com.gd.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.EmployeeDAO;

@Service
public class EmployeeService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired EmployeeDAO dao;
	
}
