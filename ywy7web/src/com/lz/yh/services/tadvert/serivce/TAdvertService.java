package com.lz.yh.services.tadvert.serivce;

import java.util.List;
import java.util.Map;

public interface TAdvertService {
	List<Map<String, Object>> queryAdvertByType(Map<String,Object> param);
	
	public List<Map<String, Object>> querytAdvert(Integer tType);

	List<Map<String, Object>> querytAdvert(Map<String, Object> param);
}
