package com.lz.yh.services.tvideos.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tvideos.serivce.TVideosService;
import com.lz.yh.system.dao.BaseDao;

@Service("tVideosService")
public class TVideosServiceImpl implements TVideosService{
	@Autowired
	private BaseDao baseDao;

	@Override
	public List<Map<String, Object>> queryGameVideos(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tvideos.mapper.TVideosMapper.queryGameVideos");
	}
	
	@Override
	public Integer queryVideoCount(Integer tType) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tType != null && tType != 0) {
			map.put("tType", tType);
		}
		return Integer.parseInt(baseDao.queryList(map, "com.lz.yh.services.tvideos.mapper.TVideosMapper.queryVideoCount").get(0).get("count").toString());
	}
	
	@Override
	public List<Map<String, Object>> queryVideosPage(Integer tType, String order, Integer startRecordNum, Integer perNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tType != null && tType != 0) {
			map.put("tType", tType);
		}
		if (order != null && !"".equals(order)) {
			map.put("order", order);
		}
		if (startRecordNum != null) {
			map.put("startRecordNum", startRecordNum);
		}
		if (perNumber != null && perNumber != 0) {
			map.put("perNumber", perNumber);
		}
		return baseDao.queryList(map, "com.lz.yh.services.tvideos.mapper.TVideosMapper.queryVideosPage");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> queryVideoInfoById(Map<String, Object> param) {
		baseDao.updateObj(param, "com.lz.yh.services.tvideos.mapper.TVideosMapper.updateTVideosClickCount");
		return (Map<String, Object>) baseDao.queryObj(param, "com.lz.yh.services.tvideos.mapper.TVideosMapper.queryGameVideos");
	}
	
}
