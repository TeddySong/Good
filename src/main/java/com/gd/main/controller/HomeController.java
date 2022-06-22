package com.gd.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gd.main.service.HomeService;


@Controller
public class HomeController {
	
	@Autowired HomeService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {			
		return "home";
	}
	
	@RequestMapping(value = "/login.go", method = RequestMethod.GET)
	public String login(Model model) {			
		return "emp_login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginSuccess(Model model) {			
		return "emp_main";
	}
	
	@RequestMapping(value = "/stuList.go", method = RequestMethod.GET)
	public String stuListGo(Model model) {			
		return "./student/stuList";
	}
	
	@RequestMapping(value = "/empList.go", method = RequestMethod.GET)
	public String empListGo(Model model) {			
		return "./employee/empList";
	}
	
	@RequestMapping(value = "/class_main.go", method = RequestMethod.GET)
	public String classMainGo(Model model) {			
		return "class_main";
	}
	
	@RequestMapping(value = "/subList.go", method = RequestMethod.GET)
	public String subListGo(Model model) {			
		return "./subject/subList";
	}
	
	@RequestMapping(value = "/courList.go", method = RequestMethod.GET)
	public String courListGo(Model model) {			
		return "./course/courList";
	}
	
	@RequestMapping(value = "/assList.go", method = RequestMethod.GET)
	public String assListGo(Model model) {			
		return "./assign/assList";
	}
	
	@RequestMapping(value = "/cliList.go", method = RequestMethod.GET)
	public String cliListGo(Model model) {			
		return "./client/cliList";
	}
	
}
