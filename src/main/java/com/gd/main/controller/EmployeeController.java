package com.gd.main.controller;

import java.util.ArrayList;  
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gd.main.dto.EmployeeDTO;
import com.gd.main.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	//직원일지 등록
	
	@RequestMapping(value="/empLogRegister.go")
	public String stuLogRegisterGo(@RequestParam int emp_no, HttpSession session) {
		logger.info("emp_no: " + emp_no); //직원의 사번 가져오기
		session.setAttribute("emp_no", emp_no);
		
		
		return "./employee/empLogRegister";
	}
	
	@RequestMapping("/empLogRegister.ajax")
	   @ResponseBody
	    public HashMap<String, Object> empLogRegister(
	          @RequestParam HashMap<String, String> params) {
	       
	       logger.info("직원일지쓰기");
	       return service.empLogRegister(params);
	    }
	
	//
	//
	//
	
	//직원일지 페이지 
	@RequestMapping(value = "/empLogList.go")
	public String emplogListGo(Model model, HttpSession session, @RequestParam int emp_no) {
	logger.info("직원일지 페이지! : " + emp_no); 
	ArrayList<EmployeeDTO> dto = service.empLogList(emp_no);
	logger.info("리스트 사이즈:"+dto.size());
	String empName=service.empName(emp_no);
	model.addAttribute("dto",dto);
	model.addAttribute("empName", empName);
	model.addAttribute("empNo", emp_no);
	
	return "./employee/empLogList";
	} 
	
	//직원 수정
	@RequestMapping(value = "/empUpdate.go")
	public String getSelectImpInfo(Model model, HttpSession session, int emp_no) {
		logger.info("상세보기 페이지 이동:"+emp_no);
		session.setAttribute("emp_no", emp_no);
		logger.info("상세보기 페이지 이동:"+emp_no);
		EmployeeDTO employeeDTO = service.getselectEmpMyInfo(emp_no);
		model.addAttribute("employeeDTO", employeeDTO);
		
		return "./employee/empUpdate";
		
	}
	
	 @RequestMapping("/empUpdate.ajax")
	 @ResponseBody
	 public HashMap<String, Object> empUpdate(
			 @RequestParam HashMap<String, String>params){
		logger.info("직원 수정: " +params);
		HashMap<String, Object> map= new HashMap<String, Object>();
		boolean success=service.empUpdate(params);
		map.put("success",success);
		
		 return map;
	 }
	//직원 목록페이지 이동
	 
	@RequestMapping(value = "/empList.go")
	public String empListGo() {
	logger.info("직원 목록 페이지!");
	return "./employee/empList";
	}

	// 직원 불러오기
	@RequestMapping(value = "employeeList.ajax")
	@ResponseBody
	public HashMap<String, Object> emplist(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("직원 목록 요청:" + params);

		boolean login = false;
		HashMap<String, Object> map = service.employeeList(params);
		/*
		 * if(session.getAttribute("loginId")!=null) { login=true; }
		 */
		return service.employeeList(params);
	}

	// 직원 등록 페이지로 이동
	@RequestMapping(value = "/empRegister.go")
	public String empRegister() throws Exception {
		logger.info("회원등록 페이지 이동");
		return "./employee/empRegister";
	}

	// 직원명 중복체크
	@RequestMapping(value = "/empOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> empOverlay(@RequestParam String chkName) {
		logger.info("직원명 중복체크 : " + chkName);
		return service.empOverlay(chkName);
	}

	// 직원 등록
	@RequestMapping(value = "/empRegister.ajax")
	@ResponseBody
	public HashMap<String, Object> empRegister(@RequestParam HashMap<String, Object> params) {
		logger.info("직원 등록하기 : " + params);
		return service.empRegister(params);
	}

}