package com.gd.main.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class StuDTO {
	private int cli_no;
	private int stu_no;
	private int sub_no;
	private String cli_name;
	private String cli_phone;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date stu_birth;
	private String stu_gender;

	private int stu_age;
	private int emp_no;
	private String emp_name;
	private String stu_condition;
	private String sub_name;
	
	private Date stu_log_date;
	private String stu_log_content;
	
	public Date getStu_log_date() {
		return stu_log_date;
	}
	public void setStu_log_date(Date stu_log_date) {
		this.stu_log_date = stu_log_date;
	}
	public String getStu_log_content() {
		return stu_log_content;
	}
	public void setStu_log_content(String stu_log_content) {
		this.stu_log_content = stu_log_content;
	}
	public String getStu_gender() {
		return stu_gender;
	}
	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
	}
	
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public Date getStu_birth() {
		return stu_birth;
	}
	public void setStu_birth(Date stu_birth) {
		this.stu_birth = stu_birth;
	}
	public int getCli_no() {
		return cli_no;
	}
	public void setCli_no(int cli_no) {
		this.cli_no = cli_no;
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
	public int getStu_age() {
		return stu_age;
	}
	public void setStu_age(int stu_age) {
		this.stu_age = stu_age;
	}
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
	public String getStu_condition() {
		return stu_condition;
	}
	public void setStu_condition(String stu_condition) {
		this.stu_condition = stu_condition;
	}
}
