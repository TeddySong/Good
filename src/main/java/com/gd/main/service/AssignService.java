package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.AssignDAO;
import com.gd.main.dto.AssListDTO;

@Service
public class AssignService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AssignDAO dao;

	public HashMap<String, Object> assList(HashMap<String, String> params) {
		logger.info("배정 리스트 서비스 도착");

		HashMap<String, Object> map = new HashMap<String, Object>();

		// cnt : 리스트 갯수 , page : 보여줄 페이지수
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		String assSearchTarget = params.get("assSearchTarget");
		String search = params.get("search");
		
		logger.info("보여줄 페이지 : " + page);
		// 1페이지 -> 0(offset:게시글 시작 번호)
		// 2페이지 -> 5
		// 3페이지 -> 10
		// 4페이지 -> 15
		// 5페이지 -> 20
		
		map.put("cnt", cnt);
		map.put("assSearchTarget", assSearchTarget);
		map.put("search", search);
	
		//총 (allCnt) / 페이지동 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		ArrayList<AssListDTO> allCount = dao.allCount(map);
		int allCnt = allCount.size();
		logger.info("allCnt : " + allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt) + 1 : (allCnt / cnt);
		logger.info("총페이지 : " + pages);
		
		if(page > pages) {//5개씩 보는 마지막 페이지로 갔을 대 , 15개씩 보는 걸로 바꿨을때 뜨는 에러 해결
			page = pages;
		}
		
		map.put("pages", pages);
		map.put("currPage", page);
		
		int offset = (page - 1) * cnt;
		logger.info("offset ,cnt : " + offset + cnt);
		
		map.put("offset", offset);

		ArrayList<AssListDTO> assList = dao.assList(map);
		logger.info("assList : " + assList.size());
		map.put("assList", assList);
		
		logger.info("리스트 배열: " + assList);
		
		return map;
	}


	
	  public HashMap<String, Object> assCoList(HashMap<String, String> params, String co_no) { 
		 
		   /*
			* HashMap<String, Object> assMap = new HashMap<String, Object>(); 
		    * int cnt = Integer.parseInt(params.get("cnt"));
		    *  int page =Integer.parseInt(params.get("page"));
			*/
		  
		  HashMap<String, Object> map = new HashMap<String, Object>();
		  int cnt = Integer.parseInt(params.get("cnt"));
		  int page = Integer.parseInt(params.get("page"));
		  String assSearchTarget = params.get("assSearchTarget");
		  String search = params.get("search");
		  logger.info("보여줄 페이지 : " + page);
		  
		  map.put("cnt", cnt);
		  map.put("assSearchTarget", assSearchTarget);
		  map.put("search", search);
		  map.put("co_no", co_no);
		  
		  //assMap.put("params", params);
		  
		  ArrayList<AssListDTO> allCoCount = dao.allCoCount(map);
		  int allCnt = allCoCount.size();
		  logger.info("allCnt : " + allCnt);
		  int pages = allCnt % cnt > 0?(allCnt/cnt) + 1: (allCnt/cnt);
		  logger.info("pages : " + pages);
		  
		  map.put("pages", pages);
		  map.put("currPage", page);
		  
		  int offset = (page-1) * cnt;
		  logger.info("offset : " + offset);
		  map.put("offset", offset);
		  		  
		  logger.info(map + "/");
		  
		  ArrayList<AssListDTO> assCoList = dao.assCoList(map);
		  logger.info(assCoList + "~");
		  map.put("assCoList", assCoList);
	
		  return map;
	  }

	public ArrayList<AssListDTO> assStuCoList(String stu_no) {
		
		
		
		return dao.assStuCoList(stu_no);
		/*
		 * HashMap<String, Object> assMap = new HashMap<String, Object>();
		 * assMap.put("params", params); assMap.put("stu_no", stu_no);
		 * 
		 * ArrayList<AssListDTO> assStuCoList = dao.assStuCoList(assMap);
		 * assMap.put("assStuCoList", assStuCoList);
		 * 
		 * logger.info(assMap + "~");
		 * 
		 * return assMap;
		 */
	}



	public HashMap<String, Object> courList2(HashMap<String, String> params, String stu_no) {
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
		
		searchResult.put("cnt", cnt);
		
		
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
		logger.info("cnt : " +cnt);
		
		int allCnt = dao.allCountCo(searchResult);

		logger.info("allCnt : "+allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : "+pages);
		
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		
		map.put("currPage", page); //현재 페이지
	
		//map.put("stu_no", stu_no);
		
		int offset = (page-1) * cnt;
		logger.info("offset,cnt : "+offset+","+cnt); //offset:게시글 시작번호
		searchResult.put("offset", offset);
		logger.info("offset : " + offset);
		
		
		
		ArrayList<AssListDTO> courList = dao.courList2(searchResult);
		
	
		map.put("courList", courList);
		logger.info(map + "~");
		
		return map;
	}



	public HashMap<String, Object> assStuListInsert(HashMap<String, String> params,String stu_no) {
			
		HashMap<String, Object> assMap = new HashMap<String, Object>();
		String co_no = params.get("co_no");
		//assMap.put("params", params);
		assMap.put("stu_no", stu_no);
		assMap.put("co_no", co_no);
		String waiting = "대기";
		assMap.put("ass_condition", waiting);
		
		logger.info(assMap + "여긴어때");
		
		int row = dao.assStuListInsert(assMap);
		
		boolean cnt = false;
		if (row > 0) {
			cnt = true;

		}
		assMap.put("success", cnt);
		return assMap;
		
		}



	public HashMap<String, Object> assStuListchange(HashMap<String, String> params, String stu_no) {
		
		HashMap<String, Object> assMap = new HashMap<String, Object>();
		int stuCo  = Integer.parseInt(params.get("stuCo"));
		assMap.put("stuCo", stuCo);
		logger.info(assMap + "sss");
		//HashMap<String, Object> assMap = new HashMap<String, Object>();
		assMap.put("params", params);
		assMap.put("stu_no", stu_no);
		logger.info(stu_no);
		
		ArrayList<AssListDTO> assStuListchange = dao.assStuListchange(assMap);
		assMap.put("assStuListchange", assStuListchange);
		
		logger.info(assMap + "~");
		
		return assMap;

		
	}

	public HashMap<String, Object> coSearchUp(HashMap<String, String> params, String stu_no ) {
		
		
		HashMap<String, Object> assMap = new HashMap<String, Object>();
		int stuCo  = Integer.parseInt(params.get("stuCo"));
		String ass_condition = params.get("ass_condition");
		assMap.put("stuCo", stuCo);
		assMap.put("ass_condition",ass_condition);
		//assMap.put("co_no", co_no);
		logger.info("나오려나...? "+assMap);
		//assMap.put("params", params);
		assMap.put("stu_no", stu_no);
		
		//ArrayList<AssListDTO> coSearchUp = dao.coSearchUp(assMap);
		//assMap.put("coSearchUp", coSearchUp);
		
		int row = dao.coSearchUp(assMap);
		
		boolean cnt = false;
		if (row > 0) {
			cnt = true;

		}
		assMap.put("success", cnt);
		
		
		
		logger.info(assMap + "~");
		
		return assMap;
	}



	public HashMap<String, Object> coSearchDel(HashMap<String, String> params, String stu_no) {
		HashMap<String, Object> assMap = new HashMap<String, Object>();
		int stuCo  = Integer.parseInt(params.get("stuCo"));
		String ass_condition = params.get("ass_condition");
		assMap.put("stuCo", stuCo);
		assMap.put("ass_condition",ass_condition);
		//assMap.put("co_no", co_no);
		logger.info("나오려나...? "+assMap);
		//assMap.put("params", params);
		assMap.put("stu_no", stu_no);
		
		//ArrayList<AssListDTO> coSearchUp = dao.coSearchUp(assMap);
		//assMap.put("coSearchUp", coSearchUp);
		
		int row = dao.coSearchDel(assMap);
		
		boolean cnt = false;
		if (row > 0) {
			cnt = true;

		}
		assMap.put("success", cnt);
		
		
		
		logger.info(assMap + "~");
		
		return assMap;
	}



	public String nameGet(String stu_no) {
		logger.info("수강신청" + stu_no);
		return dao.nameGet(stu_no);
	}
	

		/*
		 * public HashMap<String, Object> assStuCoList(HashMap<String, String> params, String stu_no) {
		 * 
		 * HashMap<String, Object> assMap = new HashMap<String, Object>();
		 * assMap.put("params", params);
		 *  assMap.put("stu_no", stu_no);
		 * 
		 * ArrayList<AssListDTO> assStuCoList = dao.assStuCoList(assMap);
		 * assMap.put("assStuCoList", assStuCoList);
		 * 
		 * logger.info(assMap + "~");
		 * 
		 * return assMap;
		 *  }
		 */
	 
	 
}
