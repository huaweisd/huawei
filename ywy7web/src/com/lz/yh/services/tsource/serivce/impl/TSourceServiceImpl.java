package com.lz.yh.services.tsource.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tsource.serivce.TSourceService;
import com.lz.yh.system.dao.BaseDao;

@Service("tSourceService")
public class TSourceServiceImpl implements TSourceService{

	@Autowired
	private BaseDao baseDao;
	@Override
	public List<Map<String, Object>> queryTSOURCE(String gameName) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (gameName != null && !"".equals(gameName)) {
			map.put("gameName", gameName);
		}
		return baseDao.queryList(map, "com.lz.yh.services.tsource.mapper.queryTSOURCE");
	}

}
