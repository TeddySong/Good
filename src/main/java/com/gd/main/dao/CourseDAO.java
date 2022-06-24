package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.gd.main.dto.CourseDTO;
import com.gd.main.dto.SubDTO;

public interface CourseDAO {

	ArrayList<CourseDTO> courList(int cnt, int offset);

	int allCount();

	CourseDTO courDetail(String co_no);

	int courUpdate(HashMap<String, Object> map);

	String courOverlay(String chkCo);

	int courWrite(HashMap<String, Object> params);

	ArrayList<CourseDTO> subjectList();

	CourseDTO selectSubName(String sub_no);

	ArrayList<CourseDTO> selectCourseName(String co_no);
}
