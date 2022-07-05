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

import com.gd.main.dto.AssListDTO;
import com.gd.main.service.AssignService;

@Controller
public class AssignController {

	@Autowired
	AssignService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/assList.go", method = RequestMethod.GET)
	public String assListGo(Model model,HttpSession session) {
		
		 String page = "emp_login";

		 if(session.getAttribute("loginId") != null) {
			 page = "./assign/assList";
		} else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		return page;
	}
	//배정 리스트 페이지 이동
	@RequestMapping("/assignList.ajax")
	@ResponseBody
	public HashMap<String, Object> list(HttpSession session, 
			@RequestParam HashMap<String, String> params) {
		
		
		logger.info("배정 리스트 요청" + params);	
		
		return service.assList(params);
	}
	
	//배정 검색기능
	@RequestMapping("/assignSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> assSearch(HttpSession session, @RequestParam HashMap<String, String> params) {
		
		return service.assList(params);
	}
	
	//과정배정 리스트 페이지 이동
	@RequestMapping(value = "/assCoList.go", method = RequestMethod.GET)
	public String assCoListGo(HttpSession session,@RequestParam String co_no,Model model) {
		
		 String page = "emp_login";

		 if(session.getAttribute("loginId") != null) {
			
			session.setAttribute("co_no", co_no); 
			page = "./assign/assCoList";
			//model.addAttribute("list",list);		 
		} else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		return page;
	}
	
	
	/*
	 * //과정배정 리스트 페이지 이동
	 * 
	 * @RequestMapping(value = "/assCoList.go", method = RequestMethod.GET) public
	 * String assCoListGo(HttpSession session,@RequestParam String co_name,Model
	 * model) {
	 * 
	 * String page = "home";
	 * 
	 * if(session.getAttribute("loginId") != null) {
	 * 
	 * session.setAttribute("co_name", co_name); 
	 * page = "./assign/assCoList";
	 * //model.addAttribute("list",list); } return page; }
	 */
	
	@RequestMapping("/assCoList.ajax")
	@ResponseBody
	public HashMap<String, Object> assCoListDo(HttpSession session, @RequestParam HashMap<String, String> params){
	  
		logger.info("과정 배정 페이지 이동");
		 
		 //HashMap<String, Object> map = new HashMap<String, Object>();
		 String co_no =(String) session.getAttribute("co_no");
		
		 //ArrayList<AssListDTO> dto = service.assCoList(params);
		 //map.put("dto", dto);
		 //map.put("co_name",map);
		 logger.info("배열은 : " + params);
		 
		 return service.assCoList(params,co_no);
	 }
	
	//과정 검색
	@RequestMapping("/assCoListSe.ajax")
	@ResponseBody
	public HashMap<String, Object> assCoListSe(
			@RequestParam HashMap<String, String> params,HttpSession session){
		//HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("검색결과 리스트 요청"+params);
		 String co_no =(String) session.getAttribute("co_no");
	
		return service.assCoList(params, co_no);
	}

	
	
	/*
	 * @RequestMapping("/assCoList.ajax")
	 * 
	 * @ResponseBody public HashMap<String, Object> assCoListDo(HttpSession
	 * session, @RequestParam HashMap<String, String> param){
	 * 
	 * logger.info("과정 배정 페이지 이동");
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>(); 
	 * String co_name =(String) session.getAttribute("co_name");
	 * AssListDTO dto = service.assCoList(co_name);
	 * map.put("dto", dto); logger.info("클라이언트 : " + dto);
	 * 
	 * return map; }
	 */
	 
	  @RequestMapping("/assStuList.go")
		public String assStuList(HttpSession session, @RequestParam String stu_no, Model model) {
			 String page = "emp_login";
			 if(session.getAttribute("loginId") != null) {
				String nameGet = service.nameGet(stu_no);	
				session.setAttribute("stu_no", stu_no);
				
				logger.info("이름:" + nameGet);
				model.addAttribute("nameGet",nameGet);
				page = "./assign/assStuList";	 
			} else {
				model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
			}
			return page;
		}
	  
	  @RequestMapping("/assStuList.ajax")
	  @ResponseBody 
	  public HashMap<String, Object> assStuList(HttpSession session,@RequestParam HashMap<String, String> params){
	  
	  logger.info("학생 배정 페이지 이동");
	  String stu_no =(String) session.getAttribute("stu_no");
	  HashMap<String, Object> map = new HashMap<String, Object>();
		
		logger.info("상세 데이터 요청 : " + stu_no);
		
		boolean login = false;
		
		if(session.getAttribute("loginId")!=null){
		
		ArrayList<AssListDTO> dto = service.assStuCoList(stu_no);
		
		map.put("dto", dto);
		login=true;
		map.put("stu_no", stu_no);		
		logger.info("클라이언트 : {}", dto );
		}
		
	map.put("login", login);
	return map;
	 }
	  
	  @RequestMapping("/coSearchUp.ajax")
	  @ResponseBody 
	  public HashMap<String, Object> coSearchUp(HttpSession session,@RequestParam HashMap<String, String> params){
	  
	  logger.info("배정수정 페이지!");
	  String stu_no =(String) session.getAttribute("stu_no");
	  //String co_no = (String) session.getAttribute("co_no");
	  
	 return service.coSearchUp(params,stu_no);
	 }
	  
	  @RequestMapping("/coSearchDel.ajax")
	  @ResponseBody 
	  public HashMap<String, Object> coSearchDel(HttpSession session,@RequestParam HashMap<String, String> params){
	  
	  logger.info("배정수정 페이지!");
	  String stu_no =(String) session.getAttribute("stu_no");
	  //String co_no = (String) session.getAttribute("co_no");
	  
	 return service.coSearchDel(params,stu_no);
	 }
	  
	  
	
	  @RequestMapping("/coSearList.go")
		public String coSear(HttpSession session, Model model) {
			
			 String page = "emp_login";
			 if(session.getAttribute("loginId") != null) {
				//session.setAttribute("stu_no", stu_no); 	
				
				page = "./assign/coSearList";
			 }else {
					model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
				}
			return page;
		}
	//리스트 호출
		@RequestMapping("/coSearList.ajax")
		@ResponseBody
		public HashMap<String, Object> courList(
				@RequestParam HashMap<String, String> params,HttpSession session) {
			//HashMap<String, Object> map = new HashMap<String, Object>();
			logger.info("과정 리스트 요청 : "+params);	
			String stu_no = (String)session.getAttribute("stu_no");
			HashMap<String, Object> map = service.courList2(params,stu_no);
			
			
			logger.info(map + "!");
			
		
			return map;
		}
		//과정 검색
		@RequestMapping("/assCourSearch.ajax")
		@ResponseBody
		public HashMap<String, Object> courSearch(
				@RequestParam HashMap<String, String> params,HttpSession session){
			//HashMap<String, Object> map = new HashMap<String, Object>();
			logger.info("검색결과 리스트 요청"+params);
			String stu_no = (String)session.getAttribute("stu_no");
		
			return service.courList2(params, stu_no);
		}
	  
		@RequestMapping("/assStuListInsert.ajax")
		@ResponseBody 
		public HashMap<String, Object> assStuListInsert(HttpSession session,@RequestParam HashMap<String, String> params){
			  
			  logger.info("학생 배정 페이지 이동");
			  
				/*
				 * HashMap<String, Object> map = new HashMap<String, Object>(); 
				 *  
				 * AssListDTO dto = service.assStuCoList(cli_name);
				 * 
				 * map.put("dto", dto); logger.info("클라이언트 : " + dto);
				 */
			String stu_no =(String) session.getAttribute("stu_no");
			
			  
			 return service.assStuListInsert(params,stu_no);
			 }
		
		 @RequestMapping("/coSturSearch.go")
			public String coSturSearch(HttpSession session, Model model) {
				
				 String page = "emp_login";
				 if(session.getAttribute("loginId") != null) {
					//session.setAttribute("stu_no", stu_no); 	
					
					page = "./assign/coSturSearch";
				 }else {
						model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
					}
				return page;
			}
		 
		 @RequestMapping("/assStuListchange.ajax")
		 @ResponseBody 
			public HashMap<String, Object> assStuListchange(HttpSession session,@RequestParam HashMap<String, String> params){
				  
				  logger.info("배정 수정 페이지");
				  
					/*
					 * HashMap<String, Object> map = new HashMap<String, Object>(); 
					 *  
					 * AssListDTO dto = service.assStuCoList(cli_name);
					 * 
					 * map.put("dto", dto); logger.info("클라이언트 : " + dto);
					 */
				  String stu_no =(String) session.getAttribute("stu_no");

				 return service.assStuListchange(params,stu_no);
				 }


}
