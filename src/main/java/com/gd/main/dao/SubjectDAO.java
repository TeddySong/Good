package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.gd.main.dto.SubDTO;

public interface SubjectDAO {

	ArrayList<SubDTO> subList();

	String subOverlay(String subname);

	int subRegister(SubDTO dto);


	void subHome(String subtime, String subsum, int subno);

	ArrayList<SubDTO> scriptlist();

	SubDTO subDetail(String sub_no);

	ArrayList<SubDTO> subDetailsc(String sub_no);

	int subUpdate(HashMap<String, String> params);




	

	

}
