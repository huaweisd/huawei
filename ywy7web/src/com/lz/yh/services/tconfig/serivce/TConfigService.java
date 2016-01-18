package com.lz.yh.services.tconfig.serivce;

import java.util.List;
import java.util.Map;

public interface TConfigService {
	public List<Map<String, Object>> querySearch();
	
	public List<Map<String,Object>> queryTconfigByTgroup(String tgroup);
}
