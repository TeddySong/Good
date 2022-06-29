package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import com.gd.main.dto.EmployeeDTO;
public interface EmployeeDAO {
	
	

	ArrayList<EmployeeDTO> empLogList(int emp_no);
	
	int allCount();

	ArrayList<EmployeeDTO> list(int cnt, int offset);

	String empOverlay(String chkName);

	int empRegister(HashMap<String, Object> params);
	
	EmployeeDTO selectEmpMyInfo(int emp_no);

	int empUpdate(HashMap<String, String> params);

	String empName(int emp_no);



	
	
}
