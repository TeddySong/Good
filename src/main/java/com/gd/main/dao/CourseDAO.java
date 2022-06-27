package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.CourseDTO;

public interface CourseDAO {

	//ArrayList<CourseDTO> courList(int cnt, int offset);

	int allCount();

	CourseDTO courDetail(String co_no);

	String courOverlay(String chkCo);

	int courRegister(HashMap<String, Object> params);

	//ArrayList<CourseDTO> subjectList();

	ArrayList<CourseDTO> subName();

	ArrayList<CourseDTO> courseName();

	ArrayList<CourseDTO> courList();

	void subTable(String sub_name, int sub_no);

	//CourseDTO getSelectSubName(String sub_no);

	//CourseDTO selectedSubName(String sub_no);

	//int courUpdate(HashMap<String, Object> map);

	CourseDTO courDetail2(String co_no);

	CourseDTO callSubNo(int co_no);

	int courseUpdate(HashMap<String, String> params);

	
}
