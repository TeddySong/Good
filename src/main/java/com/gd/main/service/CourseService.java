package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.CourseDAO;
import com.gd.main.dto.CourseDTO;

@Service
public class CourseService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CourseDAO dao;
	
	public HashMap<String, Object> courList2(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//cnt : 리스트 갯수, page : 보여줄 페이지 수
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : "+page);
		
		
		String subName = params.get("subName");
		String courseNameSearch = params.get("courseNameSearch");
		String keyword = params.get("keyword");
		String startSearch = params.get("startSearch");
		String endSearch = params.get("endSearch");
		
		HashMap<String, Object> searchResult = new HashMap<String, Object>();
		searchResult.put("subName", subName);
		searchResult.put("courseNameSearch", courseNameSearch);
		searchResult.put("keyword", keyword);
		
		
		//입력된 날짜가 빈값일 때
		if(startSearch == "") {
			startSearch = "0001-01-01";
		}
		if(endSearch == "") {
			endSearch = "9999-12-31";
		}
		
		searchResult.put("startSearch", startSearch);
		searchResult.put("endSearch", endSearch);
		logger.info("subName : "+subName+" / "+
					"courseNameSearch : "+courseNameSearch+" / "+
					"keyword : "+keyword+" / "+
					"startSearch : "+startSearch+" / "+
					"endSearch : "+endSearch);
		
		//총 갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)

		int allCnt = dao.allCount(searchResult);

		logger.info("allCnt : "+allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : "+pages);
		
		if(pages==0) {pages=1;}
		
		if(page > pages) { //5개씩 보는 마지막 페이지로 갔을 때, 15개씩 보는 걸로 바꿨을때 뜨는 에러 해결
			page = pages;
		}
		
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		
		map.put("currPage", page); //현재 페이지
		
		int offset = (page-1) * cnt;
		logger.info("offset,cnt : "+offset+","+cnt); //offset:게시글 시작번호
		
		
		searchResult.put("cnt", cnt);
		searchResult.put("offset", offset);
		
		ArrayList<CourseDTO> courList = dao.courList2(searchResult);

		map.put("courList", courList);
		
		return map;
	}	

	
	public boolean courseUpdate(HashMap<String, String> params) {
	      HashMap<String, Object> result = new HashMap<String, Object>();
	      logger.info("과정 update 요청");
	      boolean success = false;
	      int row = dao.courseUpdate(params);
	      logger.info("데이터가 넘어왔는지 확인:::"+params);
	      if(row > 0) {
	         success = true;
	         logger.info("데이터가 넘어왔는지 확인:::"+params);
	      }
	      logger.info("수정된 데이터 수 : "+row);
	      
	      result.put("success", success);
	      return success;
	   }

	

	public HashMap<String, Object> courOverlay(String chkCo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overCo = dao.courOverlay(chkCo);
		logger.info("중복 과정명이 있나? "+overCo);
		boolean over = overCo == null ? false : true; //over == true : 얘 중복이야
		//조건:overCo 가 null 맞아? 참이면 false(조건1) 거짓이면 true(조건2)
		map.put("overlay", over);
		
		return map;
	}

	
	public HashMap<String, Object> courRegister(HashMap<String, Object> params, boolean login) {
		HashMap<String, Object> regiResult = new HashMap<String, Object>();
		
		//subject 테이블에 넣을 값(sub_no,sub_name) 객체화
		CourseDTO dto = new CourseDTO();
		String sub_name = (String) params.get("sub_name");
		int sub_no = dto.getSub_no();
		
		int row = dao.courRegister(params);
		boolean success = false;
		logger.info("넘어온 값 : "+params);
		if(row>0) {
			dao.subTable(sub_name,sub_no);
			success = true;
		}
		
		regiResult.put("login", login);
		regiResult.put("success", success);
		
		return regiResult;
	}

	public ArrayList<CourseDTO> subName() {
		return dao.subName();
	}

	public ArrayList<CourseDTO> courseName() {
		return dao.courseName();
	}
	
	public CourseDTO courDetail2(String co_no) {
		return dao.courDetail2(co_no);
	}

	public ArrayList<CourseDTO> dangwa() {
		return dao.dangwa();
	}

	public ArrayList<CourseDTO> jonghab() {
		return dao.jonghab();
	}


	public CourseDTO subDetailHome(String sub_no) {
		return dao.subDetailHome(sub_no);
	}


	public ArrayList<CourseDTO> homeSrcList(String sub_no) {
		return dao.homeSrcList(sub_no);
	}


	
}
