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
	
	@RequestMapping(value = "/subSearch.go")
	public String subSearchGo() {	
		logger.info("과목 리스트 페이지 이동");
		return "./student/subSearch";
	}
	
	@RequestMapping(value = "/subSearch.do")
	public String Search(Model model, HttpServletRequest req) {
		logger.info("과목검색");
				
		String searchContent = req.getParameter("searchContent");
		
		ArrayList<StuDTO> subSearchList = service.subSearchList(searchContent);
		logger.info("list size : " + subSearchList.size());
		
		model.addAttribute("subSearchList", subSearchList);
		
		return "./student/subSearch";
	}
	
	
	@RequestMapping(value="/subChoice.ajax")
	@ResponseBody
	public HashMap<String, Object> subChoice(HttpServletRequest req,
			@RequestParam HashMap<String, Object>params, HttpSession session) {
		logger.info("상세보기 페이지 이동 : {}", params );
		
		String choice = (String) params.get("subChoice");
		logger.info("상세보기 페이지 이동 : " + choice );
		 int result =Integer.parseInt(choice);
		 logger.info("상세보기 페이지 이동 : " + result);
		 
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<StuDTO> subChoice = service.subChoice(result);
		
		map.put("subChoice", subChoice);
		logger.info("클라이언트 : {}", subChoice );
		return map;
	}
	
	@RequestMapping(value="/stuDetail.go")
	public String detailPage(@RequestParam String stu_no, HttpSession session) {
		logger.info("상세보기 페이지 이동 : " + stu_no);
		session.setAttribute("stu_no", stu_no);
		return "./student/stuDetail";
	}
	
	@RequestMapping(value="/stuDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> stuDetail(HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
			String stu_no = (String) session.getAttribute("stu_no");
			logger.info("상세 데이터 요청 : " + stu_no);
			session.removeAttribute("stu_no"); // 사용한 idx는 삭제
			StuDTO dto = service.stuDetail(stu_no);
			map.put("dto", dto);
			logger.info("클라이언트 : {}", dto );
		
		
		return map;
	}
	
	
	@RequestMapping(value="stuRegister.ajax")
	@ResponseBody
	public HashMap<String, Object> stuRegister(
			@RequestParam HashMap<String, Object> params){
	 
		HashMap<String, Object> map= new HashMap<String, Object>();	 
		 
		map.put("cli_name" , params.get("cli_name"));
		map.put("cli_phone" , params.get("cli_phone"));
		map.put("emp_name" , params.get("emp_name"));
		map.put("stu_birth" , params.get("stu_birth"));
		map.put("stu_age" , params.get("stu_age"));
		map.put("stu_gender" , params.get("stu_gender"));
		map.put("stu_condition" , params.get("stu_condition"));
		
		logger.info("값 : {}", map);
		
		return null;
		 
			
	}
}
