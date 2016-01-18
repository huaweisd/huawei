package com.lz.yh.services.timages.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.timages.serivce.TImagesService;
import com.lz.yh.system.dao.BaseDao;

@Service("tImagesService")
public class TImagesServiceImpl implements TImagesService{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> queryGlTopImg() {
		return baseDao.queryList(null, "com.lz.yh.services.timages.mapper.TImagesMapper.queryGlTopImg");
	}

	@Override
	public List<Map<String, Object>> querytImages(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.timages.mapper.TImagesMapper.querytImages");
	}

	@Override
	public List<Map<String, Object>> queryXyTopImg() {
		return baseDao.queryList(null, "com.lz.yh.services.timages.mapper.TImagesMapper.queryXyTopImg");
	}

	@Override
	public List<Map<String, Object>> queryZxTopImg() {
		return baseDao.queryList(null, "com.lz.yh.services.timages.mapper.TImagesMapper.queryZxTopImg");
	}

}
