package com.gd.main.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CourseDTO {

	private int co_no;
	private String co_name;
	private String sub_name;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date co_startDate;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date co_endDate;
	private String co_condition;
	private String co_startTime;
	private String co_endTime;
	private int co_capacity;
	private int sub_no;
	private String sub_condition;
	private String sub_time;
	private String sub_summary;
	private int curri_no;
	private String curri_oriName;
	private String curri_newName;
	private int src_no;
	private String scr_content;
	
	public int getSrc_no() {
		return src_no;
	}
	public void setSrc_no(int src_no) {
		this.src_no = src_no;
	}
	public String getScr_content() {
		return scr_content;
	}
	public void setScr_content(String scr_content) {
		this.scr_content = scr_content;
	}
	public int getCurri_no() {
		return curri_no;
	}
	public void setCurri_no(int curri_no) {
		this.curri_no = curri_no;
	}
	public String getCurri_oriName() {
		return curri_oriName;
	}
	public void setCurri_oriName(String curri_oriName) {
		this.curri_oriName = curri_oriName;
	}
	public String getCurri_newName() {
		return curri_newName;
	}
	public void setCurri_newName(String curri_newName) {
		this.curri_newName = curri_newName;
	}
	public String getSub_time() {
		return sub_time;
	}
	public void setSub_time(String sub_time) {
		this.sub_time = sub_time;
	}
	public String getSub_summary() {
		return sub_summary;
	}
	public void setSub_summary(String sub_summary) {
		this.sub_summary = sub_summary;
	}
	private int subimg_no;
	private String subimg_oriName;
	private String subimg_newName;
	
	public int getSubimg_no() {
		return subimg_no;
	}
	public void setSubimg_no(int subimg_no) {
		this.subimg_no = subimg_no;
	}
	public String getSubimg_oriName() {
		return subimg_oriName;
	}
	public void setSubimg_oriName(String subimg_oriName) {
		this.subimg_oriName = subimg_oriName;
	}
	public String getSubimg_newName() {
		return subimg_newName;
	}
	public void setSubimg_newName(String subimg_newName) {
		this.subimg_newName = subimg_newName;
	}
	public String getSub_condition() {
		return sub_condition;
	}
	public void setSub_condition(String sub_condition) {
		this.sub_condition = sub_condition;
	}
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public Date getCo_startDate() {
		return co_startDate;
	}
	public void setCo_startDate(Date co_startDate) {
		this.co_startDate = co_startDate;
	}
	public Date getCo_endDate() {
		return co_endDate;
	}
	public void setCo_endDate(Date co_endDate) {
		this.co_endDate = co_endDate;
	}
	public String getCo_condition() {
		return co_condition;
	}
	public void setCo_condition(String co_condition) {
		this.co_condition = co_condition;
	}
	public String getCo_startTime() {
		return co_startTime;
	}
	public void setCo_startTime(String co_startTime) {
		this.co_startTime = co_startTime;
	}
	public String getCo_endTime() {
		return co_endTime;
	}
	public void setCo_endTime(String co_endTime) {
		this.co_endTime = co_endTime;
	}
	public int getCo_capacity() {
		return co_capacity;
	}
	public void setCo_capacity(int co_capacity) {
		this.co_capacity = co_capacity;
	}
	public int getSub_no() {
		return sub_no;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	
	
}
