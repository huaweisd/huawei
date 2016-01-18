package com.lz.yh.services.tproductos.serivce;

import java.util.List;
import java.util.Map;

public interface TProductOsService {
	public List<Map<String, Object>> queryGames(Integer gameType, Integer osType, Integer priceType, Integer languageType);

	public List<Map<String, Object>> queryGamesPage(Integer gameType, Integer osType, Integer priceType, Integer languageType, String order, Integer startRecordNum, Integer perNumber);
	
	public Integer queryGamesCount(Integer gameType, Integer osType, Integer priceType, Integer languageType);
}
