package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.gd.main.dto.SubDTO;

public interface SubjectDAO {

	ArrayList<SubDTO> subList();

	String subOverlay(String subname);

	int subRegister(HashMap<String, String> params, MultipartFile[] curris, int subno);

	

	

}
