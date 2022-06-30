package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gd.main.dao.EmployeeDAO;
import com.gd.main.dto.EmployeeDTO;



@Service
public class EmployeeService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired  EmployeeDAO dao;


	//직원일지 추가하기
	public HashMap<String, Object> empLogRegister(HashMap<String, String> params) {
		logger.info("들어왔는지 확인 : {}" , params);
	      HashMap<String, Object> result=new HashMap<String, Object>();
	      int row=dao.empLogRegister(params);
	      
	      String empNo=params.get("emp_no");
	      logger.info("확인"+empNo);	      
	      
	      boolean cnt=false;
	      if(row>0) {
	         cnt=true;
	      }
	      result.put("success",cnt);
	      result.put("empNo", empNo);
	      return result;
	      
	      
	}


	
	//직원일지 리스트 
	public ArrayList<EmployeeDTO> empLogList(String emp_no){
		logger.info("리스트 서비스 요청");
		logger.info("받아온 넘버 : " + emp_no);		
		return dao.empLogList(emp_no);
	}
	
		/*
	*직원일지 임시생성 public HashMap<String, Object> empLogList(HashMap<String, String>
	 * params) { logger.info("직원일지 서비스 요청);" logger.info("받아온 넘버 : "); return null;
	 * }
	 */

	
	
	//직원일지 상단에 직원명 가져오기 
	public String empName(String emp_no) {
		logger.info("받아온 넘버 : " + emp_no);
		return dao.empName(emp_no);
	}
	
	
	public EmployeeDTO getselectEmpMyInfo(int emp_no) {
		
		return dao.selectEmpMyInfo(emp_no);
		
	}
	
	//직원리스트
	public HashMap<String,Object> empList(HashMap<String,String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		String empSearchCategory=params.get("empSearchCategory");
		String empSearchContent = params.get("empSearchContent");	
		logger.info("보여줄 페이지:"+page);
		
		map.put("cnt", cnt);
		
		map.put("empSearchCategory", empSearchCategory);
		map.put("empSearchContent", empSearchContent);
		
		
		ArrayList<EmployeeDTO> allCount = dao.allCount(map);
		int allCnt =allCount.size();
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
		
		map.put("offset", offset);
		
		ArrayList<EmployeeDTO> list = dao.empList(map);
		logger.info("list : "+list.size());
		map.put("list", list);
		
		return map;
	}
	
	public HashMap<String, Object> empOverlay(String chkName) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overName = dao.empOverlay(chkName);
		logger.info("중복 직원명이 있나? "+overName);
		boolean over = overName==null?false:true; //over == true : 얘 중복이야
		//조건:overId가 null 맞아? 참이면 false(조건1) 거짓이면 true(조건2)
		map.put("empOverlay", over);
		
		return map;
	}

	public HashMap<String, Object> empRegister(HashMap<String, Object> params) {
		HashMap<String, Object> writeResult = new HashMap<String, Object>();
		int row = dao.empRegister(params);
		boolean success = false;
		logger.info("넘어온 값 : "+params);
		if(row>0) {
			success = true;
		}
		
		writeResult.put("success", success);
		
		return writeResult;
	}

	public boolean empUpdate(HashMap<String, String> params) {
		/* HashMap<String, Object> result = new HashMap<String, Object>(); */
		System.out.println("서비스 ::::: " + params.toString());
		
		boolean success = false;
		
		int row=dao.empUpdate(params);
		
		if(row>0) {
			success = true;
		
		}
		logger.info("수정성공 : "+success);
		/* result.put("success",success); */
		return success;
	}










	

}




