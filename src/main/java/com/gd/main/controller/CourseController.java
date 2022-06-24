package com.gd.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.main.dto.CourseDTO;
import com.gd.main.dto.SubDTO;
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
	
	
	//과목,과정 리스트 호출
	@RequestMapping(value = "/courseList.do")
	public String searchList(Model model, @RequestParam String sub_no, @RequestParam String co_no){
		logger.info("과목 리스트 호출");
		//과목명
		//CourseDTO dto = service.subNameList(sub_name);
		//model.addAttribute("dto", dto);
		
		//과목명 리스트
		CourseDTO subName = service.selectSubName(sub_no);
		model.addAttribute("subName",subName);
		
		//과정명 리스트
		
		ArrayList<CourseDTO> courseName = service.selectCourseName(co_no);
		
		logger.info("courseName"+courseName);
		
		model.addAttribute("courseName",courseName);
		
		/*
		ArrayList<CourseDTO> subjectList = service.subjectList(sub_name);
		logger.info("등록된 과목 가져오기 : "+subjectList.size());
		model.addAttribute("subjectList", subjectList);
		*/
		
		return "./course/courList";
	}
	

	//리스트 호출
	@RequestMapping("courList.ajax")
	@ResponseBody
	public HashMap<String, Object> courList(
			@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("과정 리스트 요청 : "+params);
		/*
		ArrayList<CourseDTO> subjectList = service.subjectList();
		logger.info("등록된 과목 가져오기 : "+subjectList.size());
		model.addAttribute("subjectList", subjectList);	
		*/
		boolean login = false;
		
		if(session.getAttribute("loginId") != null){
			login = true;
		}
		
		return service.courList(params);
	}

	
	//과정 등록 페이지 이동
	@RequestMapping("/courWrite.go")
	public String writePage() {
		logger.info("과정 등록 페이지 이동");
		return "./course/courseWrite";
	}
	
	//과정명 중복체크
	@RequestMapping("/courOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> courOverlay(@RequestParam String chkCo) {
		logger.info("과정명 중복체크 : "+chkCo);
		return service.courOverlay(chkCo);
	}
	
	//과정 등록
	@RequestMapping("/courWrite.ajax")
	@ResponseBody
	@GetMapping
	public HashMap<String, Object> courWrite(
			@RequestParam HashMap<String, Object> params,HttpServletRequest req,Model model){
		
		logger.info("과정 등록하기 : "+params);
		return service.courWrite(params);
	}
	
	
	
	//과정 상세 페이지 이동
	@RequestMapping("/detail.go")
	public String detailPage(@RequestParam String co_no, HttpSession session) {
		logger.info("과정 상세 페이지 이동 : "+co_no);
		session.setAttribute("co_no", co_no);
		return "./course/courseDetail";
	}

	
	//과정 상세 보기
	@RequestMapping("/courDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> courDetail(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean login = false;
		if(session.getAttribute("loginId") != null) {
			
			String co_no = (String) session.getAttribute("co_no");
			logger.info("과정 상세보기 요청 : "+co_no);
			session.removeAttribute("co_no");
			login = true;
			CourseDTO dto = service.courDetail(co_no);
			map.put("dto", dto);
		}
		map.put("login", login);
		
		return map;
	}

	
	//수정 페이지 이동
	@RequestMapping("/courUpdate.go")
	public String updatePage(@RequestParam String co_no, HttpSession session) {
		logger.info("수정 페이지 이동 : "+co_no);
		session.setAttribute("co_no", co_no);
		return "./course/courseUpdate";
	}
	
	//수정하기
	@RequestMapping("/courUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> courUpdate(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean login = false;
		
		//로그인 여부 확인
		if(session.getAttribute("loginId") != null) {
			login = true;
			
			String co_name = params.get("co_name");
			String co_startDate = params.get("co_startDate");
			String co_endDate = params.get("co_endDate");
			String co_startTime = params.get("co_startTime");
			String co_endTime = params.get("co_endTime");
			String co_condition = params.get("co_condition");
			String co_capacity = params.get("co_capacity");
			
			map.put("co_name", co_name);
			map.put("co_startDate", co_startDate);
			map.put("co_endDate", co_endDate);
			map.put("co_startTime", co_startTime);
			map.put("co_endTime", co_endTime);
			map.put("co_condition", co_condition);
			map.put("co_capacity", co_capacity);
			
			int success = service.courUpdate(map);
			map.put("success", success);
		}
		
		//map 에 로그인여부 넣어서 전송
		map.put("login", login);
		
		return map;		
	}
	
}
