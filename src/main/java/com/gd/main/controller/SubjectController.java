package com.gd.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
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
	public HashMap<String, Object> subList(HttpSession session) {
		logger.info("리스트 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean login = false;
		
		if (session.getAttribute("loginId") != null) {
			login = true;
			ArrayList<SubDTO> list = service.subList();
			logger.info("subList : " + list.size());
			map.put("subList", list);
		}
		map.put("login", login);
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
	public HashMap<String, Object> subRegister(@RequestParam(value = "sub_name") String subName,
			@RequestParam(value = "sub_condition") String subCondition,
			@RequestParam(value = "sub_time") String subTime,
			@RequestParam(value = "sub_summary") String subSummary,
			@RequestParam(value = "file") MultipartFile file) {
		logger.info("과목 등록");
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("sub_name", subName);
		params.put("sub_condition", subCondition);
		params.put("sub_time", subTime);
		params.put("sub_summary", subSummary);
		
		boolean register = service.subRegister(params, file);
		map.put("subRegister", register);
		
		return map;
	}
	
	@RequestMapping("/subDetail.do")
	public String detailPage(@RequestParam String sub_no, HttpSession session, Model model) {
		logger.info("상세보기 페이지 이동 : " +sub_no);
		session.setAttribute("sub_no", sub_no);
		
		SubDTO subDetail = service.subDetail(sub_no);
		ArrayList<SubDTO> srcList = service.subDetailsc(sub_no);
		ArrayList<SubDTO> photoList = service.subCurriDetail(sub_no);
		
		model.addAttribute("subDetail", subDetail);
		model.addAttribute("srcList", srcList);
		model.addAttribute("photoList", photoList);
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
		ArrayList<SubDTO> photo = service.subCurriDetail(sub_no);
		map.put("dto", dto);
		map.put("list", list);
		map.put("photo", photo);
			
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
	public HashMap<String, Object> subUpdate(@RequestParam(value = "sub_no") String subNo,
			@RequestParam(value = "sub_name") String subName,
			@RequestParam(value = "sub_condition") String subCondition,
			@RequestParam(value = "sub_time") String subTime,
			@RequestParam(value = "sub_summary") String subSummary,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		logger.info("과목 수정 : " +  subName + ", " + subCondition + ", " + subTime + ", " + subSummary);
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("sub_no", subNo);
		params.put("sub_name", subName);
		params.put("sub_condition", subCondition);
		params.put("sub_time", subTime);
		params.put("sub_summary", subSummary);
		
		boolean success = service.subUpdate(params, file);
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
	public HashMap<String, Object> scriptlist(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("과목 후기 리스트 요청" + params);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//ArrayList<SubDTO> list = service.scriptlist();
		//logger.info("list : " + list.size());
		//map.put("list", list);
		
		
		return service.scriptlist(params);
	}
	
	
	@RequestMapping("/scrDel.ajax")
	@ResponseBody
	public HashMap<String, Object> scrDel(@RequestParam (value="scrDelList[]") ArrayList<String> scrDelList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("scrDelList : " + scrDelList);
		
		int cnt = service.scrDel(scrDelList);
		map.put("msg",cnt + " 개 삭제 완료됐습니다.");
		
		return map;
	}
	
	@RequestMapping("/scrReg.go")
	public String scrRegGo() {
		logger.info("과목후기 등록 페이지");
		return "./subject/scrRegister";
	}
	
	@RequestMapping("/scrReg.ajax")
	@ResponseBody
	public HashMap<String, Object> scrReg(){
		logger.info("과목후기 과목리스트");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SubDTO> list = service.scrSublist();
		map.put("list", list);
		return map;
	}

	
	
}
