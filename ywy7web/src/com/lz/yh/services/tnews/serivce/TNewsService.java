package com.lz.yh.services.tnews.serivce;

import java.util.List;
import java.util.Map;

public interface TNewsService {
	List<Map<String, Object>> queryTnews(Map<String,Object> param);
	
	List<Map<String, Object>> queryNews(Integer tType, String order, Integer perNumber);
	
	Map<String, Object> getZxType(String id);
	
	Map<String,Object> queryfirstFouceLimit(Map<String,Object> param);
	
	/**
	 * 查询产业资讯
	 * @param param
	 * @return
	 */
	Map<String,Object> queryCYZXLimit(Map<String,Object> param);

	Integer queryTNewsCount(Integer tType);

	List<Map<String, Object>> queryTNewsPage(Integer tType, String order,
			Integer startRecordNum, Integer perNumber);
}


