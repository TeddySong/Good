package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.CourseDTO;

public interface CourseDAO {

	int allCount();

	String courOverlay(String chkCo);

	int courRegister(HashMap<String, Object> params);

	ArrayList<CourseDTO> subName();

	ArrayList<CourseDTO> courseName();

	void subTable(String sub_name, int sub_no);

	CourseDTO courDetail2(String co_no);

	CourseDTO callSubNo(int co_no);

	int courseUpdate(HashMap<String, String> params);

	ArrayList<CourseDTO> courList2(HashMap<String, Object> searchResult);

	int allCount(HashMap<String, Object> searchResult);

	ArrayList<CourseDTO> dangwa();

	ArrayList<CourseDTO> jonghab();

	ArrayList<CourseDTO> selectSubjectCall(String sub_no, String sub_name, int cnt, int offset);

	CourseDTO subDetailHome(String sub_no);

	ArrayList<CourseDTO> homeSrcList(String sub_no);

	
}
