package com.gd.main.controller;

import java.util.ArrayList;   
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
	public String stuLogRegisterGo(Model model,@RequestParam String emp_no, HttpSession session) {
		logger.info("직원일지 등록페이지 이동"+ emp_no); 
		session.setAttribute("emp_no", emp_no);
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			String loginId=(String) session.getAttribute("loginId");
			if(loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
				page="./employee/empLogRegister";	
			}else {
				model.addAttribute("msg","권한이 없습니다.");
				page="Empty";
				}			
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;
	}
	
	@RequestMapping("/empLogRegister.ajax")
	   @ResponseBody
	    public HashMap<String, Object> empLogRegister(
	          @RequestParam HashMap<String, String> params, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			logger.info("loginId : " + loginId);
	       logger.info("값확인:"+params);
	       logger.info("직원일지쓰기");
	       return service.empLogRegister(params, loginId);
	    }
	
	
	//직원일지 페이지
	  @RequestMapping(value = "/empLogList.go") 
	  public String emplogListGo(Model model, HttpSession session, @RequestParam String emp_no) {
		  
      String page = "redirect:/empList.go";	  
	  logger.info("직원일지 페이지! : " + emp_no); 
	  
	  if(session.getAttribute("loginId") != null) {
	  ArrayList<EmployeeDTO> dto =service.empLogList(emp_no); 
		
		/*
		 * for (EmployeeDTO employeeDTO : dto) {
		 * System.out.println("????"+employeeDTO.getEmp_name());
		 * System.out.println("????22"+employeeDTO.getEmp_name());
		 * 
		 * }
		 */
		 
	  if(dto != null) {
	  logger.info("리스트 사이즈:"+dto.size()); 
	  String empName=service.empName(emp_no); 
	  model.addAttribute("dto",dto);
	  model.addAttribute("empName", empName); 
	  model.addAttribute("empNo", emp_no);
	  page = "./employee/empLogList";
	  }
	  }else {
		   model.addAttribute("msg", "로그인이 필요한 서비스입니다");
	  }
	  return page; 
	}
	
	//직원 수정
	@RequestMapping(value = "/empUpdate.go")
	public String getSelectImpInfo(Model model, HttpSession session, int emp_no,
		@RequestParam HashMap<String, String> params) { 
		logger.info("상세보기 페이지 이동:"+emp_no);
		session.setAttribute("emp_no", emp_no);
		logger.info("상세보기 페이지 이동:"+emp_no);
		String loginId=(String)session.getAttribute("loginId");
		String page="emp_login";
		if(loginId != null) {
			if (loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
		
			EmployeeDTO employeeDTO = service.getselectEmpMyInfo(emp_no);
			model.addAttribute("employeeDTO", employeeDTO);
			page="./employee/empUpdate";
		} else {
			page="./employee/empList";
			model.addAttribute("msg", "권한이 없습니다.");
		}
		}else {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
		}
		return page;	
	}
	
	 @RequestMapping("/empUpdate.ajax")
	 @ResponseBody
	 public HashMap<String, Object> empUpdate(
			 @RequestParam HashMap<String, String>params ){
		logger.info("직원 수정: " +params);
		HashMap<String, Object> map= new HashMap<String, Object>();
		boolean success=service.empUpdate(params);
		map.put("success",success);
		
		 return map;
	 }
	 
	//직원 목록페이지 이동
		
		@RequestMapping(value = "/empList.go")
		public String empListGo(Model model, HttpSession session) {
			logger.info("직원 목록 페이지로 이동!");
			
			String page="emp_login";
			if(session.getAttribute("loginId") !=null) {
				page="./employee/empList";
			}else{
				model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			}
		return page;
		}

	// 직원 불러오기
		@RequestMapping(value = "employeeList.ajax")
		@ResponseBody
		public HashMap<String, Object> emplist(
				@RequestParam HashMap<String, String> params, HttpSession session) {
			logger.info("직원 목록 요청:" + params);

			boolean login = false;
			
			if(session.getAttribute("loginId") != null){
				login = true;
			}
			return service.empList(params,login);
		}
	
	//직원검색
	@RequestMapping("/empSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> empSearch(HttpSession session, @RequestParam HashMap<String, String> params) {
		
		return service.empList(params,false);
	}
	
	
	// 직원 등록 페이지로 이동
	@RequestMapping(value = "/empRegister.go")
	public String empRegister(Model model, HttpSession session) {
		logger.info("회원등록 페이지 이동");
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			String loginId = (String)session.getAttribute("loginId");
			if(loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
			page="./employee/empRegister";
			} else {
				page="./employee/empList";
				model.addAttribute("msg","권한이 없습니다");
			}
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;
	}

	// 직원명 중복체크
	@RequestMapping(value = "/empOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> empOverlay(@RequestParam String chkId) {
		logger.info("직원명 중복체크 : " + chkId);
		return service.empOverlay(chkId);
	}

	// 직원 등록
	@RequestMapping(value = "/empRegister.ajax")
	@ResponseBody
	public HashMap<String, Object> empRegister(@RequestParam HashMap<String, Object> params) {
		logger.info("직원 등록하기 : " + params);
		return service.empRegister(params);
	}

}