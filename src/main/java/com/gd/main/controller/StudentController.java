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

import com.gd.main.service.StudentService;


@Controller
public class StudentController {
	
	@Autowired StudentService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/stuList.go")
	public String courListGo() {	
		logger.info("수강생 리스트 페이지 이동");
		return "./student/stuList";
	}
	
	
	@RequestMapping("stuList.ajax")
	@ResponseBody
	public HashMap<String, Object> courseList(
			@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("수강생 리스트 요청 : "+params);
		//HashMap<String, Object> map = new HashMap<String, Object>();
		//ArrayList<CourseDTO> list = service.list();
		//데이터가 여러개라 ArrayList 로 받음
		//map.put("list", list);
		
		boolean login = false;
		
		if(session.getAttribute("loginId") != null){
			login = true;
		}
		
		return service.stuList(params);
	}
	
	
}
