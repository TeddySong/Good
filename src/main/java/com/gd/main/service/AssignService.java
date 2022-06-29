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
		ArrayList<AssListDTO> assStuCoList = dao.assStuCoList(params,stu_no);
		assMap.put("assStuCoList", assStuCoList);
		
		return assMap;
	}
	 
	 
}
