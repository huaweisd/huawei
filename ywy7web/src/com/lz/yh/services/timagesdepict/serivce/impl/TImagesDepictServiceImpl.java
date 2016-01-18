package com.lz.yh.services.timagesdepict.serivce.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.timagesdepict.serivce.TImagesDepictService;
import com.lz.yh.system.dao.BaseDao;

@Service("TImagesDepictService")
public class TImagesDepictServiceImpl implements TImagesDepictService {

	@Autowired
	BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> queryTImagesDepict(
			Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.timagesdepict.mapper.TImagesDepictMapper.queryTImagesDepict");
		
	}

}
