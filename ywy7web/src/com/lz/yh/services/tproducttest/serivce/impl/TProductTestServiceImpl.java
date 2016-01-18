package com.lz.yh.services.tproducttest.serivce.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tproducttest.serivce.TProductTestService;
import com.lz.yh.system.dao.BaseDao;

@Service("tProductTestService")
public class TProductTestServiceImpl implements TProductTestService {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> queryProductTestTable(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tproducttest.mapper.TProductTestMapper.queryProductTestTable");
	}

}
