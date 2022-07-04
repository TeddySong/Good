package com.gd.main.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Client_Dto {
	// client 
	 private int cli_no ;
	 private String cli_name;
	 private String cli_phone;
	 private String cli_req ;
@JsonFormat(timezone = "Asia/Seoul", pattern = "yyyy-MM-dd HH시mm분" )
	// @DateTimeFormat(pattern = "yyyy년MM월dd일 HH시mm분")
	 private Date cli_qDate;
	 private int emp_no ;      
	 private int sub_no;
	 
	 //cli_log
	  @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH시mm분", timezone = "Asia/Seoul")
	  private Date cli_log_date;
	  private String cli_log_content;
	  private String cli_log_result;
	   @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd  HH시mm분", timezone = "Asia/Seoul")
	  private Date cli_log_Dday;
	  private String cli_log_Dtime;
	
	  
  	//employee

	 private String emp_name;
	 private String emp_phone;
	 private String emp_position;
	 private String  emp_id;
	 private String emp_pw;
	 @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	 private Date emp_startDate;
	 @JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	 private Date emp_endDate;
	 private String emp_condition;
	 
	 // qsub 

	//subject
	
	private String sub_name;
	private String sub_condition;
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
	public String getCli_req() {
		return cli_req;
	}
	public void setCli_req(String cli_req) {
		this.cli_req = cli_req;
	}
	public Date getCli_qDate() {
		return cli_qDate;
	}
	public void setCli_qDate(Date cli_qDate) {
		this.cli_qDate = cli_qDate;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public Date getCli_log_date() {
		return cli_log_date;
	}
	public void setCli_log_date(Date cli_log_date) {
		this.cli_log_date = cli_log_date;
	}
	public String getCli_log_content() {
		return cli_log_content;
	}
	public void setCli_log_content(String cli_log_content) {
		this.cli_log_content = cli_log_content;
	}
	public String getCli_log_result() {
		return cli_log_result;
	}
	public void setCli_log_result(String cli_log_result) {
		this.cli_log_result = cli_log_result;
	}
	public Date getCli_log_Dday() {
		return cli_log_Dday;
	}
	public void setCli_log_Dday(Date cli_log_Dday) {
		this.cli_log_Dday = cli_log_Dday;
	}
	public String getCli_log_Dtime() {
		return cli_log_Dtime;
	}
	public void setCli_log_Dtime(String cli_log_Dtime) {
		this.cli_log_Dtime = cli_log_Dtime;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_phone() {
		return emp_phone;
	}
	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}
	public String getEmp_position() {
		return emp_position;
	}
	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_pw() {
		return emp_pw;
	}
	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
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
	public String getEmp_condition() {
		return emp_condition;
	}
	public void setEmp_condition(String emp_condition) {
		this.emp_condition = emp_condition;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getSub_condition() {
		return sub_condition;
	}
	public void setSub_condition(String sub_condition) {
		this.sub_condition = sub_condition;
	}
	
	
	
}
