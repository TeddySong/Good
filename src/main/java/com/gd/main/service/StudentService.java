package com.gd.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.main.dao.StudentDAO;
import com.gd.main.dto.StuDTO;

@Service
public class StudentService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired StudentDAO dao;

	public HashMap<String, Object> stuList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		//hashmap 을 반환하기위해 객체화
		
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : "+page);
		// 1페이지 -> 0(offset:게시글 시작 번호)
		// 2페이지 -> 5
		// 3페이지 -> 10
		// 4페이지 -> 15
		// 5페이지 -> 20
		
		//총 갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		int allCnt = dao.allCount();
		logger.info("allCnt : "+allCnt);
		int pages = allCnt % cnt > 0 ? (allCnt / cnt)+1 : (allCnt / cnt);
		logger.info("pages : "+pages);
		
		if(page > pages) { //5개씩 보는 마지막 페이지로 갔을 때, 15개씩 보는 걸로 바꿨을때 뜨는 에러 해결
			page = pages;
		}
		
		map.put("pages", pages); //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		
		int offset = (page-1) * cnt;
		logger.info("offset : "+offset);
		
		ArrayList<StuDTO> list = dao.list(cnt,offset);
		map.put("list", list);
		
		return map;
	}

	public ArrayList<StuDTO> cliSearchList(String searchContent) {
		logger.info("리스트 서비스 요청");
		return dao.cliSearchList(searchContent);		
	}

	public ArrayList<StuDTO> cliChoice(int result) {
		logger.info("고객 데이터 선택 서비스 요청 : {}",result );
		return dao.cliChoice(result);
	}
	
	public ArrayList<StuDTO> subSearchList(String searchContent) {
		logger.info("리스트 서비스 요청");
		return dao.subSearchList(searchContent);		
	}
	
	public ArrayList<StuDTO> subChoice(int result) {
		logger.info("고객 데이터 선택 서비스 요청 : {}",result );
		return dao.subChoice(result);
	}

	public StuDTO stuDetail(String stu_no) {
		
		return dao.stuDetail(stu_no);

	}

	public HashMap<String, Object> stuRegister(HashMap<String, String> params) {
		logger.info("들어왔는지 확인");
	      HashMap<String, Object> result=new HashMap<String, Object>();
	      int row=dao.stuRegister(params);
	      boolean cnt=false;
	      if(row>0) {
	         cnt=true;
	      }
	      result.put("success",cnt);
	      return result;
	}

	
	
	
}
