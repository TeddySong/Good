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
	
	
	@RequestMapping("/clientlist.ajax")
	public @ResponseBody HashMap<String, Object> list(@RequestParam HashMap<String, String> params) {
		
		//logger.info("리스트 요청"+params);
		return service.ajaxlist(params);
	}
	
	@RequestMapping("/clientsearch.ajax")
	public @ResponseBody HashMap<String, Object> search(@RequestParam HashMap<String, String> params) {
		
		logger.info("리스트 요청"+params);
		return service.ajaxSearch(params);
	}
	
	@RequestMapping("/clientdelete.ajax")
	@ResponseBody
	public HashMap<String, Object> delete(HttpSession session,
			@RequestParam(value = "delList[]") ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
			int cnt = service.ajaxDelete(delList);
			map.put("msg", delList.size() + "중" + cnt + " 개 삭제 완료");
	
		
		return map;
	}
	
	// 6/24 추가 
	
	@RequestMapping("/cliReg.ajax")
	@ResponseBody
	public HashMap<String, Object> reg (@RequestParam("cli_name") String cli_name, @RequestParam("cli_phone") String cli_phone,
			@RequestParam("cli_req") String cli_req,@RequestParam("sub_no") ArrayList<Integer> sub_no
			) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
//		System.out.println(cli_name);
//		System.out.println(cli_phone);
//		System.out.println(cli_req);
		System.out.println(sub_no);
		map.put("cli_name", cli_name);
		map.put("cli_phone", cli_phone);
		map.put("cli_req", cli_req);
			//@RequestParam(value="parameter이름[]")List<String>
		//System.out.println(params);
//		
//		List<String> sub = (List<String>) params.get("sub_name");
//		for (String string : sub) {
//			System.out.println(string);
//		}
		  service.cliReg(map);
	
		 service.cliRegCo(sub_no);
		 
		return  map;
	}
	
	@RequestMapping("/clientupdate.ajax")
	@ResponseBody
	public HashMap<String, Object> cliUpdate(@RequestParam HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cli_no = Integer.parseInt((String) params.get("cli_no"));
		String cli_name = (String) params.get("cli_name");
		String cli_phone = (String) params.get("cli_phone");
		map.put("cli_phone", cli_phone);
		map.put("cli_name", cli_name);
		map.put("cli_no", cli_no);
		
			int cnt = service.cliUpdate(map);
			map.put("cnt", cnt);
		
		return map;
	}
	
	@RequestMapping("/empSearch.ajax")
	@ResponseBody
	public ArrayList<Client_Dto> empSearch(@RequestParam String empkeyword) {
		ArrayList<Client_Dto> list = new ArrayList<Client_Dto>();
		
		return service.empSearch(empkeyword);
	}
	
	@RequestMapping("/empList.ajax")
	@ResponseBody
	public ArrayList<Client_Dto> empList() {
		ArrayList<Client_Dto> list = new ArrayList<Client_Dto>();
		
		return service.empList();
	}
	
	@RequestMapping("/empUp.ajax")
	@ResponseBody
	public int empUp(String emp_no, int cli_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("emp_no", emp_no);
		map.put("cli_no", cli_no);
		return service.empUp(map);
	}
	
	
	
}
