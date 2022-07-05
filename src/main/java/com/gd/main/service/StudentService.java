package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.StudentDAO;
import com.gd.main.dto.StuDTO;

@Service
public class StudentService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	StudentDAO dao;

	public HashMap<String, Object> stuList(HashMap<String, String> params, boolean login) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// hashmap 을 반환하기위해 객체화

		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		String stuSearchCategory = params.get("stuSearchCategory");
		String stuSearchContent = params.get("stuSearchContent");
		logger.info("보여줄 페이지 : " + page);
		// 1페이지 -> 0(offset:게시글 시작 번호)
		// 2페이지 -> 5
		// 3페이지 -> 10
		// 4페이지 -> 15
		// 5페이지 -> 20

		map.put("cnt", cnt);

		map.put("stuSearchCategory", stuSearchCategory);
		map.put("stuSearchContent", stuSearchContent);

		// 총 갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		ArrayList<StuDTO> allCount = dao.allCount(map);
		int allCnt = allCount.size();
		logger.info("allCnt : " + allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt) + 1 : (allCnt / cnt);
		logger.info("pages : " + pages);

		if (page > pages) { // 5개씩 보는 마지막 페이지로 갔을 때, 15개씩 보는 걸로 바꿨을때 뜨는 에러 해결
			page = pages;
		}

		map.put("pages", pages); // 만들 수 있는 최대 페이지 수
		map.put("currPage", page); // 현재 페이지

		int offset = (page - 1) * cnt;
		logger.info("offset : " + offset);

		map.put("offset", offset);

		ArrayList<StuDTO> list = dao.stuList(map);
		logger.info("list : " + list.size());
		map.put("login", login);
		map.put("list", list);

		return map;
	}

	public ArrayList<StuDTO> cliSearchList(String cliSearchCondition, String searchContent) {
		logger.info("고객검색 서비스:" + cliSearchCondition + "/" + searchContent);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cliSearchCondition", cliSearchCondition);
		map.put("searchContent", searchContent);

		return dao.cliSearchList(map);
	}

	public ArrayList<StuDTO> cliChoice(int result) {
		logger.info("고객 데이터 선택 서비스 요청 : {}", result);
		return dao.cliChoice(result);
	}

	public ArrayList<StuDTO> subSearchList(String searchContent) {
		logger.info("리스트 서비스 요청");
		return dao.subSearchList(searchContent);
	}

	public ArrayList<StuDTO> subChoice(int result) {
		logger.info("고객 데이터 선택 서비스 요청 : {}", result);
		return dao.subChoice(result);
	}

	public StuDTO stuDetail(String stu_no) {

		return dao.stuDetail(stu_no);

	}

	public HashMap<String, Object> subList(String stu_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("stu_no", stu_no);
		ArrayList<StuDTO> subList = dao.subList(map);
		logger.info("list : " + subList.size());

		map.put("list", subList);

		return map;
	}

	public HashMap<String, Object> stuRegister(HashMap<String, String> params, String loginId){
		logger.info("들어왔는지 확인");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String stu_birth_year = params.get("stu_birth_year");
		String stu_birth_month = params.get("stu_birth_month");
		String stu_birthDay = params.get("stu_birth_day");
		int stu_birth_day = Integer.parseInt(stu_birthDay) + 1;
		
		String stu_birth = stu_birth_year + '-' + stu_birth_month + '-' + stu_birth_day;
		params.put("stu_birth", stu_birth);
		
		int row = dao.stuRegister(params);
		
		boolean cnt = false;
		boolean login=false;
		if (row > 0) {
			if(loginId != null) {
			cnt = true;
			login = true;
			}
		}
		
		result.put("login", login);
		result.put("success", cnt);
		return result;
	}

	
	
	/*
	 * public HashMap<String, Object> stuRegister(HashMap<String, String> params,
	 * ArrayList<Integer> subList) throws ParseException{ logger.info("들어왔는지 확인");
	 * HashMap<String, Object> result=new HashMap<String, Object>();
	 * 
	 * StuDTO dto = new StuDTO(); String cliNo = params.get("cli_no"); int cli_no =
	 * Integer.parseInt(cliNo); dto.setCli_no(cli_no); String empNo =
	 * params.get("emp_no"); int emp_no = Integer.parseInt(empNo);
	 * dto.setEmp_no(emp_no); SimpleDateFormat format = new
	 * SimpleDateFormat("yyyy-MM-dd"); String stuBirth = params.get("stu_birth");
	 * Date stubirth = format.parse(stuBirth); java.sql.Date stu_birth=new
	 * java.sql.Date(stubirth.getTime()); dto.setStu_birth(stu_birth); String stuAge
	 * = params.get("stu_age"); int stu_age = Integer.parseInt(stuAge);
	 * dto.setStu_age(stu_age); dto.setStu_gender(params.get("stu_gender"));
	 * dto.setStu_condition(params.get("stu_condition"));
	 * 
	 * 
	 * 
	 * logger.info("값 들 : " + cli_no + '/' + dto.getEmp_no() + '/' + stu_birth +
	 * '/'+ stu_age + '/' + subList);
	 * 
	 * int row=dao.stuRegister(dto); int stu_no = dto.getStu_no();
	 * logger.info("방금 생성된 stu_no:" + stu_no);
	 * 
	 * boolean cnt=false; if(row>0) { cnt=true; for (Integer sub_no : subList) {
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * map.put("sub_no", sub_no); map.put("stu_no", stu_no);
	 * dao.stuSubRegister(map); } } result.put("success",cnt); return result; }
	 * 
	 * 
	 * 
	 * public HashMap<String, Object> stuSubRegister(ArrayList<Object> sub_no, int
	 * stu_no) { logger.info("값들 : " + sub_no + stu_no); return null; }
	 */
	  
	  
	  public boolean stuUpdate(HashMap<String, String> params) { boolean success =
	  false;
	  
	  logger.info("값 1차 확인 : " + params);
	  String stu_birth_year = params.get("stu_birth_year");
		String stu_birth_month = params.get("stu_birth_month");
		String stu_birthDay = params.get("stu_birth_day");
		int stu_birth_day = Integer.parseInt(stu_birthDay) + 1;
		
		String stu_birth = stu_birth_year + '-' + stu_birth_month + '-' + stu_birth_day;
		params.put("stu_birth", stu_birth);
	  
	  int row = dao.stuUpdate(params);
	  
	  if (row > 0) { success = true; }
	  
	  logger.info("update success : " + success);
	  
	  return success; 
	  }
	 

	/*
	 * public StuDTO stuLog(String stu_no) {
	 * 
	 * return dao.stuLog(stu_no);
	 * 
	 * }
	 */

	public ArrayList<StuDTO> stuLog(String stu_no) {

		logger.info("학사일지 서비스");

		return dao.stuLog(stu_no);
	}

	public HashMap<String, Object> stuLogRegister(HashMap<String, String> params) {
		logger.info("들어왔는지 확인 : {}", params);
		HashMap<String, Object> result = new HashMap<String, Object>();
		int row = dao.stuLogRegister(params);

		String stuNo = params.get("stu_no");
		logger.info("확인" + stuNo);

		boolean cnt = false;
		if (row > 0) {
			cnt = true;
		}
		result.put("success", cnt);
		result.put("stuNo", stuNo);
		return result;

	}

	public String stuName(String stu_no) {
		return dao.stuName(stu_no);

	}

	public HashMap<String, Object> stuWantSubSearch(HashMap<String, String> params) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		ArrayList<StuDTO> list = dao.stuWantSubSearch(params);
		
		map.put("list", list);
		
		return map;
	}

	
	public StuDTO cliUpdateInfo(String cli_no) {
		logger.info("서비스 영역" + cli_no);
		return dao.cliInfoGet(cli_no);
		
	}

	public boolean cliStuFinUpdate(HashMap<String, String> params) {
		 logger.info("값 1차 확인 : " + params);
		
		int row = dao.cliStuFinUpdate(params);
		  
		boolean success = false;
		  if (row > 0) { success = true; }
		  
		  logger.info("update success : " + success);
		  
		  return success; 
		  }

	public int stuDelete(HashMap<String, String> params) {
		int cnt = 0;
		cnt = dao.stuDelete(params);
		
		return cnt;
	}

}
