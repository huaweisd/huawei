package com.lz.yh.services.tproductopen.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tproductopen.serivce.TProductOpenService;
import com.lz.yh.system.dao.BaseDao;

@Service("tProductOpenService")
public class TProductOpenServiceImpl implements TProductOpenService {

	@Autowired
	private BaseDao baseDao;
	@Override
	public List<Map<String, Object>> queryProductOpenTable(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tproductopen.mapper.TProductOpenMapper.queryProductOpenTable");
	}
	
	public Integer queryKFKCCount(Integer type){
		Map<String, Object> map = new HashMap<String, Object>();
		if (type == 1) {
			return Integer.parseInt(baseDao.queryList(map, "com.lz.yh.services.tproductopen.mapper.TProductOpenMapper.queryTodayOpenServerCount").get(0).get("count").toString());
		}else{
			return Integer.parseInt(baseDao.queryList(map, "com.lz.yh.services.tproductopen.mapper.TProductOpenMapper.queryTodayOpenTestCount").get(0).get("count").toString());
		}
	}

}
