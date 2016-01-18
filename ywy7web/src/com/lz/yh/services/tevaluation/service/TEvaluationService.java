package com.lz.yh.services.tevaluation.service;

import java.util.List;
import java.util.Map;

public interface TEvaluationService {
	Map<String, Object> queryTevaluationByType(Map<String, Object> param);
	
	public List<Map<String, Object>> queryEvaluation(Map<String, Object> param);
	
	public Map<String, Object> querySYPCLimitList(Map<String, Object> param);
}
