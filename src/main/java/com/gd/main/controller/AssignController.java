package com.gd.main.controller;

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

import com.gd.main.service.AssignService;

@Controller
public class AssignController {

	@Autowired
	AssignService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/assList.go", method = RequestMethod.GET)
	public String assListGo(Model model,HttpSession session) {
		
		 String page = "home";

		 if(session.getAttribute("loginId") != null) {
			 page = "./assign/assList";
		} 
		return page;
	}
	//배정 리스트 페이지 이동
	@RequestMapping("/assList.ajax")
	@ResponseBody
	public HashMap<String, Object> list(HttpSession session, @RequestParam HashMap<String, String> params) {
		logger.info("배정 리스트 요청");
		return service.assList(params);
	}
	
	//배정 검색기능
	@RequestMapping("/assSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> assSearch(HttpSession session, @RequestParam HashMap<String, String> params) {
		
		return service.assList(params);
	}
	
	// 배정 상세 페이지
	@RequestMapping("/assCoList.go")
	public String assCoListGo(Model model,HttpSession session) {
		
		
		return "./assign/assCoList";
	}

}
