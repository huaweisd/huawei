package com.lz.yh.services.tproductopen.serivce;

import java.util.List;
import java.util.Map;

public interface TProductOpenService {
	List<Map<String,Object>> queryProductOpenTable(Map<String,Object> param);
	
	public Integer queryKFKCCount(Integer type);
}
