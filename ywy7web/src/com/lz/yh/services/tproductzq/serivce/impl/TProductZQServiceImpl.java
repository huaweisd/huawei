package com.lz.yh.services.tproductzq.serivce.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tproductzq.serivce.TProductZQService;
import com.lz.yh.system.dao.BaseDao;

@Service("tProductZQService")
public class TProductZQServiceImpl implements TProductZQService {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> queryZqListByType(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tproductzq.mapper.TProductZQMapper.queryZqListByType");
	}
	
	@Override
	public List<Map<String, Object>> queryHotArea(Map<String, Object> param){
		return baseDao.queryList(param, "com.lz.yh.services.tproductzq.mapper.TProductZQMapper.queryHotArea");
	}
}
