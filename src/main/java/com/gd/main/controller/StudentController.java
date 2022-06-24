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

import com.gd.main.dto.StuDTO;
import com.gd.main.service.StudentService;


@Controller
public class StudentController {
	
	@Autowired StudentService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/stuList.go")
	public String stuListGo() {	
		logger.info("수강생 리스트 페이지 이동");
		return "./student/stuList";
	}
	
	
	@RequestMapping("stuList.ajax")
	@ResponseBody
	public HashMap<String, Object> courseList(
			@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("수강생 리스트 요청 : "+params);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//ArrayList<CourseDTO> list = service.list();
		//데이터가 여러개라 ArrayList 로 받음
		//map.put("list", list);
		
		boolean login = false;
		
		if(session.getAttribute("loginId") != null){
			login = true;
		}
		
		return service.stuList(params);
	}
	
	@RequestMapping(value = "/stuRegister.go")
	public String stuRegisterGo() {	
		logger.info("수강생 리스트 페이지 이동");
		return "./student/stuRegister";
	}
	
	@RequestMapping(value = "/cliSearch.go")
	public String cliSearchGo() {	
		logger.info("수강생 리스트 페이지 이동");
		return "./student/cliSearch";
	}
	
	@RequestMapping(value = "/cliSearch.do")
	public String cliSearch(Model model, HttpServletRequest req) {
		logger.info("고객 검색");
		
		String cliSearchCondition = req.getParameter("cliSearchCondition");
		String searchContent = req.getParameter("searchContent");
		
		logger.info(cliSearchCondition + "/" + searchContent);
		
		ArrayList<StuDTO> cliSearchList = service.cliSearchList(searchContent);
		logger.info("list size : " + cliSearchList.size());
		
		model.addAttribute("cliSearchList", cliSearchList);
		
		return "./student/cliSearch";
	}
	
	@RequestMapping(value="/cliChoice.ajax")
	@ResponseBody
	public HashMap<String, Object> cliChoice(HttpServletRequest req,
			@RequestParam HashMap<String, Object>params, HttpSession session) {
		logger.info("상세보기 페이지 이동 : {}", params );
		
		String choice = (String) params.get("cliChoice");
		logger.info("상세보기 페이지 이동 : " + choice );
		 int result =Integer.parseInt(choice);
		 logger.info("상세보기 페이지 이동 : " + result);
		 
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StuDTO> cliChoice = service.cliChoice(result);
		
		map.put("cliChoice", cliChoice);
		logger.info("클라이언트 : {}", cliChoice );
		return map;
	}
	
	
}
