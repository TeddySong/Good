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

	public boolean subRegister(HashMap<String, String> params, MultipartFile file) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
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
			fileSave(file, subno);
			
			System.out.println("DATA ::: " + dto.getSub_no());
			success = true;
		}
		result.put("success", success);
		return success;
	}
	
	
	public void fileSave(MultipartFile file, int subno) {
		
		String oriFileName = file.getOriginalFilename(); //파일명
		if(!oriFileName.equals("")) {
			String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
			String newFileName = System.currentTimeMillis()+ext;
			
			try {
				byte[] arr = file.getBytes();
				Path path = Paths.get("C:/STUDY/SPRING/Good/src/main/webapp/resources/curri/" + newFileName);
				Files.write(path, arr);
				logger.info(newFileName + " save ok");
				dao.fileWrite(oriFileName,newFileName,subno);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void fileUpdate(MultipartFile file, int subno) {
		String oriFileName = file.getOriginalFilename(); //파일명
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
		String newFileName = System.currentTimeMillis()+ext;
		
		try {
			ArrayList<SubDTO> curriList = dao.subCurriDetail(Integer.toString(subno));
			
			byte[] arr = file.getBytes();
			Path path = Paths.get("C:/STUDY/SPRING/Good/src/main/webapp/resources/curri/" + newFileName);
			Files.write(path, arr);
			
			if(curriList.isEmpty())
				dao.fileWrite(oriFileName, newFileName, subno);
			else
				dao.fileUpdate(oriFileName,newFileName,subno);
			
			
			logger.info(newFileName + " save ok");
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	
	public ArrayList<SubDTO> subCurriDetail(String sub_no) {
		return dao.subCurriDetail(sub_no);
	}

	public boolean subUpdate(HashMap<String, String> params, MultipartFile file) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("DATA ::: " + params.toString());
		
		boolean success = false;
		int subno = Integer.parseInt(params.get("sub_no"));
		
		if(dao.subUpdate(params) >0) {
			success = true;
			if(file != null) 
				fileUpdate(file, subno);
		}
		result.put("success", success);
		return success;
	}

	public int scrDel(ArrayList<String> scrDelList) {
		
		int cnt = 0;
		for (String scr_no : scrDelList) {
			cnt += dao.scrDel(scr_no);
		}
		return cnt;
	}

	
}
