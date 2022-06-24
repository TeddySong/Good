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
		//System.out.println("DATA ::: " + params.get("sub_time"));
		//System.out.println("DATA ::: " + params.get("sub_summary"));
		
		SubDTO dto = new SubDTO();
		dto.setSub_name(params.get("sub_name"));
		dto.setSub_condition(params.get("sub_condition"));
		String subtime = params.get("sub_time");
		String subsum = params.get("sub_summary");
		
		int row = dao.subRegister(dto);
		int subno = dto.getSub_no();
		
		boolean success = false;
		if(row >0) {
			dao.subHome(subtime, subsum, subno);
	
			System.out.println("DATA ::: " + dto.getSub_no());
			success = true;
		}
		result.put("success", success);
		return success;
	}

	public ArrayList<SubDTO> scriptlist() {
		logger.info("과목후기 리스트 요청");
		return dao.scriptlist();
	}

	public SubDTO subDetail(String sub_no) {
		return dao.subDetail(sub_no);
	}

	public ArrayList<SubDTO> subDetailsc(String sub_no) {
		return dao.subDetailsc(sub_no);
	}

	public boolean subUpdate(HashMap<String, String> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("DATA ::: " + params.toString());
		
		boolean success = false;
		if(dao.subUpdate(params) >0) {
			success = true;
		}
		result.put("success", success);
		return success;
	}


	
	
	
	
	
	

	
	
	
}
