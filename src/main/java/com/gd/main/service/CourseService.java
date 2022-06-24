package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gd.main.dao.CourseDAO;
import com.gd.main.dto.CourseDTO;
import com.gd.main.dto.SubDTO;

@Service
public class CourseService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CourseDAO dao;
	
	public HashMap<String, Object> courList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//hashmap 을 반환하기위해 객체화
		
		
		int cnt = Integer.parseInt(params.get("cnt"));
		//int cnt = 10;
		
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : "+page);
		// 1페이지 -> 0(offset:게시글 시작 번호)
		// 2페이지 -> 5
		// 3페이지 -> 10
		// 4페이지 -> 15
		// 5페이지 -> 20
		
		//총 갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		int allCnt = dao.allCount();
		logger.info("allCnt : "+allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : "+pages);
		
		if(page > pages) { //5개씩 보는 마지막 페이지로 갔을 때, 15개씩 보는 걸로 바꿨을때 뜨는 에러 해결
			page = pages;
		}
		
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		
		int offset = (page-1) * cnt;
		logger.info("offset : "+offset);
		
		ArrayList<CourseDTO> courList = dao.courList(cnt,offset);
		map.put("courList", courList);
		
		return map;
	}
	
	public CourseDTO courDetail(String co_no) {
		return dao.courDetail(co_no);
	}

	public int courUpdate(HashMap<String, Object> map) {
		/*
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		boolean success = false;
		
		if(dao.courUpdate(params) > 0) {
			success = true;
		}
		
		result.put("success", success);
		logger.info("update success : "+success);
		return success;
		*/
		
		return dao.courUpdate(map);
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

	public HashMap<String, Object> courWrite(HashMap<String, Object> params) {
		HashMap<String, Object> writeResult = new HashMap<String, Object>();

		int row = dao.courWrite(params);
		boolean success = false;
		logger.info("넘어온 값 : "+params);
		if(row>0) {
			success = true;
		}
		
		writeResult.put("success", success);
		
		return writeResult;
	}

	/*
	public ArrayList<CourseDTO> subjectList() {
		logger.info("과목 리스트 호출");
		return dao.subjectList();
	}
*/

	public CourseDTO selectSubName(String sub_no) {
		// TODO Auto-generated method stub
		return dao.selectSubName(sub_no);
	}

	public ArrayList<CourseDTO> selectCourseName(String co_no) {
		// TODO Auto-generated method stub
		return dao.selectCourseName(co_no);
	}

	
}
