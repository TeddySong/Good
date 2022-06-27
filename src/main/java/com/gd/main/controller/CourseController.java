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
		//return "./course/courList";
		return "redirect:/courList.do";
	}
	
	
	//과목,과정 리스트 호출
	@RequestMapping(value = "/courList.do")
	public String courseList(Model model, HttpSession session){
		
		String page = "emp_login";
		
		//과목명 리스트
		ArrayList<CourseDTO> subName = service.subName();
		logger.info("과목 갯수 : "+subName.size());
		model.addAttribute("subName",subName);
		
		//과정명 리스트
		ArrayList<CourseDTO> courseName = service.courseName();
		logger.info("과정 갯수 : "+courseName.size());
		model.addAttribute("courseName",courseName);
		
		if(session.getAttribute("loginId") != null) {
			
			logger.info("과정 리스트 호출");
			//전체적인 리스트
			ArrayList<CourseDTO> courList = service.courList();
			logger.info("리스트 갯수 : "+courList.size());
			page = "./course/courList";
			model.addAttribute("courList",courList);
			
		} else {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
		}

		return page;
	}
	
/*
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
		*
		boolean login = false;
		
		if(session.getAttribute("loginId") != null){
			login = true;
		}
		
		return service.courList(params);
	}
*/
	
	//과정 등록 페이지 이동
	@RequestMapping("/courRegister.go")
	public String registerPage() {
		logger.info("과정 등록 페이지 이동");
		return "redirect:/courseRegister.do";
	}
	
	//과정 등록 페이지에 데이터 뿌려주기
	@RequestMapping(value = "/courRegister.do")
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

	/*
	//과정 상세 페이지 이동
	@RequestMapping("/courDetail.go")
	public String detailPage(@RequestParam String co_no, 
			HttpSession session) {
		logger.info("과정 상세 페이지 이동 : "+co_no);
		session.setAttribute("co_no", co_no);
		return "./course/courseDetail";
	}
	*/
	
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

	/*
	//수정 페이지 이동
	@RequestMapping("/courUpdate.go")
	public String updatePage(@RequestParam String co_no, HttpSession session) {
		logger.info("수정 페이지 이동 : "+co_no);
		session.setAttribute("co_no", co_no);
		return "redirect:/courUpdate.do";
	}
	*/
	
	//과정 수정 페이지에 데이터 뿌려주기
	@RequestMapping(value = "/courUpdateForm.do")
	public String courseUpdatePage(Model model,HttpSession session,
			@RequestParam String co_no){
		String page = "redirect:/courList.do";
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
		
		
		//선택한 과목 뿌려주기
		/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sub_no = (String) session.getAttribute("sub_no");
		session.removeAttribute("sub_no");
		CourseDTO selectedSubName = service.selectedSubName(sub_no);
		map.put("selectedSubName", selectedSubName);
		logger.info("선택한 과목 : "+selectedSubName);
		model.addAttribute("selectedSubName",selectedSubName);
		*/
		return page;
	}
	
	
	//과정 수정(ajax 없이)
	@RequestMapping(value = "/courseUpdate.do")
	public String courseUpdate(HttpSession session, Model model,
			@RequestParam HashMap<String, String> params) {
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
	
	
	/*
	//수정하기
	@RequestMapping("/courUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> courUpdate(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		logger.info("과정 수정 : "+params);
		//return service.courUpdate(params);
		/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		/*
		HashMap<String, Object> success = service.courUpdate(params);
		map.put("success", success);
		*
		/*
		String co_no = (String) session.getAttribute("co_no");
		session.removeAttribute("co_no");
		CourseDTO dto = service.courUpdate(params);
		map.put("dto", dto);
		*
		HashMap<String, Object> map = new HashMap<String, Object>();
		/*
		boolean login = false;
		
		
		//로그인 여부 확인
		if(session.getAttribute("loginId") != null) {
			String co_no = (String) session.getAttribute("co_no");
			login = true;
			session.removeAttribute("co_no");
			CourseDTO dto = service.courUpdate(params);
			map.put("dto", dto);
		}
		
		//map 에 로그인여부 넣어서 전송
		map.put("login", login);
		*
		return map;

		/*
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int co_no = Integer.parseInt((String) params.get("co_no"));
		System.out.println("co_no : "+co_no);
		int sub_no = Integer.parseInt((String) params.get("sub_no"));
		System.out.println("sub_no : "+sub_no);
		//String sub_no = request.getParameter("sub_no");
		//if(sub_no == null || sub_no.trim().equals("")){sub_no = "0";}
		
		
		String co_name = (String) params.get("co_name");
		String co_startDate = (String) params.get("co_startDate");
		String co_endDate = (String) params.get("co_endDate");
		String co_startTime = (String) params.get("co_startTime");
		String co_endTime = (String) params.get("co_endTime");
		String co_condition = (String) params.get("co_condition");
		String co_capacity = (String) params.get("co_capacity");
		
		map.put("co_no", co_no);
		map.put("sub_no", sub_no);
		map.put("co_name", co_name);
		map.put("co_startDate", co_startDate);
		map.put("co_endDate", co_endDate);
		map.put("co_startTime", co_startTime);
		map.put("co_endTime", co_endTime);
		map.put("co_condition", co_condition);
		map.put("co_capacity", co_capacity);
		
		int cnt = service.courUpdate(map);
		map.put("cnt", cnt);
		
		return map;
		*	
	}
	*/
}
