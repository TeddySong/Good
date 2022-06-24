package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.gd.main.dto.CourseDTO;
import com.gd.main.dto.SubDTO;

public interface CourseDAO {

	ArrayList<CourseDTO> list(int cnt, int offset);

	int allCount();

	CourseDTO detail(String co_no);

	int update(HashMap<String, String> params);

	String overlay(String chkCo);

	int write(HashMap<String, Object> params);

	ArrayList<CourseDTO> subjectList();
}
