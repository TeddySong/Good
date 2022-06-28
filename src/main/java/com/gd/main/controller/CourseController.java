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
	public String courListGo(Model moel, HttpSession session) {
		String page = "home";
		
		if(session.getAttribute("loginId") != null) {
			page = "redirect:/courList.do";
		}
		logger.info("과정 리스트 페이지 이동");
		//return "./course/courList";
		return page;
	}
	
	
	//과목,과정 리스트 호출
	@RequestMapping(value = "/courList.do")
	public String courseList(Model model){
		
		String page = "emp_login";
		
		//과목명 리스트
		ArrayList<CourseDTO> subName = service.subName();
		logger.info("과목 갯수 : "+subName.size());
		model.addAttribute("subName",subName);
		
		//과정명 리스트
		ArrayList<CourseDTO> courseName = service.courseName();
		logger.info("과정 갯수 : "+courseName.size());
		model.addAttribute("courseName",courseName);
		
		//CourseDTO dto = service.courDetail2(co_no);

		page = "./course/courList";

		return page;
	}
	

	//리스트 호출
	@RequestMapping("/courList.ajax")
	@ResponseBody
	public HashMap<String, Object> courList(
			@RequestParam HashMap<String, String> params) {
		//HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("과정 리스트 요청 : "+params);	
	
		return service.courList2(params);
	}

	
	//과정 등록 페이지 이동
	@RequestMapping("/courRegister.go")
	public String registerPage() {
		logger.info("과정 등록 페이지 이동");
		return "redirect:/courseRegister.do";
	}
	
	//과정 등록 페이지에 데이터 뿌려주기
	@RequestMapping(value = "/courseRegister.do")
	public String courseRegisterPage(Model model){
		String page = "emp_login";
		
		logger.info("과정등록 페이지에 과목 이름 호출");
		//과목명 리스트
		ArrayList<CourseDTO> subName = service.subName();
		logger.info("과목 갯수 : "+subName.size());
		page = "./course/courseRegister";
		model.addAttribute("subName",subName);		
		
		return page;
	}
	
	//과정명 중복체크
	@RequestMapping("/courOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> courOverlay(@RequestParam String chkCo) {
		logger.info("과정명 중복체크 : "+chkCo);
		return service.courOverlay(chkCo);
	}
	
	//과정 등록
	@RequestMapping("/courRegister.ajax")
	@ResponseBody
	public HashMap<String, Object> courRegister(
			@RequestParam HashMap<String, Object> params){
		
		logger.info("과정 등록하기 : "+params);
		return service.courRegister(params);
	}
	
	
	//과정 상세 페이지 이동
	@RequestMapping("/courDetail.do")
	public String detailPage(String co_no, Model model) {
		
		//과정 상세보기 정보
		CourseDTO dto = service.courDetail2(co_no);
		//CourseDTO dto2 = service.callSubNo(co_no);
		
		logger.info("과정 상세 페이지 이동 : "+dto);
		model.addAttribute("dto", dto);
		//model.addAttribute("dto2",dto2);
		return "./course/courseDetail";
	}
	
	//과정 수정 페이지에 데이터 뿌려주기
	@RequestMapping(value = "/courUpdateForm.do")
	public String courseUpdatePage(Model model,HttpSession session,
			@RequestParam String co_no){
		String page = "redirect:/courUpdateForm.do";
		logger.info("수정 상세보기 요청 : "+co_no);
		
		logger.info("과정수정 페이지에 과목 이름 호출");
		//과목명 리스트
		ArrayList<CourseDTO> subName = service.subName();
		logger.info("과목 갯수 : "+subName.size());
		//page = "./course/courseUpdate";
		model.addAttribute("subName",subName);		
		
		if(session.getAttribute("loginId") != null) {
			CourseDTO dto = service.courDetail2(co_no);
			if(dto != null) {
				model.addAttribute("dto", dto);
				page = "./course/courseUpdate";
			} else {
				model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			}
		}
		
		return page;
	}
	
	
	//과정 수정(ajax 없이)
	@RequestMapping(value = "/courseUpdate.do")
	public String courseUpdate(HttpSession session, Model model,
			@RequestParam HashMap<String, String> params, String co_no) {
		logger.info("params : {}",params);
		String page = "redirect:/courDetail.do?co_no="+params.get("co_no");
		logger.info(page);
		if(session.getAttribute("loginId") != null) {
			service.courseUpdate(params);
		} else {
			page = "login";
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
		}
		return page;
	}
	
	//과정 검색
	@RequestMapping("/courSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> courSearch(
			@RequestParam HashMap<String, String> params){
		//HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("검색결과 리스트 요청"+params);
		return service.courList2(params);
	}
	
	

}
