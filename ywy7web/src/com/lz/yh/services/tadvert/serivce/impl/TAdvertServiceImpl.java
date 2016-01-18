package com.lz.yh.services.tadvert.serivce.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tadvert.serivce.TAdvertService;
import com.lz.yh.system.dao.BaseDao;

@Service("tAdvertService")
public class TAdvertServiceImpl implements TAdvertService{
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> queryAdvertByType(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tadvert.mapper.TAdvertMapper.querytAdvert");
	}

	@Override
	public List<Map<String, Object>> querytAdvert(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tadvert.mapper.TAdvertMapper.querytBlAdvert");
	}

	@Override
	public List<Map<String, Object>> querytAdvert(Integer tType) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
