package com.gd.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.gd.main.dto.Client_Dto;

public interface ClientDAO {

ArrayList<Client_Dto> list_Client();

ArrayList<Client_Dto> client_searh(HashMap<String, Object> data);

Client_Dto detail_Client(int cli_no );

ArrayList<Client_Dto> clientLog(int cli_no);

ArrayList<HashMap<String, Object>> list_Client2();



ArrayList<Client_Dto> listPageSearch(HashMap<String, Object> data);

int listsearchCount(HashMap<String, Object> data);


int allCount();

ArrayList<Client_Dto> ajaxlist(int cnt, int offset);



ArrayList<Client_Dto> ajaxSearch(HashMap<String, Object> data);

int ajaxSearchCnt(HashMap<String, Object> data);

int ajaxDelete(String idx);







}
