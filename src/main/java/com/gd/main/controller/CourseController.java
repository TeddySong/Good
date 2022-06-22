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

import com.gd.main.dto.CourseDTO;
import com.gd.main.service.CourseService;


@Controller
public class CourseController {
	
	@Autowired CourseService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//과정 리스트 페이지 이동
	@RequestMapping(value = "/courList.go")
	public String courListGo() {	
		logger.info("과정 리스트 페이지 이동");
		return "./course/courList";
	}
	
	//리스트 호출
	@RequestMapping("courseList.ajax")
	@ResponseBody
	public HashMap<String, Object> courseList(
			@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("과정 리스트 요청 : "+params);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//ArrayList<CourseDTO> list = service.list();
		//데이터가 여러개라 ArrayList 로 받음
		//map.put("list", list);
		
		boolean login = false;
		
		if(session.getAttribute("loginId") != null){
			login = true;
		}
		
		return service.courseList(params);
	}
	
	//과정 등록 페이지 이동
	@RequestMapping("/courseWrite.go")
	public String writePage() {
		logger.info("과정 등록 페이지 이동");
		return "./course/courseWrite";
	}
	
	//과정명 중복체크
	@RequestMapping("/overlay.ajax")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String chkCo) {
		logger.info("과정명 중복체크 : "+chkCo);
		return service.overlay(chkCo);
	}
	
	//과정 등록
	@RequestMapping("/write.ajax")
	@ResponseBody
	public HashMap<String, Object> write(@RequestParam HashMap<String, Object> params){
		logger.info("과정 등록하기 : "+params);
		return service.write(params);
	}
	
	
	//과정 상세 페이지 이동
	@RequestMapping("/detail.go")
	public String detailPage(@RequestParam String co_no, HttpSession session) {
		logger.info("과정 상세 페이지 이동 : "+co_no);
		session.setAttribute("co_no", co_no);
		return "./course/courseDetail";
	}
	
	//과정 상세 보기
	@RequestMapping("/detail.ajax")
	@ResponseBody
	public HashMap<String, Object> detail(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean login = false;
		if(session.getAttribute("loginId") != null) {
			
			String co_no = (String) session.getAttribute("co_no");
			logger.info("과정 상세보기 요청 : "+co_no);
			session.removeAttribute("co_no");
			login = true;
			CourseDTO dto = service.detail(co_no);
			map.put("dto", dto);
		}
		map.put("login", login);
		
		return map;
	}
	
	//수정 페이지 이동
	@RequestMapping("/update.go")
	public String updatePage(@RequestParam String co_no, HttpSession session) {
		logger.info("수정 페이지 이동 : "+co_no);
		session.setAttribute("co_no", co_no);
		return "./course/courseUpdate";
	}
	
	//수정하기
	@RequestMapping("/update.ajax")
	@ResponseBody
	public HashMap<String, Object> update(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean success = service.update(params);
		map.put("success", success);
		
		return map;		
	}
	
}
