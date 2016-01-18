package com.lz.yh.services.traiders.serivce;

import java.util.List;
import java.util.Map;

public interface TRaidersService {
	Map<String,Object> queryTopRaidersLimit(Map<String,Object> param);
	
	Map<String,Object> queryRaidersByType(Map<String,Object> param);
	
	// 查询对应游戏攻略
	public List<Map<String, Object>> queryTRAIDERS(Map<String, Object> param);
	
	public Integer queryTraidersPageCount(String tType);
	
	public List<Map<String, Object>> queryTraidersPage(Map<String, Object> param);
}
