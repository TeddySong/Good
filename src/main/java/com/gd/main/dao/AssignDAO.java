package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.AssListDTO;

public interface AssignDAO {

	ArrayList<AssListDTO> assList(int cnt, int offset);

	ArrayList<AssListDTO> assList(HashMap<String, Object> assMap);

	AssListDTO assCoList(String co_name);




	
}
