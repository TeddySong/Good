package com.gd.main.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;




public class EmployeeDTO{
	/* 사번,직원명,id,연락처,직급,입사일,퇴사일,재직상태*/
	private int emp_no;
	private String emp_name;
	private String emp_id;
	private String emp_phone;
	private String emp_condition;
	private String emp_position;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date emp_startDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date emp_endDate;
	

	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}
	public String getEmp_condition() {
		return emp_condition;
	}
	public void setEmp_condition(String emp_condition) {
		this.emp_condition = emp_condition;
	}
	public String getEmp_position() {
		return emp_position;
	}
	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}
	public Date getEmp_startDate() {
		return emp_startDate;
	}
	public void setEmp_startDate(Date emp_startDate) {
		this.emp_startDate = emp_startDate;
	}
	public Date getEmp_endDate() {
		return emp_endDate;
	}
	public void setEmp_endDate(Date emp_endDate) {
		this.emp_endDate = emp_endDate;
	}

}
	

	


	
	

