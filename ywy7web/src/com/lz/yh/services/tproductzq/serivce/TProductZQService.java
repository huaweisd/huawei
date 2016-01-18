package com.lz.yh.services.tproductzq.serivce;

import java.util.List;
import java.util.Map;

public interface TProductZQService {
	List<Map<String, Object>> queryZqListByType(Map<String,Object> param);
	List<Map<String, Object>> queryHotArea(Map<String, Object> param);
}
