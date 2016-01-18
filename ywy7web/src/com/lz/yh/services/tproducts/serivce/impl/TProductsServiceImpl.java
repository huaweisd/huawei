package com.lz.yh.services.tproducts.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tproducts.serivce.TProductsService;
import com.lz.yh.system.dao.BaseDao;
import com.lz.yh.system.util.ToolUtil;

@Service("tProductsService")
public class TProductsServiceImpl implements TProductsService {

	@Autowired
	private BaseDao baseDao;
	@Override
	public List<Map<String, Object>> queryGamesByType(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tproducts.mapper.TProductsMapper.queryGamesByType");
	}
	@Override
	public List<Map<String, Object>> queryGamesById(Map<String, Object> param) {
		if (ToolUtil.isNoEmpty(param.get("id").toString())) {
			baseDao.updateObj(param, "com.lz.yh.services.tproducts.mapper.TProductsMapper.updateGameClickCount");
		}
		return baseDao.queryList(param, "com.lz.yh.services.tproducts.mapper.TProductsMapper.queryGamesByType");
	}
	
	@Override
	public List<Map<String, Object>> queryGameInfoById(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tproducts.mapper.TProductsMapper.queryGamesById");
	}
	@Override
	public List<Map<String, Object>> querySingleRank(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tproducts.mapper.TProductsMapper.querySingleRank");
	}
	@Override
	public List<Map<String, Object>> queryGamesRanks(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tproducts.mapper.TProductsMapper.queryGamesRanks");
	}
	@Override
	public List<Map<String, Object>> queryProductByName(String keyName) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("keyName", keyName);
		return baseDao.queryList(param, "com.lz.yh.services.tproducts.mapper.TProductsMapper.queryPruductByGameName");
	}
}
