package com.gd.main.dao;

import java.util.ArrayList;

import com.gd.main.dto.StuDTO;

public interface StudentDAO {

	ArrayList<StuDTO> list(int cnt, int offset);

	int allCount();

}
