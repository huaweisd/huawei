package com.lz.yh.services.tnews.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tnews.serivce.TNewsService;
import com.lz.yh.system.dao.BaseDao;
import com.lz.yh.system.util.ToolUtil;

@Service("tNewsService")
public class TNewsServiceImpl implements TNewsService {

	@Autowired
	private BaseDao baseDao;
	@Override
	public List<Map<String, Object>> queryTnews(Map<String, Object> param) {
		if(param.get("id") != null && !"".equals(param.get("id"))){
			baseDao.updateObj(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.updateTnewClickCount");
		}
		return baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryTnews");
	}
	@Override
	public List<Map<String, Object>> queryNews(Integer tType, String order,
			Integer perNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tType != null && tType != 0) {
			map.put("tType", tType);
		}
		if (order != null && !"".equals(order)) {
			map.put("order", order);
		}
		if (perNumber != null && perNumber != 0) {
			map.put("perNumber", perNumber);
		}
		return baseDao.queryList(map, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryNews");
	}
	
	@Override
	public Integer queryTNewsCount(Integer tType) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tType != null && tType != 0) {
			map.put("tType", tType);
		}
		return Integer.parseInt(baseDao.queryList(map, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryTNewsCount").get(0).get("count").toString());
	}
	@Override
	public List<Map<String, Object>> queryTNewsPage(Integer tType, String order, Integer startRecordNum, Integer perNumber) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tType != null && tType != 0) {
			map.put("tType", tType);
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
		return baseDao.queryList(map, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryTNewsPage");
	}
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getZxType(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (id != null && !"".equals(id)) {
			map.put("id", id);
		}
		return (Map<String, Object>) baseDao.queryObj(map, "com.lz.yh.services.tnews.mapper.TNewsMapper.getZxType");
	}
	@Override
	public Map<String, Object> queryfirstFouceLimit(Map<String, Object> param) {
		Map<String,Object> result = new HashMap<String,Object>();
		Object totalCount=baseDao.queryObj(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.querytotalCount");
		result.put("totalCount", totalCount);
		Object startRecordNum=ToolUtil.calcStartRecord(param.get("perNumber"), param.get("page"));
		param.put("startRecordNum", startRecordNum.toString());
		result.put("resultList",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryfirstFouceLimit"));
		return result;
	}
	@Override
	public Map<String, Object> queryCYZXLimit(Map<String, Object> param) {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("result",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		//悦玩看点
		param.put("ttype", 10);
		result.put("type_10",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		//悦玩光点
		param.put("ttype", 11);
		result.put("type_11",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		//产业资讯
		param.put("ttype", 2);
		result.put("type_2",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		//业界人物
		param.put("ttype", 12);
		result.put("type_12",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		//人物专访
		param.put("ttype", 13);
		result.put("type_13",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		
		//资本风向
		param.put("ttype", 14);
		param.put("sortField", "CREATE_TIME");
		param.put("sortOrder", "DESC");
		result.put("type_14",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		param.put("ttype", 15);
		result.put("type_15",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		param.put("ttype", 16);
		result.put("type_16",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		param.put("ttype", 17);
		result.put("type_17",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		param.put("ttype", 19);
		result.put("type_19",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		param.put("ttype", 20);
		result.put("type_20",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		param.put("ttype", 21);
		result.put("type_21",baseDao.queryList(param, "com.lz.yh.services.tnews.mapper.TNewsMapper.queryCYZXLimit"));
		
		return result;
	}

}
