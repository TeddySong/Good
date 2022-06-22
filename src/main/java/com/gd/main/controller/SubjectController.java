package com.gd.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.main.service.SubjectService;


@Controller
public class SubjectController {
	
	@Autowired SubjectService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/subList.go", method = RequestMethod.GET)
	public String subListGo(Model model) {			
		return "./subject/subList";
	}
	
	
}
