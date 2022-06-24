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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gd.main.dto.SubDTO;
import com.gd.main.service.SubjectService;


@Controller
public class SubjectController {
	
	@Autowired SubjectService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/subList.go", method = RequestMethod.GET)
	public String subListGo(Model model) {			
		return "./subject/subList";
	}
	
	@RequestMapping(value = "/subList.ajax")
	@ResponseBody
	public HashMap<String, Object> subList() {
		logger.info("리스트 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SubDTO> list = service.subList();
		logger.info("subList : " + list.size());
		map.put("subList", list);
		return map;
	}
	
	@RequestMapping(value = "/subRegister.go")
	public String subRegisterGo() {
		logger.info("과목 등록 페이지 이동");
		return "./subject/subRegister";
	}
	
	@RequestMapping("/subOverlay.ajax")
	@ResponseBody
	public HashMap<String, Object> subOverlay(@RequestParam String subname) {
		logger.info("과목 중복 체크 : " + subname);
		return service.subOverlay(subname);
	}
	
	@RequestMapping("/subRegister.ajax")
	@ResponseBody
	public HashMap<String, Object> subRegister(@RequestParam HashMap<String, String> params) {
		logger.info("과목 등록");
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean register = service.subRegister(params);
		map.put("subRegister", register);
		
		return map;
	}
	
	@RequestMapping("/subDetail.go")
	public String detailPage(@RequestParam String sub_no, HttpSession session) {
		logger.info("상세보기 페이지 이동 : " +sub_no);
		session.setAttribute("sub_no", sub_no);
		
		return "./subject/subDetail";
	}
	
	@RequestMapping("/subDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> subDetail(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
			String sub_no = (String) session.getAttribute("sub_no");
			logger.info("상세보기 요청 : " + sub_no);
			session.removeAttribute("sub_no");
			SubDTO dto = service.subDetail(sub_no);
			ArrayList<SubDTO> list = service.subDetailsc(sub_no);
			map.put("dto", dto);
			map.put("list", list);
		
		return map;
	}
	
	
	@RequestMapping("/subUpdate.go")
	public String subUpdatePage(@RequestParam String sub_no, HttpSession session) {
		logger.info("수정 페이지 이동 : " +sub_no);
		session.setAttribute("sub_no", sub_no);
		
		return "./subject/subUpdate";
	}
	
	@RequestMapping("/subUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> subUpdate(@RequestParam HashMap<String, String> params) {
		logger.info("과목 수정 : " +  params);
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean success = service.subUpdate(params);
		map.put("success", success);
		
		return map;
	}
	
	
	
	
	@RequestMapping("/scriptlist.go")
	public String listPage() {
		logger.info("과목후기 리스트 페이지 이동");
		return "./subject/scriptlist";
	}
	
	@RequestMapping("/scriptlist.ajax")
	@ResponseBody
	public HashMap<String, Object> scriptlist() {
		logger.info("리스트 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SubDTO> list = service.scriptlist();
		logger.info("list : " + list.size());
		map.put("list", list);
		return map;
	}
	

	
	
}
