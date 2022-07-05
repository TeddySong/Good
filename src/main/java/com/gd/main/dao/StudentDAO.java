package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.StuDTO;

public interface StudentDAO {

	ArrayList<StuDTO> stuList(HashMap<String, Object> map);

	ArrayList<StuDTO> allCount(HashMap<String, Object> map);

	ArrayList<StuDTO> cliSearchList(HashMap<String, Object> map);

	ArrayList<StuDTO> cliChoice(int result);

	ArrayList<StuDTO> subSearchList(String searchContent);
	
	ArrayList<StuDTO> subChoice(int result);

	StuDTO stuDetail(String stu_no);
	
	ArrayList<StuDTO> subList(HashMap<String, Object> map);

	/* int stuRegister(StuDTO dto); */ 

	int stuUpdate(HashMap<String, String> params);

	ArrayList<StuDTO> stuLog(String stu_no);

	int stuLogRegister(HashMap<String, String> params);

	String stuName(String stu_no);

	int stuNoRegister(HashMap<String, String> params);

	
	  int stuRegister(HashMap<String, String> params);

	ArrayList<StuDTO> stuWantSubSearch(HashMap<String, String> params);

	StuDTO cliInfoGet(String cli_no);

	int cliStuFinUpdate(HashMap<String, String> params);

	int stuDelete(HashMap<String, String> params);
	 
	/*
	 * void stuSubRegister(HashMap<String, Object> map);
	 * 
	 * void stuSubUpdate(HashMap<String, Object> map);
	 */

	

	

	

	

	

	


}
