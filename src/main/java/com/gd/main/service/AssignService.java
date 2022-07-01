package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.AssignDAO;
import com.gd.main.dto.AssListDTO;
import com.gd.main.dto.CourseDTO;

@Service
public class AssignService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AssignDAO dao;

	public HashMap<String, Object> assList(HashMap<String, String> params) {
		logger.info("배정 리스트 서비스 도착");

		HashMap<String, Object> assMap = new HashMap<String, Object>();

		// cnt : 리스트 갯수 , page : 보여줄 페이지수
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		String assSearchTarget = params.get("assSearchTarget");
		String search = params.get("search");

		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("assSearchTarget", assSearchTarget);
		data.put("search", search);
		logger.info("조건검색 : " + search + "/" + assSearchTarget);
		assMap.put("currPage", page);// 현재 페이지

		int offset = (page - 1) * cnt;
		logger.info("offset ,cnt : " + offset + cnt);

		data.put("cnt", cnt);
		data.put("offset", offset);

		ArrayList<AssListDTO> assList = dao.assList(data);
		assMap.put("assList", assList);
		

		return assMap;
	}


	
	  public HashMap<String, Object> assCoList(HashMap<String, String> params) { 
		 
			/*
			 * HashMap<String, Object> assMap = new HashMap<String, Object>(); int cnt =
			 * Integer.parseInt(params.get("cnt")); int page =
			 * Integer.parseInt(params.get("page"));
			 */
		  HashMap<String, Object> assMap = new HashMap<String, Object>();
		  ArrayList<AssListDTO> assCoList = dao.assCoList(params);
		  assMap.put("assCoList", assCoList);
		  
		  return assMap;
	  }

	public HashMap<String, Object> assStuCoList(HashMap<String, String> params, String stu_no) {
		
		HashMap<String, Object> assMap = new HashMap<String, Object>();
		assMap.put("params", params);
		assMap.put("stu_no", stu_no);
		
		ArrayList<AssListDTO> assStuCoList = dao.assStuCoList(assMap);
		assMap.put("assStuCoList", assStuCoList);
		
		logger.info(assMap + "~");
		
		return assMap;
	}



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
		
		ArrayList<AssListDTO> courList = dao.courList2(searchResult);
		
	
		map.put("courList", courList);
		
		return map;
	}
	 
	 
}
