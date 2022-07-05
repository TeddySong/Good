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
	public String subListGo(Model model, HttpSession session) {			
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./subject/subList";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;		
	}
	
	@RequestMapping(value = "/subList.ajax")
	@ResponseBody
	public HashMap<String, Object> subList(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("리스트 요청");
		return service.subList(params, session);
	}
	
	@RequestMapping(value = "/subRegister.go")
	public String subRegisterGo(Model model, HttpSession session) {
		logger.info("과목 등록 페이지 이동");
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			String loginId = (String)session.getAttribute("loginId");
			if(loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
			page="./subject/subRegister";
			} else {
				page="./subject/subList";
				model.addAttribute("msg","권한이 없습니다");
			}
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;		
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
			@RequestParam(value = "subimg") MultipartFile subimg,
			@RequestParam(value = "file") MultipartFile file, HttpSession session) {
		logger.info("과목 등록");
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> params = new HashMap<String, String>();
		boolean login = false;
		
		params.put("sub_name", subName);
		params.put("sub_condition", subCondition);
		params.put("sub_time", subTime);
		params.put("sub_summary", subSummary);
		
		if (session.getAttribute("loginId") != null) {
			login = true;
			boolean register = service.subRegister(params, subimg, file);
			map.put("subRegister", register);
		}
		map.put("login", login);
		return map;
	}
	
	@RequestMapping("/subDetail.do")
	public String detailPage(@RequestParam String sub_no, HttpSession session, Model model) {
		logger.info("상세보기 페이지 이동 : " +sub_no);
		session.setAttribute("sub_no", sub_no);
		
		SubDTO subDetail = service.subDetail(sub_no);
		ArrayList<SubDTO> srcList = service.subDetailsc(sub_no);
		ArrayList<SubDTO> photoList = service.subCurriDetail(sub_no);
		ArrayList<SubDTO> subImgList = service.subImgDetail(sub_no);

		
		if(session.getAttribute("loginId") != null) {
				model.addAttribute("subDetail", subDetail);
				model.addAttribute("srcList", srcList);
				model.addAttribute("photoList", photoList);
				model.addAttribute("subImgList", subImgList);
		}else {
			model.addAttribute("msg","로그인이 필요한 서비스 입니다.");
		}
				
		return "./subject/subDetail";
	}
	
	@RequestMapping("/subDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> subDetail(HttpSession session) {
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(session.getAttribute("loginId") != null) {
			String sub_no = (String) session.getAttribute("sub_no");
			logger.info("상세보기 요청 : " + sub_no);
			session.removeAttribute("sub_no");
			SubDTO dto = service.subDetail(sub_no);
			ArrayList<SubDTO> list = service.subDetailsc(sub_no);
			ArrayList<SubDTO> photo = service.subCurriDetail(sub_no);
			ArrayList<SubDTO> subimg = service.subImgDetail(sub_no);
			map.put("dto", dto);
			map.put("list", list);
			map.put("photo", photo);
			map.put("subimg", subimg);
		}
		map.put("login", login);
		return map;
	}
	
	
	@RequestMapping("/subUpdate.go")
	public String subUpdatePage(@RequestParam String sub_no, Model model, HttpSession session) {
		logger.info("수정 페이지 이동 : " +sub_no);
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			String loginId = (String)session.getAttribute("loginId");
			if(loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
				session.setAttribute("sub_no", sub_no);
				page="./subject/subUpdate";
			} else {
				page="./subject/subList";
				model.addAttribute("msg","권한이 없습니다");
			}
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;	
		
	}
	
	@RequestMapping("/subUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> subUpdate(@RequestParam(value = "sub_no") String subNo,
			@RequestParam(value = "sub_name") String subName,
			@RequestParam(value = "sub_condition") String subCondition,
			@RequestParam(value = "sub_time") String subTime,
			@RequestParam(value = "sub_summary") String subSummary,
			@RequestParam(value = "subimg", required = false) MultipartFile subimg,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpSession session) {
		logger.info("과목 수정 : " +  subName + ", " + subCondition + ", " + subTime + ", " + subSummary+", " + subimg);
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, String> params = new HashMap<String, String>();
		boolean login = false;
		params.put("sub_no", subNo);
		params.put("sub_name", subName);
		params.put("sub_condition", subCondition);
		params.put("sub_time", subTime);
		params.put("sub_summary", subSummary);
		
		if (session.getAttribute("loginId") != null) {
			login = true;
			boolean success = service.subUpdate(params, subimg, file);
			map.put("success", success);
		}
		map.put("login", login);
		return map;
	}
	
	
	
	
	@RequestMapping("/scriptlist.go")
	public String listPage(Model model, HttpSession session) {
		logger.info("과목후기 리스트 페이지 이동");
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./subject/scriptlist";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;		
	}
	
	@RequestMapping("/scriptlist.ajax")
	@ResponseBody
	public HashMap<String, Object> scriptlist(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("과목 후기 리스트 요청" + params);
		boolean login = false;
		
		if(session.getAttribute("loginId") != null){
			login = true;
		}
		return service.scriptlist(params,login);
	}
	
	/*중복 코드 정리
	 
	@RequestMapping("/scSubCondition.ajax")
	@ResponseBody
	public HashMap<String, Object> scSubCondition(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("노출상태:::" + params);
		return service.scSubCondition(params);
	}
	
	@RequestMapping("/scrSubSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> scrSubSearch(@RequestParam HashMap<String, String> params, HttpSession session) {
		//logger.info("과목번호 나오나요?" + params);
		//logger.info("과목후기 리스트" + params.get("sub_no"));
		//String sub_no = params.get("sub_no");
		//logger.info("과목번호: " + sub_no);
		return service.scrSubSearch(params);
	}
	
	
	@RequestMapping("/subCondition.ajax")
	@ResponseBody
	public HashMap<String, Object> subCondition(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("노출상태:::" + params);
		return service.subCondition(params);
	}
	@RequestMapping("/sublistSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> sublistSearch(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("과목명:::" + params);
		return service.sublistSearch(params);
	}
	*/
	
	
	
	@RequestMapping("/scrDel.ajax")
	@ResponseBody
	public HashMap<String, Object> scrDel(@RequestParam (value="scrDelList[]") ArrayList<String> scrDelList, HttpSession session) {
		
		boolean login = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("scrDelList : " + scrDelList);
		
		if(session.getAttribute("loginId") != null) {
			login = true;
			int cnt = service.scrDel(scrDelList);
			map.put("msg",cnt + " 개 삭제 완료됐습니다.");
		}
		map.put("login", login);
		
		return map;
	}
	
	@RequestMapping("/scrReg.go")
	public String scrRegGo(Model model, HttpSession session) {
		logger.info("과목후기 등록 페이지");
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./subject/scrRegister";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;	
	}
	
	@RequestMapping("/scrSubReg.ajax")
	@ResponseBody
	public HashMap<String, Object> scrSubReg(){
		logger.info("과목후기 과목리스트");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<SubDTO> scrSublist = service.scrSublist();
		map.put("scrSublist", scrSublist);
		return map;
	}
	
	@RequestMapping("/scrReg.ajax")
	@ResponseBody
	public HashMap<String, Object> scrReg(@RequestParam HashMap<String, String> params){
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean scrReg = service.scrReg(params);
		map.put("scrReg", scrReg);
		
		return map;
	}
	

	
	

	
	
}
