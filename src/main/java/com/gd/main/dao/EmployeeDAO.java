package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gd.main.dto.EmployeeDTO;

public interface EmployeeDAO {

<<<<<<< HEAD
	ArrayList<EmployeeDTO> empLogList(int emp_no);
	
=======
	ArrayList<EmployeeDTO> emplogList(int emp_no);

	EmployeeDTO selectEmpMyInfo(int emp_no);

>>>>>>> origin/master
	int allCount();

	ArrayList<EmployeeDTO> list(int cnt, int offset);

	String empOverlay(String chkName);

<<<<<<< HEAD
	int empRegister(HashMap<String, Object> params);
	
	EmployeeDTO selectEmpMyInfo(int emp_no);

	int empUpdate(HashMap<String, String> params);

	String empName(int emp_no);
	
	//직원일지 추가하기
	int empLogRegister(HashMap<String, String> params);
	


	
	
=======
	int empWrite(HashMap<String, Object> params);

	int empUpdate(HashMap<String, String> params);

>>>>>>> origin/master
}
