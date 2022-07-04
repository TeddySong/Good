package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.AssListDTO;

public interface AssignDAO {
	
	ArrayList<AssListDTO> allCount(HashMap<String, Object> map);
	
	ArrayList<AssListDTO> allCoCount(HashMap<String, Object> map);
	
	ArrayList<AssListDTO> assList(HashMap<String, Object> map);

	ArrayList<AssListDTO> assCoList(HashMap<String, Object> assMap);

	ArrayList<AssListDTO> assStuCoList(String stu_no);
	
	int allCount1(HashMap<String, Object> searchResult);

	int assStuListInsert(HashMap<String, Object> assMap);

	ArrayList<AssListDTO> allPage(HashMap<String, Object> map);

	ArrayList<AssListDTO> assStuListchange(HashMap<String, Object> assMap);

	int coSearchUp(HashMap<String, Object> assMap);

	int coSearchDel(HashMap<String, Object> assMap);

	String nameGet(String stu_no);

	ArrayList<AssListDTO> allCoCountList(HashMap<String, Object> map);

	int allCoStList(HashMap<String, Object> map);

	ArrayList<AssListDTO> courList2(HashMap<String, Object> searchResult);

	int allCountCo(HashMap<String, Object> searchResult);



	

	



	
}
