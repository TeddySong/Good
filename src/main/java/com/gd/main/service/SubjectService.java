package com.gd.main.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpSession;

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

	public HashMap<String, Object> subList(HashMap<String, String> params, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String subCo = params.get("subCo");
		String subSe = params.get("subSe");
		boolean login = false;
		
		if (session.getAttribute("loginId") != null) {
			login = true;
			ArrayList<SubDTO> list = dao.subList();
			ArrayList<SubDTO> subCondition = dao.subCondition(subCo);
			ArrayList<SubDTO> sublistSearch = dao.sublistSearch(subSe);
			logger.info("subList : " + list.size());
			map.put("subList", list);
			map.put("subCondition", subCondition);
			map.put("sublistSearch", sublistSearch);
		}
		map.put("login", login);
		return map;
	}
	

	public HashMap<String, Object> subOverlay(String subname) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overname = dao.subOverlay(subname);
		logger.info("중복 과목이 있나?" + overname);
		boolean over = overname == null ?false : true;
		map.put("suboverlay",over);
		return map;
	}

	public boolean subRegister(HashMap<String, String> params, MultipartFile subimg, MultipartFile file) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		SubDTO dto = new SubDTO();
		dto.setSub_name(params.get("sub_name"));
		dto.setSub_condition(params.get("sub_condition"));
		String subtime = params.get("sub_time");
		String subsum = params.get("sub_summary");
		logger.info("커리큘럼!:::" + file.getOriginalFilename());
		logger.info("이미지!:::" + subimg.getOriginalFilename());
		
		int row = dao.subRegister(dto);
		int subno = dto.getSub_no();
		
		boolean success = false;
		if(row >0) {
			dao.subHome(subtime, subsum, subno);
			subImgSave(subimg, subno);
			fileSave(file, subno);
			System.out.println("DATA ::: " + dto.getSub_no());
			success = true;
		}
		result.put("success", success);
		return success;
	}
	
	
	public void subImgSave(MultipartFile subimg, int subno) {
		
		String oriFileName = subimg.getOriginalFilename(); //파일명
		if(!oriFileName.equals("")) {
			String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
			String newFileName = System.currentTimeMillis()+ext;
			
			try {
				byte[] arr = subimg.getBytes();
				Path path = Paths.get("C:/STUDY/SPRING/Good/src/main/webapp/resources/curri/" + newFileName);
				Files.write(path, arr);
				logger.info(newFileName + " 과목 img save ok");
				dao.subImgWrite(oriFileName,newFileName,subno);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
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
	
	
	// 과목 이미지를 업데이트하면 커리큘럼과 바뀌는 현상
	
	public void subImgUpdate(MultipartFile subimg, int subno) {
		String oriFileName = subimg.getOriginalFilename(); //파일명
		String ext = oriFileName.substring(oriFileName.lastIndexOf(".")).toLowerCase();
		String newFileName = System.currentTimeMillis()+ext;
		logger.info("과목이미지:::" + subimg);
		try {
			ArrayList<SubDTO> subImglist = dao.subImgDetail(Integer.toString(subno));
			
			byte[] arr = subimg.getBytes();
			Path path = Paths.get("C:/STUDY/SPRING/Good/src/main/webapp/resources/curri/" + newFileName);
			Files.write(path, arr);
			
			if(subImglist.isEmpty())
				dao.subImgWrite(oriFileName, newFileName, subno);
			else
				dao.subImgUpdate(oriFileName,newFileName,subno);
			
			
			logger.info(newFileName + " 과목이미지 save ok");
		} catch (IOException e) {
			e.printStackTrace();
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
	

	public HashMap<String, Object> scriptlist(HashMap<String, String> params, boolean login) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		String sub_no = params.get("sub_no");
		String subCo = params.get("subCo");
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 :" + page);
		
		param.put("searchSubNo", sub_no);
		param.put("searchSubCo", subCo);
		
		int allCnt = dao.allCount(param);
		logger.info("allCnt : " + allCnt);
		
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : " + pages);
		
		if(page > pages) {
			page = pages;
		}
		
		map.put("pages", pages);
		map.put("currPage", page);
		
		int offset = (page-1) * cnt;
		logger.info("offset : "+offset); 
		
		ArrayList<SubDTO> list = dao.scriptlist(cnt, offset);
		ArrayList<SubDTO> scrSubSearch = dao.scrSubSearch(sub_no, cnt, offset);
		ArrayList<SubDTO> scSubCondition = dao.scSubCondition(subCo, cnt, offset);
		map.put("list", list);
		map.put("login", login);
		map.put("scrSubSearch", scrSubSearch);
		map.put("scSubCondition", scSubCondition);

		return map;
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
	
	public ArrayList<SubDTO> subImgDetail(String sub_no) {
		return dao.subImgDetail(sub_no);
	}

	public boolean subUpdate(HashMap<String, String> params, MultipartFile subimg, MultipartFile file) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		System.out.println("DATA ::: " + params.toString());
		logger.info("커리큘럼:::"+ file);
		logger.info("과목이미지:::"+ subimg);
		
		boolean success = false;
		int subno = Integer.parseInt(params.get("sub_no"));
		
		
		if(dao.subUpdate(params) >0) {
			success = true;
			if(subimg != null) {
				subImgUpdate(subimg, subno);
			}else {
				
			}
			
			if(file !=null) {
				fileUpdate(file, subno);
			}else {
				
			}
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

	public ArrayList<SubDTO> scrSublist() {
		logger.info("scr 과목 list 요청");
		return dao.scrSublist();
	}

	public boolean scrReg(HashMap<String, String> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		
		if(dao.scrReg(params)>0) {
			success = true;
		}
		
		result.put("success", success);
		return success;
	}


	/* 중복코드
	public HashMap<String, Object> scrSubSearch(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sub_no = params.get("sub_no");
		logger.info("선택 과목번호:::"+sub_no);
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 :" + page);
		
		int allCnt = dao.allCount();
		logger.info("allCnt : " + allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : " + pages);
		
		if(page > pages) {
			page = pages;
		}
		
		map.put("pages", pages);
		map.put("currPage", page);
		
		int offset = (page-1) * cnt;
		logger.info("offset : "+offset);
		logger.info("과목번호 나오나:::" + sub_no);
		ArrayList<SubDTO> scrSubSearch = dao.scrSubSearch(sub_no);
		map.put("scrSublist", scrSubSearch);
		
		return map;
	}

	public HashMap<String, Object> scSubCondition(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String subCo = params.get("subCo");
		logger.info("선택 노출상태:::"+subCo);
		ArrayList<SubDTO> scSubCondition = dao.scSubCondition(subCo);
		map.put("scSubCondition", scSubCondition);
		
		return map;
	}
	 

	public HashMap<String, Object> subCondition(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String subCo = params.get("subCo");
		logger.info("선택 노출상태:::"+subCo);
		ArrayList<SubDTO> subCondition = dao.subCondition(subCo);
		map.put("subCondition", subCondition);
		
		return map;
	}

	public HashMap<String, Object> sublistSearch(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String subSe = params.get("subSe");
		logger.info("과목 검색:::"+subSe);
		ArrayList<SubDTO> sublistSearch = dao.sublistSearch(subSe);
		map.put("sublistSearch", sublistSearch);
		
		return map;
	}
	
	*/

	


	
}
