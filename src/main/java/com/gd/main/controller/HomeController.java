package com.gd.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.main.service.HomeService;


@Controller
public class HomeController {
	
	@Autowired HomeService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {			
		String page = "redirect:/subjectMainHome.do";

		return page;
	}
	
	@RequestMapping(value = "/login.go")
	public String login() {	
		logger.info("로그인 페이지 이동");
		return "emp_login";
	}
	
	@RequestMapping("/empLogin.ajax")
	@ResponseBody
	public HashMap<String, Object> emp_login(
			@RequestParam String emp_id, @RequestParam String emp_pw
			,HttpSession session){
		
		logger.info("로그인 요청 : {}/{}" ,emp_id, emp_pw);
		boolean success = service.empLogin(emp_id,emp_pw);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		
		if(success){
			session.setAttribute("loginId", emp_id);
			String empName = service.empLoginName(emp_id);
			logger.info(empName);
			session.setAttribute("empName", empName);
			int empNo = service.empNo(emp_id);
			session.setAttribute("empNo", empNo);
		}
		
		return map;
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginSuccess(Model model, HttpSession session) {
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="emp_main";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		return page;
	}
	
	@RequestMapping(value = "/class_main.go", method = RequestMethod.GET)
	public String classMainGo(Model model) {			
		return "class_main";
	}
	
	
	
	// 로그아웃
		@RequestMapping(value = "/logout.do")
		public String logout(Model model, HttpSession session) {
			session.removeAttribute("loginId");
			model.addAttribute("msg","로그아웃 되었습니다.");
			return "emp_login";
		}	
	
	
	
	
	
	
	
	
	
}
