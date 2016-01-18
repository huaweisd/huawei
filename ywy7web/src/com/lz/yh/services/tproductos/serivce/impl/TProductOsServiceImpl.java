package com.lz.yh.services.tproductos.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tproductos.serivce.TProductOsService;
import com.lz.yh.system.dao.BaseDao;

@Service("tProductOsService")
public class TProductOsServiceImpl implements TProductOsService {

	@Autowired
	private BaseDao baseDao;
	@Override
	public List<Map<String, Object>> queryGames(Integer gameType,
			Integer osType, Integer priceType, Integer languageType) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (gameType != null && gameType != 0) {
			map.put("procductsType", gameType);
		}
		if (osType != null && osType != 0) {
			map.put("osType", osType);
		}
		if (priceType != null && priceType != 0) {
			map.put("tPrice", priceType);
		}
		if (languageType != null && languageType != 0) {
			map.put("tLanguage", languageType);
		}
		return baseDao.queryList(map, "com.lz.yh.services.tproductos.mapper.TProductOsMapper.queryGames");
	}
	@Override
	public List<Map<String, Object>> queryGamesPage(Integer gameType,
			Integer osType, Integer priceType, Integer languageType,
			String order, Integer startRecordNum, Integer perNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (gameType != null && gameType != 0) {
			map.put("procductsType", gameType);
		}
		if (osType != null && osType != 0) {
			map.put("osType", osType);
		}
		if (priceType != null && priceType != 0) {
			map.put("tPrice", priceType);
		}
		if (languageType != null && languageType != 0) {
			map.put("tLanguage", languageType);
		}
		if (order != null && !"".equals(order)) {
			map.put("order", order);
		}
		if (startRecordNum != null) {
			map.put("startRecordNum", startRecordNum);
		}
		if (perNumber != null && perNumber != 0) {
			map.put("perNumber", perNumber);
		}
		return baseDao.queryList(map, "com.lz.yh.services.tproductos.mapper.TProductOsMapper.queryGamesPage");
	}
	@Override
	public Integer queryGamesCount(Integer gameType, Integer osType, Integer priceType, Integer languageType) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> result = baseDao.queryList(map, "com.lz.yh.services.tproductos.mapper.TProductOsMapper.queryGamesCount").get(0);
		return Integer.parseInt(result.get("count").toString());
	}

}
