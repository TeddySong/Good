package com.gd.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.main.service.StudentService;


@Controller
public class StudentController {
	
	@Autowired StudentService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	
}
