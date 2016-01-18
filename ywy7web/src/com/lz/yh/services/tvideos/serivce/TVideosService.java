package com.lz.yh.services.tvideos.serivce;

import java.util.List;
import java.util.Map;

public interface TVideosService {
	public List<Map<String, Object>> queryGameVideos(Map<String, Object> param);
	public Integer queryVideoCount(Integer tType);
	public List<Map<String, Object>> queryVideosPage(Integer tType, String order, Integer startRecordNum, Integer perNumber);
	public Map<String, Object> queryVideoInfoById(Map<String, Object> param);
}
