package com.gd.main.controller;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gd.main.service.EmployeeService;



@Controller
public class EmployeeController {
	
	@Autowired EmployeeService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/empMyInfo.go")
	public String getSelectImpInfo(HttpSession session, int emp_no) {
		logger.info("상세보기 페이지 이동:"+emp_no);
		session.setAttribute("emp_no", emp_no);
		
		return "./employee/empMyInfo";
		
	}
	

	@RequestMapping(value = "/empList.go")
	public String empListGo() {
		logger.info("직원 목록 페이지!"); 
		return "./employee/empList";
	}
	
	
	//직원 불러오기
	@RequestMapping(value="employeeList.ajax")
	@ResponseBody
	public HashMap<String,Object> emplist(
	@RequestParam HashMap<String,String> params,HttpSession session) {
		logger.info("직원 목록 요청:" +params);
		
		boolean login=false;
		HashMap<String,Object> map = service.employeeList(params);
		/*
		if(session.getAttribute("loginId")!=null) {
			login=true;
		}
		*/
		return service.employeeList(params);
	}
	
	//직원 등록 페이지로 이동
	@RequestMapping(value="/empWrite.go")
	public String empWrite() throws Exception{
		logger.info("회원등록 페이지 이동");
		return "./employee/empWrite";
	}
		
	//직원명 중복체크
	@RequestMapping(value="/empOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> empOverlay(@RequestParam String chkName) {
		logger.info("직원명 중복체크 : "+chkName);
		return service.empOverlay(chkName);
	}
	
	 
	
	//직원 등록
	@RequestMapping(value="/empWrite.ajax")
	@ResponseBody
	public HashMap<String, Object> empWrite(@RequestParam HashMap<String, Object> params){
		logger.info("직원 등록하기 : "+params);
		return service.empWrite(params);
	}

	
	//0625 수정 진행중.........
	
	
	
	//수정 페이지 이동
	@RequestMapping(value="/empUpdate.go")
	public String EmpUpdate() {
		logger.info("수정 페이지 이동");
		//session.setAttribute("emp_no", emp_no);
		return "./employee/empUpdate";
	}

	//수정하기
	@RequestMapping(value="/empUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> update(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean success = service.empUpdate(params);
		map.put("success", success);
		
		return map;		
	}	
	

}