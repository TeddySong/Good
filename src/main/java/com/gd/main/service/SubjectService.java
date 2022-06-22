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

	public boolean subRegister(HashMap<String, String> params, MultipartFile[] curris) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		SubDTO dto = new SubDTO();
		
		int subno = dto.getSub_no();
		
		boolean success = false;
		if(dao.subRegister(params,curris,subno)>0) {
			success = true;
		}
		result.put("success", success);
		return success;
	}
	
	public void fileSave(MultipartFile[] curris, int subno) {
		for (MultipartFile curri : curris) {
			String oriFileName = curri.getOriginalFilename();
			if(!oriFileName.equals("")) {
				logger.info("업로드 진행");
				String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
				String newFileName = System.currentTimeMillis()+ext;
				logger.info(oriFileName + "->" + newFileName);
				
				
				
				
			}
		}
	}

	
	
	
}
