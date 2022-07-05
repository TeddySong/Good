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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.main.dto.Client_Dto;
import com.gd.main.service.ClientService;
import com.gd.main.service.SubjectService;

@Controller
public class ClientController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ClientService service;
	@Autowired
	SubjectService subService;

	@RequestMapping("/clientDetail.go")
	public String getDetail(int cli_no, Model model, HttpSession session) {
		String page = "emp_login";

		if (session.getAttribute("loginId") != null) {
			page = "client/detail";

			// 고객 상세보기 정보
			Client_Dto data = service.detail_Client(cli_no);

			// 상담일지 정보
			ArrayList<Client_Dto> data_log = service.clientLog(cli_no);
			// 직원 정보
			ArrayList<Client_Dto> emp = service.empList();
			model.addAttribute("emp", emp);
			logger.info("data_log" + data_log);
			model.addAttribute("data", data);
			model.addAttribute("data_log", data_log);

		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}

		return page;
	}

	@RequestMapping("/cliList.go")
	public String ajaxhome(Model model,String cli_name, String cli_phone, HttpSession session) {
		String page = "emp_login";

		if (session.getAttribute("loginId") != null) {
			page = "client/ajaxList";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}

		return page;

	}

	@RequestMapping("/subSearch.ajax")
	public @ResponseBody HashMap<String, Object> subSearch(
			@RequestParam(value = "cli_no", required = false) ArrayList<Object> cli_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		// service.ajaxSubSearch(cli_no);

		/*
		 * if(cli_no==null) { ArrayList<Object> li = new ArrayList<Object>(); cli_no= li
		 * ; map.put("li", li); return map;}
		 */

		return service.ajaxSubSearch(cli_no);
	}

	@RequestMapping("/clidelete.ajax")
	@ResponseBody
	public HashMap<String, Object> delete(HttpSession session,
			@RequestParam(value = "delList[]") ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		logger.info("id는" + loginId);
		
		
		if (loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
			int cnt = service.ajaxDelete(delList);
			map.put("msg", delList.size() + "중" + cnt + " 개 삭제 완료");
		} else {
			map.put("msg", "권한이 없습니다.");
		}

		return map;
	}

	@RequestMapping("/cliReg.ajax")
	@ResponseBody
	public HashMap<String, Object> reg(@RequestParam("cli_name") String cli_name,
			@RequestParam("cli_phone") String cli_phone, @RequestParam("cli_req") String cli_req,
			@RequestParam("sub_no") ArrayList<Integer> sub_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		System.out.println(sub_no);
		map.put("cli_name", cli_name);
		map.put("cli_phone", cli_phone);
		map.put("cli_req", cli_req);

		service.cliReg(map);

		service.cliRegCo(sub_no);

		return map;
	}

	@RequestMapping("/cliupdate.ajax")
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

	@RequestMapping("/cliempSearch.ajax")
	@ResponseBody
	public ArrayList<Client_Dto> empSearch(@RequestParam String empkeyword) {
		ArrayList<Client_Dto> list = new ArrayList<Client_Dto>();

		return service.empSearch(empkeyword);
	}

	@RequestMapping("/cliempList.ajax")
	@ResponseBody
	public ArrayList<Client_Dto> empList() {
		ArrayList<Client_Dto> list = new ArrayList<Client_Dto>();

		return service.empList();
	}

	@RequestMapping("/cliempUp.ajax")
	@ResponseBody
	public int empUp(String emp_no, int cli_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("emp_no", emp_no);
		map.put("cli_no", cli_no);
		return service.empUp(map);
	}

	@RequestMapping("/cliregSub.ajax")
	@ResponseBody
	public ArrayList<HashMap<String, Object>> regSub() {

		return service.regSub();
	}

	@RequestMapping("/cli_no.ajax")
	@ResponseBody
	public ArrayList<Integer> cli_no() {
		return service.cli_no();
	}

	@RequestMapping("/cliSearch.ajax")
	public @ResponseBody HashMap<String, Object> search(@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// logger.info("리스트 요청"+params);
		//System.out.println("리스트 요청" + params);
//		 HashMap<String, Object> list  = service.ajaxSearch(params);
//		System.out.println(list.get(0));
	//	System.out.println("어떻게 보낼지.");
		return service.ajaxSearch(params);
	}

	@RequestMapping("/scheRegister.go")
	public String scheRegister(Integer cli_no, Model model, HttpSession session) {

		String page = "emp_login";

		if (session.getAttribute("loginId") != null) {
			page = "client/scheRegister";

			// 고객
			// Integer cli_no=Integer.parseInt(cli_noo);
			Client_Dto data = service.detail_Client(cli_no);
			// 고객 한명에 대한 담당자
			Client_Dto data2 = service.cliManager(cli_no);

			// System.out.println("이름"+data2.getEmp_name());
			model.addAttribute("data", data);
			model.addAttribute("data2", data2);
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}

		return page;
	}

	@RequestMapping("/scheRegister.do")
	public String scheRegisterDo(RedirectAttributes re, @RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//System.out.println("params:" + params);
		// 넘어온 값들 저장

		String cli_log_content = params.get("cli_log_content");
		int cli_no = Integer.parseInt(params.get("cli_no"));
		int emp_no = Integer.parseInt(params.get("emp_no"));
		String cli_log_Dday = params.get("cli_log_Dday");
		String cli_log_Dtime = params.get("cli_log_Dtime");
		
		cli_log_Dday = cli_log_Dday +" "+ cli_log_Dtime;
		String cli_log_result = params.get("result");

		map.put("cli_log_result", cli_log_result);
		map.put("cli_no", cli_no);
		map.put("emp_no", emp_no);
		//map.put("cli_log_Dtime", cli_log_Dtime);
		map.put("cli_log_Dday", cli_log_Dday);
		map.put("cli_log_content", cli_log_content);
		// 성공 메시지 저장
		String msg = service.scheRegister(map);
		re.addFlashAttribute("msg", msg);
		re.addAttribute("cli_no", cli_no);
		return "redirect:/clientDetail.go";
	}

// 일정 리스트 이동 
	@RequestMapping("/checkList.go")
	public String checkListGo(Model model, HttpSession session) {

		String page = "emp_login";

		if (session.getAttribute("loginId") != null) {
			page = "client/checkList";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		return page;
	}

	@RequestMapping("/checkList.do")
	@ResponseBody
	public HashMap<String, Object> checkListDo(@RequestParam HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		return service.checkListDo(params);
	}

	
	@RequestMapping(value="/")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		String msg =  "로그인이 필요한 서비스입니다.";
		session.setAttribute("msg", msg);
	
		return "emp_login";
	}
}