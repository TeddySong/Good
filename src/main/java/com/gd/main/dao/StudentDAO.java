package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.StuDTO;

public interface StudentDAO {

	ArrayList<StuDTO> list(int cnt, int offset);

	int allCount();

	ArrayList<StuDTO> cliSearchList(String searchContent);

	ArrayList<StuDTO> cliChoice(int result);

	ArrayList<StuDTO> subSearchList(String searchContent);
	
	ArrayList<StuDTO> subChoice(int result);

	StuDTO stuDetail(String stu_no);

	int stuRegister(HashMap<String, String> params);

	int stuUpdate(HashMap<String, String> params);


}
