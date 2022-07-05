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
	public HashMap<String, Object> empLogRegister(HashMap<String, String> params, String loginId) {
		logger.info("들어왔는지 확인 : {}" , params);
	      HashMap<String, Object> result=new HashMap<String, Object>();
	      String writer_no = dao.getWriterNo(loginId);
	      String writer_name = dao.getWriterName(loginId);
	      String empName = params.get("empName"); 
	      logger.info("loginId 의 id 넘버 : " + writer_no); // 글쓴이 no 가져왔음
	      logger.info("loginId 의 이름 : " + writer_name); // 글쓴이 이름 가져왔음
	      result.put("empName", empName);
	      logger.info("작성자는? " + result);
	      //params.put("writer_no", writer_no);
	     //params.put("writer_name", writer_name);
	      int row=dao.empLogRegister(params);
	      
	      String empNo=params.get("emp_no");
	      // logger.info("확인"+empNo);	      
	      
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
		public HashMap<String,Object> empList(HashMap<String,String> params,boolean login) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			int cnt = Integer.parseInt(params.get("cnt")); //1페이지의 게시물 수 
			int page = Integer.parseInt(params.get("page")); //현재 페이지.
			String empSearchCategory=params.get("empSearchCategory");
			String empSearchContent = params.get("empSearchContent");	
			logger.info("보여줄 페이지:"+cnt+" / "+page);
			// 1페이지 -> 0(offset:게시글 시작 번호)
			// 2페이지 -> 5
			// 3페이지 -> 10
			// 4페이지 -> 15
			// 5페이지 -> 20
			
			 map.put("cnt", cnt);
			
			map.put("empSearchCategory", empSearchCategory);
			map.put("empSearchContent", empSearchContent);
			
			
			ArrayList<EmployeeDTO> allCount = dao.allCount(map);
			int allCnt = allCount.size();
			logger.info("allCnt : " + allCnt);
			int pages = allCnt % cnt > 0 ? (allCnt / cnt) + 1 : (allCnt / cnt);
			logger.info("pages : " + pages);

			
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
	
	public HashMap<String, Object> empOverlay(String chkId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overId = dao.empOverlay(chkId);
		logger.info("중복 아이디가 있나? "+overId);
		boolean over = overId==null?false:true; //over == true : 얘 중복이야
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
		logger.info("수정된 데이터 수:"+row);
		logger.info("수정된 데이터 : "+success);
		/* result.put("success",success); */
		return success;
	}
















	

}






