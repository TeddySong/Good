package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.ClientDAO;
import com.gd.main.dto.Client_Dto;


@Service
public class ClientService {
	 Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ClientDAO dao;
	public ArrayList<Client_Dto> list_Client() {
		return dao.list_Client();
		
	}
	public ArrayList<Client_Dto> client_search(String searchType, String keyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType); 
		data.put("keyword", keyword);
		
		
		return dao.client_searh(data);
	}
	public Client_Dto detail_Client(int cli_no) {
		// TODO Auto-generated method stub
		return dao.detail_Client(cli_no);
	}
	public ArrayList<Client_Dto> clientLog(int cli_no) {
		return dao.clientLog(cli_no);
	}
	public ArrayList<HashMap<String, Object>> list_Client2() {
		return dao.list_Client2();
	}
	public int listsearchCount(String searchType, String keyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("searchType", searchType);
		return dao.listsearchCount(data );
		
	}
	public ArrayList<Client_Dto> listPageSearch(int pageStart, int postNum,String keyword, String searchType) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("pageStart", pageStart);
		data.put("postNum", postNum);
		data.put("keyword", keyword);
		data.put("searchType", searchType);
		return dao.listPageSearch(data);
	}
	public HashMap<String, Object> ajaxlist(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : "+page);		
		
		//총갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		int allCnt = dao.allCount();
		logger.info("allCnt : "+allCnt);
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		logger.info("pages : "+pages);
		
		if(page > pages) {
			page = pages;
		}
		
		
		map.put("pages", pages);	//만들 수 있는 최대 페이지 수
		map.put("currPage", page);//현재 페이지
		
		int offset = (page-1) * cnt;
		logger.info("offset : "+offset);
		
		ArrayList<Client_Dto> list = dao.ajaxlist(cnt, offset);
		map.put("list", list);		
		return map;
	}
	public HashMap<String, Object> ajaxSearch(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt =Integer.parseInt(params.get("cnt"));
		int page =Integer.parseInt(params.get("page"));
		String searchType=params.get("searchType");
		String keyword = params.get("keyword");
		
		
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		
		int allCnt = dao.ajaxSearchCnt(data);
		logger.info("allCnt : "+allCnt);
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		
		
		logger.info("pages : "+pages);
		
		if(page > pages) {
			page = pages;
			if(allCnt==0) {
				page=1;
			}
		}
		
		
		map.put("pages", pages);	//만들 수 있는 최대 페이지 수
		map.put("currPage", page);//현재 페이지
		
		int offset = (page-1) * cnt;
		logger.info("offset : "+offset);
		
		
	
		data.put("cnt", cnt);
		data.put("offset", offset);
		
		ArrayList<Client_Dto> list = dao.ajaxSearch(data);
		map.put("list", list);		
		return map;
	}
	
	public int ajaxDelete(ArrayList<String> delList) {
		int cnt = 0; 
		for (String idx : delList) {
			cnt+=dao.ajaxDelete(idx); 
		}
		
		return cnt;
		}



	
	
}
