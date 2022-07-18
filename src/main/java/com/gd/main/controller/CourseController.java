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

import com.gd.main.dto.CourseDTO;
import com.gd.main.service.ClientService;
import com.gd.main.service.CourseService;


@Controller
public class CourseController {
	
	@Autowired CourseService service;
	@Autowired ClientService clientService;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//과목,과정 리스트 호출
	@RequestMapping(value = "/subjectMainHome.do")
	public String classMainHome(Model model){
		
		String page = "emp_login";
		
		//단과 리스트
		ArrayList<CourseDTO> dangwa = service.dangwa();
		logger.info("단과 과목 갯수 : "+dangwa.size());
		model.addAttribute("dangwa",dangwa);
		
		//종합 리스트
		ArrayList<CourseDTO> jonghab = service.jonghab();
		logger.info("단과 과목 갯수 : "+jonghab.size());
		model.addAttribute("jonghab",jonghab);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		 ArrayList< HashMap<String, Object>> subList= clientService.regSub();
		 map.put("subList", subList);
		 model.addAttribute("subList", subList);
		 
		 
		logger.info("과목 리스트 메인 페이지 요청");
		page = "subjectMainHome";

		return page;
	}

	//과목 상세 홈페이지 이동
	@RequestMapping(value = "/subjectDetailHome.go")
	public String subjectDetailHome(Model model){
		
		String page = "redirect:/subjectDetailHome.do";

		return page;
	}
		
	//과목상세 홈페이지에 정보 뿌려주기
	@RequestMapping(value = "/subjectDetailHome.do")
	public String subjectDetailHomepage(Model model,String sub_no){
		
		String page = "emp_login";

		ArrayList<CourseDTO> homeSrcList = service.homeSrcList(sub_no);
		 
		//과목 상세 뿌려주기
		CourseDTO dto = service.subDetailHome(sub_no);
		
		logger.info("과목 상세 홈페이지 이동 : "+dto);
		model.addAttribute("dto", dto);
		model.addAttribute("homeSrcList", homeSrcList);
		return "subjectDetailHome";
		
	}
	

	
	//과정 리스트 페이지 이동
	@RequestMapping(value = "/courList.go")
	public String courListGo(Model model, HttpSession session) {
		String page = "emp_login";
		
		if(session.getAttribute("loginId") != null) {
			page = "redirect:/courList.do";
		}	else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
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

		page = "./course/courList";

		return page;
	}
	

	//리스트 호출
	@RequestMapping("/courList.ajax")
	@ResponseBody
	public HashMap<String, Object> courList(@RequestParam HashMap<String, String> params) {
		logger.info("과정 리스트 요청 : "+params);	
	
		HashMap<String, Object> map = service.courList2(params);
		ArrayList<CourseDTO> courList = (ArrayList<CourseDTO>) map.get("courList");
		logger.info("test");
		return map;
	}

	
	//과정 등록 페이지 이동
	@RequestMapping("/courRegister.go")
	public String registerPage(Model model, HttpSession session) {
		logger.info("과정 등록 페이지 이동");
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			String loginId = (String)session.getAttribute("loginId");
			if(loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
			page="redirect:/courseRegister.do";
			} else {
				page="./course/courList";
				model.addAttribute("msg","권한이 없습니다");
			}			
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}	
		
		return page;
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
	public HashMap<String, Object> courRegister(HttpSession session,
			@RequestParam HashMap<String, Object> params){
		
		boolean login = false;
		
		if(session.getAttribute("loginId") != null){
			login = true;
		}
		
		logger.info("과정 등록하기 : "+params);
		return service.courRegister(params,login);
	}
	
	
	//과정 상세 페이지 이동
	@RequestMapping("/courDetail.do")
	public String detailPage(String co_no, Model model) {
		
		//과정 상세보기 정보
		CourseDTO dto = service.courDetail2(co_no);
		
		logger.info("과정 상세 페이지 이동 : "+dto);
		model.addAttribute("dto", dto);
		return "./course/courseDetail";
	}
	
	
	//과정 상세 페이지 이동
	@RequestMapping("/courDetail.go")
	public String courDetailPage(@RequestParam String co_no, Model model, HttpSession session) {
		logger.info("상세보기 페이지 이동 : "+co_no);
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			session.setAttribute("co_no",co_no);
			page="./course/courDetail";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}	
		
		return page;
	}
	
	//과정 상세보기
	@RequestMapping("/courDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> courDetail(HttpSession session) {
		
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//로그인 여부 확인
		if(session.getAttribute("loginId") != null) {
			//로그인 확인되면 세션에서 co_no 뽑아줌
			String co_no = (String) session.getAttribute("co_no");
			logger.info("상세보기 데이터 요청 : "+co_no);
			session.removeAttribute("co_no"); //사용한 idx 는 지워준다.
			login = true;
			CourseDTO dto = service.courDetail2(co_no);
			map.put("dto", dto);
		}
		map.put("login", login);
		
		return map;
	}
	
	//과정 수정 페이지 이동
	@RequestMapping("/courUpdate.go")
	public String courUpdatePage(@RequestParam String co_no, Model model, HttpSession session) {
		logger.info("과정 수정 페이지 이동");
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			String loginId = (String)session.getAttribute("loginId");
			if(loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
				session.setAttribute("co_no", co_no);
				page="redirect:/courseUpdate.do";
			} else {
				page="./course/courList";
				model.addAttribute("msg","권한이 없습니다");
			}				
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}	
		
		return page;
	}
	
	
	//과정 수정
	@RequestMapping(value = "/courseUpdate.do")
	public String courseUpdate(Model model,
			@RequestParam HashMap<String, String> params, String co_no) {
		String page = "redirect:/courUpdate.do";
		logger.info("과정수정 페이지에 과목 이름 호출");
		//과목명 리스트
		ArrayList<CourseDTO> subName = service.subName();
		logger.info("과목 갯수 : "+subName.size());
		page = "./course/courseUpdate";
		model.addAttribute("subName",subName);		
		
		return page;
	}
	
	
	//과정 수정 ajax
	@RequestMapping("/courUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> courUpdateAjax(HttpSession session,String co_no,
			@RequestParam HashMap<String, String> params){
		
		logger.info("과정 수정하기 : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean login = false;
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			CourseDTO dto = service.courDetail2(co_no);
			map.put("dto", dto);
			boolean success = service.courseUpdate(params);
			map.put("success", success);
		}
		map.put("login", login);
		return map;
	}
	
	
	//과정 검색
	@RequestMapping("/courSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> courSearch(@RequestParam HashMap<String, String> params){
		logger.info("검색결과 리스트 요청"+params);
		return service.courList2(params);
	}
	
	

}
