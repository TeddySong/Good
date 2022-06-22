package com.gd.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.main.dto.StuDTO;
import com.gd.main.service.StudentService;


@Controller
public class StudentController {
	
	@Autowired StudentService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/stuList.go", method = RequestMethod.GET)
		public String stuListGo(Model model, HttpSession session) {
		
		logger.info("수강생 리스트 요청");
		ArrayList<StuDTO> list = service.list();
		logger.info("list 개 수 : " + list.size());
		String page = "./student/stuList";
		model.addAttribute("list", list);
		
		
		return page;
	}
	
	
}
