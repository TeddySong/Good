package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.CourseDTO;

public interface CourseDAO {

	int allCount();

	//CourseDTO courDetail(String co_no);

	String courOverlay(String chkCo);

	int courRegister(HashMap<String, Object> params);

	ArrayList<CourseDTO> subName();

	ArrayList<CourseDTO> courseName();

	//ArrayList<CourseDTO> courList();

	void subTable(String sub_name, int sub_no);

	CourseDTO courDetail2(String co_no);

	CourseDTO callSubNo(int co_no);

	int courseUpdate(HashMap<String, String> params);

	ArrayList<CourseDTO> courList2(int cnt, int offset);

	ArrayList<CourseDTO> courList2(HashMap<String, Object> searchResult);

	
}
