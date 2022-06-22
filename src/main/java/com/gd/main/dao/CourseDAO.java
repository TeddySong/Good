package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.CourseDTO;

public interface CourseDAO {

	ArrayList<CourseDTO> list(int cnt, int offset);

	int allCount();

	CourseDTO detail(String co_no);

	int update(HashMap<String, String> params);

	ArrayList<CourseDTO> paging(int itemsInAPage, int offset);

	String overlay(String chkCo);

	int write(HashMap<String, Object> params);
}
