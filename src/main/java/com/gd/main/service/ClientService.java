package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.ClientDAO;
import com.gd.main.dao.SubjectDAO;
import com.gd.main.dto.Client_Dto;
import com.gd.main.dto.SubDTO;


@Service
public class ClientService {
	 Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ClientDAO dao;
	@Autowired SubjectDAO subDao;
	
//	public ArrayList<Client_Dto> W() {
//		return dao.list_Client();
//		
//	}
//	
//	public ArrayList<Client_Dto> client_search(String searchType, String keyword) {
//		HashMap<String, Object> data = new HashMap<String, Object>();
//		data.put("searchType", searchType); 
//		data.put("keyword", keyword);
//		
//		
//		return dao.client_searh(data);
//	}
	
	public Client_Dto detail_Client(int cli_no) {
		// TODO Auto-generated method stub
		return dao.detail_Client(cli_no);
	}
	
	public ArrayList<Client_Dto> clientLog(int cli_no) {
		return dao.clientLog(cli_no);
	}
	
//	public ArrayList<HashMap<String, Object>> list_Client2() {
//		return dao.list_Client2();
//	}
	
	
	/*
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
	*/
	/*
	public HashMap<String, Object> ajaxlist(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt =Integer.parseInt(params.get("cnt"));
		int page =Integer.parseInt(params.get("page"));
		String searchType=params.get("searchType");
		String keyword = params.get("keyword");
		
		
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		
		int allCnt = dao.ajaxSearchCnt(data);
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		//logger.info("pages : "+pages);
		
		if(page > pages) {
			page = pages;
		}
		
		
		map.put("pages", pages);	//만들 수 있는 최대 페이지 수
		map.put("currPage", page);//현재 페이지
		
		int offset = (page-1) * cnt;
		//logger.info("offset : "+offset);
		
		ArrayList<Client_Dto> list = dao.ajaxlist(cnt, offset);
		map.put("list", list);		
		return map;
	}
	*/
	
	public HashMap<String, Object> ajaxSearch(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		  int cnt =Integer.parseInt(params.get("cnt"));
		  int page =Integer.parseInt(params.get("page"));
		 
//		int cnt = 10; // 한번에 뿌릴 게시글 수 . 
//		int page = 1; 
//		
		
		
		String searchType=params.get("searchType");
		String keyword = params.get("keyword");
		
		
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		
		int allCnt = dao.ajaxSearchCnt(data);
		//logger.info("allCnt44 : "+allCnt);
		//System.out.println("allCnt44 : "+allCnt);
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		
		
		//logger.info("pages : "+pages);
		//System.out.println("pages : "+pages);
		
		if(pages==0) {pages=1;}
		
		if(page > pages) {
			page = pages; 
		}
		
		
		
		
		map.put("pages", pages);	//만들 수 있는 최대 페이지 수
		map.put("currPage", page);//현재 페이지
		
		int offset = (page-1) * cnt;
		//logger.info("offset : "+offset);
	//	System.out.println("offset : "+offset);
		
	
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
	
	public int cliReg(HashMap<String, Object> params) {
		String 	cli_name =(String) params.get("cli_name");
		String cli_phone = (String) params.get("cli_phone");
		String cli_req = (String) params.get("cli_req");
		  
		HashMap<String, Object> map = new HashMap<String, Object>();
		 
		int cnt = dao.cliReg(cli_name,cli_phone,cli_req);
		map.put("cnt", cnt);
		return cnt;
	}
	
	public int cliUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		 return dao.cliUpdate(map);
	}
	
	public ArrayList<Client_Dto> empList() {
		return dao.empList();
	}
	
	public ArrayList<Client_Dto> empSearch(String empkeyword) {
		return dao.empSearch(empkeyword);
	}
	
	public int empUp(HashMap<String, Object> map) {

		return dao.empUp(map);
	}

	public void cliRegCo(ArrayList<Integer> sub_no) {
		for (Integer string : sub_no) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			Integer cli_no=null;
			map.put("string", string);
			map.put("cli_no", cli_no);
			dao.cliRegCo(map);
		}
		
	}
	
	public HashMap<String, Object> ajaxSubSearch(ArrayList<Object> cli_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//String sub = new HashMap<String, Object>();
		Integer cnt = 0; 
		
		ArrayList<String> list = new ArrayList<String>();
		for (Object idx : cli_no) {
		
			Integer inxx= Integer.parseInt(idx.toString());
	//		System.out.println(inxx);
			
			String	list2 =dao.ajaxSubSearch(inxx); 
	//	System.out.println(list2);
		//	System.out.println("---");
			list.add(list2);
			
		}

		map.put("list", list);
		return map ;
		
	}

	public ArrayList<HashMap<String, Object>> regSub() {
		ArrayList<HashMap<String, Object>> list = dao.regSub();
		
		return dao.regSub();
	}
	public ArrayList<Integer> cli_no() {
		return dao.cli_no();
	}
	
	
	public Client_Dto cliManager(int cli_no) {
		return dao.cliManager(cli_no) ;
	}
	
	public String scheRegister(HashMap<String, Object> map) {
			String msg = "등록에 실패했습니다.";
		if( dao.scheRegister(map)>0) {
			msg ="등록에 성공했습니다";
			}
		
		return msg;
	}

	public HashMap<String, Object> checkListDo(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
	int cnt=Integer.parseInt(params.get("cnt"));  // 1페이지의 게시물 수
	int page=Integer.parseInt(params.get("page")); // 현재 페이지 . 
	
	
	String keyword = params.get("keyword");
	String searchType = params.get("searchType");
	String cli_log_Dday =params.get("cli_log_Dday");
	
	
	map.put("keyword",keyword);
	map.put("searchType",searchType);
	map.put("cli_log_Dday",cli_log_Dday);
	

//	System.out.println("상담결과"+logResult);
//	System.out.println(cli_log_Dday);
	
	/*
	 * ArrayList<Integer> chkendCnt=dao.chkEndCnt();
	 * 
	 * map.put("chkendCnt", chkendCnt);
	 */
	int allCnt= dao.checkCnt(map);
	
	//System.out.println("allcnt: "+allCnt);
	int pages = allCnt%cnt>0 ? (allCnt/cnt)+1 : (allCnt/cnt);
	if(pages==0) {pages=1;}
	if(page>pages) {page=pages;}
	map.put("pages", pages);	
	map.put("currPage", page);
	
	int offset = (page-1)*cnt;
	
	map.put("offset", offset);
	map.put("cnt", cnt);
	
	
	ArrayList<Client_Dto> list = dao.shcekList(map);

	
	map.put("list", list);
	return map;
	}




	
}
