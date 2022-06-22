package com.gd.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.StudentDAO;
import com.gd.main.dto.StuDTO;

@Service
public class StudentService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StudentDAO dao;

	public ArrayList<StuDTO> list() {
		logger.info("리스트 서비스 요청");
		return dao.list();
	}
	
	
}
