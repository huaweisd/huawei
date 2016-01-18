package com.lz.yh.services.tconfig.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tconfig.serivce.TConfigService;
import com.lz.yh.system.dao.BaseDao;

@Service("tConfigService")
public class TConfigServiceImpl implements TConfigService {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> querySearch() {
		Map<String, Object> map = new HashMap<String, Object>();
		return baseDao.queryList(map, "com.lz.yh.services.tconfig.mapper.TConfigMapper.querySearch");
	}

	@Override
	public List<Map<String, Object>> queryTconfigByTgroup(String tgroup) {
		Map<String,Object> param = new HashMap<String,Object>();
		if(tgroup != null && !"".equals(tgroup)){
			param.put("tgroup", tgroup);
		}
		return baseDao.queryList(param, "com.lz.yh.services.tconfig.mapper.TConfigMapper.queryTconfigByTgroup");
	}

}
