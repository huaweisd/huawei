package com.lz.yh.services.tpackage.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tpackage.serivce.TPackageService;
import com.lz.yh.system.dao.BaseDao;
import com.lz.yh.system.util.ToolUtil;

@Service("tPackageService")
public class TPackageServiceImpl implements TPackageService {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> queryTPackage(String id, Integer tType, Integer priceType, Integer packageType, Integer priceStatus, String order, Integer perNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (id != null && !"".equals(id)) {
			map.put("id", id);
		}
		if (tType != null && tType != 0) {
			map.put("tType", tType);
		}
		if (priceType != null && priceType != 0) {
			map.put("priceType", priceType);
		}
		if (packageType != null && packageType != 0) {
			map.put("packageType", packageType);
		}
		if (priceStatus != null && priceStatus != 0) {
			map.put("priceStatus", priceStatus);
		}
		if (order != null && !"".equals(order)) {
			map.put("order", order);
		}
		if (perNumber != null && perNumber != 0) {
			map.put("perNumber", perNumber);
		}
		map.put("startRecordNum", 0);
		return baseDao.queryList(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackage");
	}

	@Override
	public Integer queryTPackageCount(Integer tType, Integer priceType, Integer packageType, Integer priceStatus) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tType != null && tType != 0) {
			map.put("tType", tType);
		}
		if (priceType != null && priceType != 0) {
			map.put("priceType", priceType);
		}
		if (packageType != null && packageType != 0) {
			map.put("packageType", packageType);
		}
		if (priceStatus != null && priceStatus != 0) {
			map.put("priceStatus", priceStatus);
		}
		return Integer.parseInt(baseDao.queryList(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackageCount").get(0).get("count").toString());
	}

	@Override
	public List<Map<String, Object>> queryTPackagePage(Integer tType, Integer priceType, Integer packageType, Integer priceStatus, String order, Integer startRecordNum, Integer perNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tType != null && tType != 0) {
			map.put("tType", tType);
		}
		if (priceType != null && priceType != 0) {
			map.put("priceType", priceType);
		}
		if (packageType != null && packageType != 0) {
			map.put("packageType", packageType);
		}
		if (priceStatus != null && priceStatus != 0) {
			map.put("priceStatus", priceStatus);
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
		return baseDao.queryList(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackage");
	}

	private boolean updateTPackageScount(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (id != null && !"".equals(id)) {
			map.put("id", id);
		}
		String str = baseDao.updateObj(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.updateTPackageScount").toString();
		if (ToolUtil.isNoEmpty(str) || !"0".equals(str)) {
			return true;
		} else {
			return false;
		}
	}
	
	private boolean updateTPackageCode(String userId, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userId != null && !"".equals(userId)) {
			map.put("userId", userId);
		}
		if (id != null && !"".equals(id)) {
			map.put("id", id);
		}
		String str = baseDao.updateObj(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.updateTPackageCode").toString();
		if (!"0".equals(str)) {
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> queryTPackageCode(String userId, String packageId, Integer perNumber) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		if (packageId != null && !"".equals(packageId)) {
			map.put("packageId", packageId);
		}
		if (perNumber != null && perNumber != 0) {
			map.put("perNumber", perNumber);
		}
		do {
			result = (Map<String, Object>) baseDao.queryObj(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackageCode");
			if (null == result) {
				return result;
			}
		} while (!updateTPackageCode(userId, result.get("id").toString()));
		updateTPackageScount(packageId);
		return result;
	}

	@Override
	public List<Map<String, Object>> queryTPackageCodeByParam(String userId, String packageId, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(userId)) {
			map.put("userId", userId);
		}
		if (ToolUtil.isNoEmpty(packageId)) {
			map.put("packageId", packageId);
		}
		if (ToolUtil.isNoEmpty(order)) {
			map.put("order", order);
		}
		return baseDao.queryList(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackageCodeByParam");
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> queryTPackageCodeTH(String packageId, Integer perNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(packageId)) {
			map.put("packageId", packageId);
		}
		if (perNumber != null && perNumber != 0) {
			map.put("perNumber", perNumber);
		}
		return (Map<String, Object>) baseDao.queryObj(map, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackageCodeTH");
	}

	@Override
	public List<Map<String, Object>> queryTconfigByTgroup(String tgroup) {
		Map<String,Object> param = new HashMap<String,Object>();
		if(tgroup != null && !"".equals(tgroup)){
			param.put("tgroup", tgroup);
		}
		return baseDao.queryList(param, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTconfigByTgroup");
	}

	@Override
	public  Map<String, Object> queryLbType() {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("PRICE_TYPE", this.queryTconfigByTgroup("EXCHANGE_TYPE"));
		result.put("PRICE_STATUS", this.queryTconfigByTgroup("SPECIAL_OFFER"));
		result.put("PACKAGE_TYPE", this.queryTconfigByTgroup("PACKAGE_TYPE"));
		return result;
	}

	@Override
	public List<Map<String, Object>> queryTPackageByName(Map<String,Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackage");
	}

	@Override
	public List<Map<String, Object>> queryTPackageListByPruductId(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tpackage.mapper.TPackageMapper.queryTPackageListByPruductId");
	}
}
