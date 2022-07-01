package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.AssListDTO;

public interface AssignDAO {

	ArrayList<AssListDTO> assList(int cnt, int offset);

	ArrayList<AssListDTO> assList(HashMap<String, Object> assMap);

	ArrayList<AssListDTO> assCoList(HashMap<String, String> params);

	ArrayList<AssListDTO> assStuCoList(HashMap<String, Object> assMap);
	
	int allCount(HashMap<String, Object> searchResult);

	ArrayList<AssListDTO> courList2(HashMap<String, Object> searchResult);


	
}
