package com.gd.main.dao;

public interface HomeDAO {

	String empLogin(String emp_id, String emp_pw);

	String empLoginName(String emp_id);

	int empNo(String emp_id);

}
