package com.lz.yh.services.tproducts.serivce;

import java.util.List;
import java.util.Map;

public interface TProductsService {
	List<Map<String, Object>> queryGamesByType(Map<String,Object> param);
	public List<Map<String, Object>> queryGamesById(Map<String, Object> param);
	
	public List<Map<String, Object>> querySingleRank(Map<String, Object> param);
	List<Map<String, Object>> queryGamesRanks(Map<String, Object> param);
	
	public List<Map<String, Object>> queryProductByName(String keyName);
	public List<Map<String, Object>> queryGameInfoById(Map<String, Object> param);
}
