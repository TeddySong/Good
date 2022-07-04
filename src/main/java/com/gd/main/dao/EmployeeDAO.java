package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import com.gd.main.dto.EmployeeDTO;

public interface EmployeeDAO {

	//직원일지 리스트
 ArrayList<EmployeeDTO> empLogList(String emp_no); 
	
	 ArrayList<EmployeeDTO> empList(HashMap<String, Object> map); 

	ArrayList<EmployeeDTO> allCount(HashMap<String, Object> map);
		
	/* int allCount(); */

	/* ArrayList<EmployeeDTO> list(int cnt, int offset); */

	String empOverlay(String chkName);

	EmployeeDTO selectEmpMyInfo(int emp_no);


	String empName(String emp_no);
	
	//직원일지 추가하기
	int empLogRegister(HashMap<String, String> params);
	

	int empWrite(HashMap<String, Object> params);

	int empUpdate(HashMap<String, String> params);


	int empRegister(HashMap<String, Object> params);

	String getWriterNo(String loginId);

	String getWriterName(String loginId);






	



}
