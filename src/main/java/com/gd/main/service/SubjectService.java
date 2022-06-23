package com.gd.main.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gd.main.dao.SubjectDAO;
import com.gd.main.dto.SubDTO;

@Service
public class SubjectService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SubjectDAO dao;

	public ArrayList<SubDTO> subList() {
		return dao.subList();
	}

	public HashMap<String, Object> subOverlay(String subname) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overname = dao.subOverlay(subname);
		logger.info("중복 과목이 있나?" + overname);
		boolean over = overname == null ?false : true;
		map.put("suboverlay",over);
		return map;
	}

	public boolean subRegister(HashMap<String, String> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("DATA ::: " + params.toString());
		System.out.println("DATA ::: " + params.get("sub_time"));
		System.out.println("DATA ::: " + params.get("sub_summary"));
		
		SubDTO dto = new SubDTO();
		dto.setSub_name(params.get("sub_name"));
		dto.setSub_condition(params.get("sub_condition"));
		//dto.setSub_time(params.get("sub_time"));
		//dto.setSub_summary(params.get("sub_summary"));
		
		int row = dao.subRegister(dto);
		int sub_no = dto.getSub_no();
		
		boolean success = false;
		if(row >0) {
			System.out.println("DATA ::: " + dto.getSub_no());
			success = true;
		}
		result.put("success", success);
		return success;
	}
	
	public void subHome(HashMap<String, String> params, int sub_no) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		SubDTO dto = new SubDTO();
		dto.setSub_time(params.get("sub_time"));
		dto.setSub_summary(params.get("sub_summary"));
		dao.subHome(params,sub_no);
	}
	
	

	
	
	
}
