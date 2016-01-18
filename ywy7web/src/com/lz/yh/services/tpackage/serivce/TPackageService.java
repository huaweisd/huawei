package com.lz.yh.services.tpackage.serivce;

import java.util.List;
import java.util.Map;

public interface TPackageService {
	// 查询礼包表
	public List<Map<String, Object>> queryTPackage(String id, Integer tType, Integer priceType, Integer packageType, Integer priceStatus, String order, Integer perNumber);
	// 查询礼包表总数
	public Integer queryTPackageCount(Integer tType, Integer priceType, Integer packageType, Integer priceStatus);
	// 查询礼包表（分页）
	public List<Map<String, Object>> queryTPackagePage(Integer tType, Integer priceType, Integer packageType, Integer priceStatus, String order, Integer startRecordNum, Integer perNumber);
	// 随机获取一个未领取状态的礼包，同时礼包表更新，礼包码表更新
	public Map<String, Object> queryTPackageCode(String userId, String packageId, Integer perNumber);
	// 根据userid查询礼包码表
	public List<Map<String, Object>> queryTPackageCodeByParam(String userId, String packageId, String order);
	// 随机获取一条领取状态的礼包码作为淘号的结果
	public Map<String, Object> queryTPackageCodeTH(String packageId, Integer perNumber);
	
	public List<Map<String,Object>> queryTconfigByTgroup(String tgroup);
	
	public Map<String,Object> queryLbType();
	
	public List<Map<String, Object>> queryTPackageByName(Map<String,Object> param);
	
	//根据productId查相关游戏礼包
	public List<Map<String, Object>> queryTPackageListByPruductId(Map<String, Object> param);
}
