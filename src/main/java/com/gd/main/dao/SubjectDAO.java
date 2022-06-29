package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

import com.gd.main.dto.SubDTO;

public interface SubjectDAO {

	ArrayList<SubDTO> subList();

	String subOverlay(String subname);

	int subRegister(SubDTO dto);


	void subHome(String subtime, String subsum, int subno);

	ArrayList<SubDTO> scriptlist(int cnt, int offset);

	SubDTO subDetail(String sub_no);

	ArrayList<SubDTO> subDetailsc(String sub_no);

	int subUpdate(HashMap<String, String> params);

	void fileWrite(String oriFileName, String newFileName, int subno);

	ArrayList<SubDTO> subCurriDetail(String sub_no);

	void fileUpdate(String oriFileName, String newFileName, int subno);

	int scrDel(String scr_no);

	int allCount();

	int allCount(HashMap<String, Object> params);

	ArrayList<SubDTO> scrSublist();

	int scrReg(HashMap<String, String> params);

	ArrayList<SubDTO> scrSubSearch(String sub_no, int cnt, int offset);

	ArrayList<SubDTO> scSubCondition(String subCo, int cnt, int offset);

	ArrayList<SubDTO> subCondition(String subCo);

	ArrayList<SubDTO> sublistSearch(String subSe);

	void subImgWrite(String oriFileName, String newFileName, int subno);

	ArrayList<SubDTO> subImgDetail(String sub_no);

	void subImgUpdate(String oriFileName, String newFileName, int subno);






	

	

}
