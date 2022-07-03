package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.AssListDTO;

public interface AssignDAO {
	
	ArrayList<AssListDTO> allCount(HashMap<String, Object> map);
	
	ArrayList<AssListDTO> assList(HashMap<String, Object> map);

	ArrayList<AssListDTO> assCoList(HashMap<String, Object> assMap);

	ArrayList<AssListDTO> assStuCoList(HashMap<String, Object> assMap);
	
	int allCount1(HashMap<String, Object> searchResult);

	ArrayList<AssListDTO> courList2(HashMap<String, Object> searchResult);

	int assStuListInsert(HashMap<String, Object> assMap);

	ArrayList<AssListDTO> allPage(HashMap<String, Object> map);

	

	



	
}
