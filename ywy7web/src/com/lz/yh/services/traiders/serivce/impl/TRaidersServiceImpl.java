package com.lz.yh.services.traiders.serivce.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.traiders.serivce.TRaidersService;
import com.lz.yh.system.dao.BaseDao;
import com.lz.yh.system.util.ToolUtil;

@Service("tRaidersService")
public class TRaidersServiceImpl implements TRaidersService {
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public Map<String, Object> queryTopRaidersLimit(Map<String, Object> param) {
		if(param.get("id") != null && !"".equals(param.get("id"))){
			baseDao.updateObj(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.updateRaidersClickCount");
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("result",baseDao.queryList(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryTopRaidersLimit"));
		//查询小编推荐
		param.remove("tType");
		param.put("ttype", 4);
		result.put("type_4",baseDao.queryList(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryTopRaidersLimit"));
		param.put("ttype", 5);
		result.put("type_5",baseDao.queryList(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryTopRaidersLimit"));
		return result;
	}

	@Override
	public Map<String, Object> queryRaidersByType(Map<String, Object> param) {
		Map<String,Object> result = new HashMap<String,Object>();
		Object totalCount = baseDao.queryObj(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryRaidersByTypeCount");
		result.put("totalCount", totalCount);
		Object totalPage = ToolUtil.calcTotalPage(param.get("perNumber"), totalCount);
		result.put("totalPage",totalPage);
		
		Object startRecordNum = ToolUtil.calcStartRecord(param.get("perNumber"), param.get("page"));
		param.put("startRecordNum", startRecordNum.toString());
		result.put("resultList",baseDao.queryList(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryRaidersByType"));
		return result;
	}

	@Override
	public List<Map<String, Object>> queryTRAIDERS(Map<String, Object> param) {
		if (null != param.get("id") && ToolUtil.isNoEmpty(param.get("id").toString())) {
			baseDao.updateObj(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.updateTraidersClickCount");
		}
		return baseDao.queryList(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryTRAIDERS");
	}

	@Override
	public Integer queryTraidersPageCount(String tType) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (null != tType) {
			param.put("tType", Integer.parseInt(tType));
		}
		List<Map<String, Object>> list = baseDao.queryList(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryTraidersPageCount");
		return Integer.parseInt(list.get(0).get("count").toString());
	}

	@Override
	public List<Map<String, Object>> queryTraidersPage(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.traiders.mapper.TRaidersMapper.queryTraidersPage");
	}
	
}
