package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gd.main.dto.Client_Dto;
import com.gd.main.dto.SubDTO;

public interface ClientDAO {

//ArrayList<Client_Dto> list_Client();
//
//ArrayList<Client_Dto> client_searh(HashMap<String, Object> data);

Client_Dto detail_Client(int cli_no );

ArrayList<Client_Dto> clientLog(int cli_no);

/*
 * ArrayList<HashMap<String, Object>> list_Client2();
 * 
 * 
 * 
 * ArrayList<Client_Dto> listPageSearch(HashMap<String, Object> data);
 */

//int listsearchCount(HashMap<String, Object> data);


//int allCount();

ArrayList<Client_Dto> ajaxlist(int cnt, int offset);



ArrayList<Client_Dto> ajaxSearch(HashMap<String, Object> data);

int ajaxSearchCnt(HashMap<String, Object> data);

int ajaxDelete(String idx);

int cliReg(@Param("cli_name")String cli_name, @Param("cli_phone")String cli_phone,@Param("cli_req") String cli_req);


int cliUpdate(HashMap<String, Object> map);

ArrayList<Client_Dto> empList();

ArrayList<Client_Dto> empSearch(String empkeyword);

int empUp(HashMap<String, Object> map);

void cliRegCo(String string);



void cliRegCo(HashMap<String, Object> map);

String ajaxSubSearch(Integer idx);


ArrayList<HashMap<String, Object>> regSub();

ArrayList<Integer> cli_no();

Client_Dto cliManager(int cli_no);

int scheRegister(HashMap<String, Object> map);

int checkCnt();

ArrayList<Client_Dto> shcekList(HashMap<String, Object> map);

int checkCnt(HashMap<String, Object> map);

/* ArrayList<Integer> chkEndCnt(); */






}
