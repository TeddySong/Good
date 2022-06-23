package com.gd.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.AssignDAO;
import com.gd.main.dto.AssListDTO;

@Service
public class AssignService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AssignDAO dao;

	public ArrayList<AssListDTO> assList() {
		
		logger.info("배정 리스트 서비스 도착");
		
		return dao.assList();
	}
	
}
