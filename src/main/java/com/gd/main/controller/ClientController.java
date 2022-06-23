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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.main.dto.Client_Dto;

import com.gd.main.service.ClientService;

@Controller
public class ClientController {
	 Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ClientService service; 
	
	

	
	@RequestMapping("/listSearch")
	public String getListSearch(Model model, @RequestParam(required = false)String searchType ,@RequestParam(required = false)String keyword) {
		logger.info("확인용");
		ArrayList<Client_Dto> clients= null;
		// DTO 가 담긴 list를 view에 뿌릴 것. 
	
		int allcnt = service.listsearchCount(searchType,keyword);
		clients =	service.client_search(searchType,keyword);
		logger.info("clients"+clients);
		model.addAttribute("allcnt",allcnt);
		model.addAttribute("clients",clients);
		logger.info("확인용2");
		return "client/listsearch";
	}
	
	@RequestMapping("/clientDetail.go")
	public String getDetail(int cli_no, Model model) {
		
		//고객 상세보기 정보 
		Client_Dto data = service.detail_Client(cli_no); 
		
		// 상담일지 정보 
		ArrayList<Client_Dto> data_log= service.clientLog(cli_no);
		
		logger.info("data_log"+data_log);
		model.addAttribute("data",data);
		model.addAttribute("data_log",data_log);
		return "client/detail";
	}
	

	
	@RequestMapping("/cliList.go")
	public String ajaxhome() {
		return "client/ajaxList";
	}
	
	
	@RequestMapping("/list.ajax")
	public @ResponseBody HashMap<String, Object> list(@RequestParam HashMap<String, String> params) {
		
		//logger.info("리스트 요청"+params);
		return service.ajaxlist(params);
	}
	
	@RequestMapping("/search.ajax")
	public @ResponseBody HashMap<String, Object> search(@RequestParam HashMap<String, String> params) {
		
		logger.info("리스트 요청"+params);
		return service.ajaxSearch(params);
	}
	
	@RequestMapping("/delete.ajax")
	@ResponseBody
	public HashMap<String, Object> delete(HttpSession session,
			@RequestParam(value = "delList[]") ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
			int cnt = service.ajaxDelete(delList);
			map.put("msg", delList.size() + "중" + cnt + " 개 삭제 완료");
	
		
		return map;
	}
}
