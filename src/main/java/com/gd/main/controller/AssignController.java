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
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.main.dto.AssListDTO;
import com.gd.main.service.AssignService;


@Controller
public class AssignController {
	
	@Autowired AssignService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/assList.go", method = RequestMethod.GET)
	public String assListGo(Model model) {
		return "./assign/assList";
	}
	
	@RequestMapping("/assList.ajax")
	@ResponseBody
	public HashMap<String, Object> list(HttpSession session){
		logger.info("배정 리스트 요청");
		
		HashMap<String, Object> assMap = new HashMap<String, Object>();
		
		boolean login = false;
		if(session.getAttribute("loginId") != null) {
			login=true;
			ArrayList<AssListDTO> assList = service.assList();
			assMap.put("assList", assList);
		}
		
		assMap.put("login", login);
		
		return assMap;
	}
	
	
	
}
