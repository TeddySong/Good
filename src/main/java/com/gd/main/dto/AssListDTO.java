package com.gd.main.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AssListDTO {

	private String sub_name;
	private String co_name;
	private String co_startTime;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date co_startDate;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date co_endDate;
	private String cli_name;
	private String cli_phone;
	private String emp_name;
	private String co_condition;
	private int co_no;
	private String co_capacity;
	private int countName;

	
	public int getCountName() {
		return countName;
	}
	public void setCountName(int countName) {
		this.countName = countName;
	}
	public String getCo_capacity() {
		return co_capacity;
	}
	public void setCo_capacity(String co_capacity) {
		this.co_capacity = co_capacity;
	}
	//배정 과정상세보기 필요 컬럼
	private String ass_condition;
	private int stu_no;
	
	public int getCo_no() {
		return co_no;
	}
	public Date getCo_endDate() {
		return co_endDate;
	}
	public void setCo_endDate(Date co_endDate) {
		this.co_endDate = co_endDate;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	
	
	public String getAss_condition() {
		return ass_condition;
	}
	public void setAss_condition(String ass_condition) {
		this.ass_condition = ass_condition;
	}
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getCo_startTime() {
		return co_startTime;
	}
	public void setCo_startTime(String co_startTime) {
		this.co_startTime = co_startTime;
	}
	public Date getCo_startDate() {
		return co_startDate;
	}
	public void setCo_startDate(Date co_startDate) {
		this.co_startDate = co_startDate;
	}
	public String getCli_name() {
		return cli_name;
	}
	public void setCli_name(String cli_name) {
		this.cli_name = cli_name;
	}
	public String getCli_phone() {
		return cli_phone;
	}
	public void setCli_phone(String cli_phone) {
		this.cli_phone = cli_phone;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getCo_condition() {
		return co_condition;
	}
	public void setCo_condition(String co_condition) {
		this.co_condition = co_condition;
	}

	
	
}
