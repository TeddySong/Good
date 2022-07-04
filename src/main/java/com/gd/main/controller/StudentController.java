package com.gd.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.main.dto.StuDTO;
import com.gd.main.service.StudentService;


@Controller
public class StudentController {
	
	@Autowired StudentService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/stuList.go")
	public String stuListGo(Model model, HttpSession session) {	
		logger.info("수강생 리스트 페이지 이동");
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./student/stuList";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}	
		
		return page;
	}
	
	
	@RequestMapping("stuList.ajax")
	@ResponseBody
	public HashMap<String, Object> stuList(
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
		
		return service.stuList(params,login);
	}
	
	@RequestMapping("/stuSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> stuSearch(HttpSession session, @RequestParam HashMap<String, String> params) {
		
		return service.stuList(params, false);
	}
	
	
	
	
	@RequestMapping(value = "/stuRegister.go")
	public String stuRegisterGo(Model model, HttpSession session) {	
		logger.info("수강생 등록 페이지 이동");
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./student/stuRegister";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;
	}
	
	@RequestMapping(value = "/cliSearch.go")
	public String cliSearchGo(Model model, HttpSession session) {	
		logger.info("수강생 등록 시 고객 검색 페이지 이동");
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./student/cliSearch";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;		
		
	}
	
	@RequestMapping(value = "/cliSearch.do")
	public String cliSearch(Model model, HttpSession session, HttpServletRequest req) {
		logger.info("고객 검색");
		
		String cliSearchCondition = req.getParameter("cliSearchCondition");
		String searchContent = req.getParameter("searchContent");
		String page="emp_login";
		
		if(session.getAttribute("loginId") != null) {
		logger.info(cliSearchCondition + "/" + searchContent);
		
		ArrayList<StuDTO> cliSearchList = service.cliSearchList(cliSearchCondition, searchContent);
		logger.info("list size : " + cliSearchList.size());
		model.addAttribute("cliSearchList", cliSearchList);
		page="./student/cliSearch";
		}	
		
		return page;
	}
	
	
	
	@RequestMapping(value="/cliChoice.ajax")
	@ResponseBody
	public HashMap<String, Object> cliChoice(HttpServletRequest req,
			@RequestParam HashMap<String, Object>params, HttpSession session) {
		logger.info("고객 선택 : {}", params );
		
		String choice = (String) params.get("cliChoice");
		logger.info("선택? : " + choice );
		 int result =Integer.parseInt(choice);
		 logger.info("결과? : " + result);
		 
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean login = false;
		
		if(session.getAttribute("loginId")!=null){
		
		ArrayList<StuDTO> cliChoice = service.cliChoice(result);
		login=true;
		map.put("cliChoice", cliChoice);
		logger.info("클라이언트 : {}", cliChoice );
		
		}
		map.put("login", login);
		return map;
	}
	
	@RequestMapping(value = "/subSearch.go")
	public String subSearchGo(HttpSession session, Model model) {	
		
		logger.info("고객등록시 과목검색 이동");
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./student/subSearch";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;		
	}
	
	@RequestMapping(value = "/subSearch.do")
	public String Search(Model model, HttpSession session, HttpServletRequest req) {
		logger.info("과목검색");
				
		String searchContent = req.getParameter("searchContent");
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			
		ArrayList<StuDTO> subSearchList = service.subSearchList(searchContent);
		logger.info("list size : " + subSearchList.size());
		page="./student/subSearch";
		model.addAttribute("subSearchList", subSearchList);
		} else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}		
		return page;
	}
	
	
	@RequestMapping(value="/subChoice.ajax")
	@ResponseBody
	public HashMap<String, Object> subChoice(HttpServletRequest req,
			@RequestParam HashMap<String, Object>params, HttpSession session) {
		logger.info("상세보기 페이지 이동 : {}", params );
		
		String choice = (String) params.get("subChoice");
		logger.info("상세보기 페이지 이동 : " + choice );
		 int result =Integer.parseInt(choice);
		 logger.info("상세보기 페이지 이동 : " + result);
		 		 
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean login = false;
		
		if(session.getAttribute("loginId")!=null){
		ArrayList<StuDTO> subChoice = service.subChoice(result);
		login=true;
		map.put("subChoice", subChoice);
		logger.info("클라이언트 : {}", subChoice );
		 }
		map.put("login", login);
		return map;
	}
	
	
	
	@RequestMapping(value="/stuDetail.go")
	public String detailPage(@RequestParam String stu_no, Model model, HttpSession session) {
		logger.info("학생 상세보기 페이지 이동 : " + stu_no);
		session.setAttribute("stu_no", stu_no);
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./student/stuDetail";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;
		
	}
	
	@RequestMapping(value="/stuDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> stuDetail(HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
				
			String stu_no = (String) session.getAttribute("stu_no");
			logger.info("상세 데이터 요청 : " + stu_no);
			
			boolean login = false;
			
			if(session.getAttribute("loginId")!=null){
			
			StuDTO dto = service.stuDetail(stu_no);
			map.put("dto", dto);
			login=true;
			logger.info("클라이언트 : {}", dto );
			}
			
		map.put("login", login);
		return map;
	}
	
	@RequestMapping(value="/stuSubDetail.ajax")
	@ResponseBody
	public HashMap<String, Object> stuSubDetail(HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
			String stu_no = (String) session.getAttribute("stu_no");
			logger.info("상세 데이터 요청 : " + stu_no);
			session.removeAttribute("stu_no"); // 사용한 idx는 삭제
			return service.subList(stu_no);
	}
	
	
	/*
	 * @RequestMapping("/stuRegister.ajax")
	 * 
	 * @ResponseBody public HashMap<String, Object>stuRegister(
	 * 
	 * @RequestParam HashMap<String, String> params, @RequestParam(value =
	 * "subList[]") ArrayList<Integer> subList) throws ParseException {
	 * 
	 * logger.info("글쓰기 확인 : " + params + subList); return
	 * service.stuRegister(params, subList); }
	 */
	
	@RequestMapping("/stuRegister.ajax")
	   @ResponseBody
	    public HashMap<String, Object>stuRegister(
	          @RequestParam HashMap<String, String> params, HttpSession session){
	       
	       logger.info("글쓰기 확인 : " + params);
	       String loginId = (String) session.getAttribute("loginId");
	       
	       
	       return service.stuRegister(params, loginId);
	    }
	
		/*
		 * @RequestMapping("/stuSubRegister.ajax")
		 * 
		 * @ResponseBody public ArrayList<Integer> stuSubRegister(
		 * 
		 * @RequestParam ArrayList<Integer> subList) {
		 * 
		 * logger.info("과목등록 : " + subList); return null; }
		 */
	
	
	@RequestMapping("/stuUpdate.go")
	 public String update(@RequestParam String stu_no, Model model, HttpSession session) {
		 logger.info("수정 상세보기 페이지 이동:"+stu_no);
		 session.setAttribute("stu_no", stu_no);
		 
		 String page="emp_login";
			if(session.getAttribute("loginId") != null) {
				page="./student/stuUpdateForm";
			}else {
				model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
			}
			
			return page;		 
	 }
	
	@RequestMapping(value="/stuUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> stuUpdate(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		
		logger.info("params : " + params );
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean login = false;
				
		if(session.getAttribute("loginId") != null) {
			logger.info("수정하기 요청");
			login = true;	
			boolean success = service.stuUpdate(params);
			map.put("success", success);
		}
		
		map.put("login", login);
		
		
		return map;
	}
	
	/*
	 * @RequestMapping(value = "/stuLog.go") public String stuLogGo(@RequestParam
	 * String stu_no, HttpSession session) { logger.info("학사일지 페이지 이동:" + stu_no);
	 * session.setAttribute("stu_no", stu_no); return "./student/stuLog"; }
	 */
	
	/*
	 * @RequestMapping(value="/stuLog.ajax")
	 * 
	 * @ResponseBody public HashMap<String, Object> stuLog(HttpSession session,
	 * 
	 * @RequestParam HashMap<String, String> params) { HashMap<String, Object> map =
	 * new HashMap<String, Object>();
	 * 
	 * String stu_no = (String) session.getAttribute("stu_no");
	 * logger.info("상세 데이터 요청 : " + stu_no); session.removeAttribute("stu_no"); //
	 * 사용한 idx는 삭제 StuDTO dto = service.stuLog(stu_no); map.put("dto", dto);
	 * logger.info("클라이언트 : {}", dto );
	 * 
	 * 
	 * return map; }
	 */
	
	@RequestMapping(value = "/stuLog.go")
	public String stuLog(Model model, HttpSession session, @RequestParam String stu_no) {
		
		String page = "redirect:/stuList.go";
		logger.info("상세보기 요청 글 번호: " + stu_no);
		
		if(session.getAttribute("loginId") != null) {			
			ArrayList<StuDTO> list = service.stuLog(stu_no);
			if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("stu_no",stu_no);
			String stuName = service.stuName(stu_no);
			model.addAttribute("stuName",stuName);
			page = "./student/stuLog";
			}
		} else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;
	}
	
	
	@RequestMapping(value="/stuLogRegister.go")
	public String stuLogRegisterGo(@RequestParam String stu_no, Model model, HttpSession session) {
		logger.info("학사일지 등록 페이지 이동 : " + stu_no);
		session.setAttribute("stu_no", stu_no);
		
		 String page="emp_login";
			if(session.getAttribute("loginId") != null) {
				page="./student/stuLogRegister";
			}else {
				model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
			}
			
			return page;	
	}
	
	@RequestMapping("/stuLogRegister.ajax")
	   @ResponseBody
	    public HashMap<String, Object> stuLogRegister(
	          @RequestParam HashMap<String, String> params) {
	       
	       logger.info("학사일지쓰기");
	       return service.stuLogRegister(params);
	    }
	
	@RequestMapping("/stuWantSubSearch.ajax")
	   @ResponseBody
	    public HashMap<String, Object> stuWantSubSearch(
	          @RequestParam HashMap<String, String> params) {
	       
	       logger.info("희망과목보기");
	       return service.stuWantSubSearch(params);
	    }
	
		
	@RequestMapping(value="/cliUpdate.go")
	public String cliUpdateGo(@RequestParam String cli_no, Model model , HttpSession session) {
		logger.info("고객 수정 페이지 이동 : " + cli_no);
		session.setAttribute("cli_no", cli_no);
		
		String page="emp_login";
		if(session.getAttribute("loginId") != null) {
			page="./student/cliUpdate";
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스 입니다");
		}
		
		return page;	
	}
	
	@RequestMapping(value="/cliUpdateInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> cliUpdate(HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String cli_no = (String) session.getAttribute("cli_no");
		logger.info("상세 데이터 요청 : " + cli_no);			
		StuDTO dto = service.cliUpdateInfo(cli_no);
		map.put("dto", dto);
		logger.info("클라이언트 : {}", dto );
	
	
	return map;
	}	
	
	
	@RequestMapping(value="/cliStuFinUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> cliStuFinUpdate(HttpSession session,
			@RequestParam HashMap<String, String> params) {
		
		logger.info("params : " + params );
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean login = false;
				
		if(session.getAttribute("loginId") != null) {
			logger.info("수정하기 요청");
			login = true;	
			boolean success = service.cliStuFinUpdate(params);
			map.put("success", success);
		}
		
		map.put("login", login);
		
		
		return map;
	}
	
	@RequestMapping(value="/stuDelete.ajax")
	@ResponseBody
	public HashMap<String, Object> stuDelete(HttpSession session,
			@RequestParam HashMap<String, String> params, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String loginId=(String) session.getAttribute("loginId");
		if(loginId.equals("emp0") || loginId.equals("emp1") || loginId.equals("emp2")) {
			int cnt = service.stuDelete(params);
			map.put("msg", "삭제가 완료되었습니다.");
			} else {				
				map.put("msg","권한이 없습니다");
			}
	
		return map;
		
	}
	
}
