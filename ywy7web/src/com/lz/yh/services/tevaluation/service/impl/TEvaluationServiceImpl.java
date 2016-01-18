package com.lz.yh.services.tevaluation.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tevaluation.service.TEvaluationService;
import com.lz.yh.system.dao.BaseDao;
import com.lz.yh.system.util.ToolUtil;

@Service("tEvaluationService")
public class TEvaluationServiceImpl implements TEvaluationService {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public Map<String, Object> queryTevaluationByType(Map<String, Object> param) {
		Map<String,Object> result = new HashMap<String,Object>();
		Object totalCount = baseDao.queryObj(param, "com.lz.yh.services.tevaluation.mapper.TEvaluationMapper.queryTevaluationByTypeCount");
		
		result.put("totalCount", totalCount);
		Object totalPage = ToolUtil.calcTotalPage(param.get("perNumber"), totalCount);
		
		result.put("totalPage",totalPage);
		Object startRecordNum = ToolUtil.calcStartRecord(param.get("perNumber"), param.get("page"));
		
		param.put("startRecordNum", startRecordNum.toString());
		result.put("resultList",baseDao.queryList(param, "com.lz.yh.services.tevaluation.mapper.TEvaluationMapper.queryTevaluationByType"));
		return result;
	}

	@Override
	public List<Map<String, Object>> queryEvaluation(Map<String, Object> param) {
		if (null != param.get("id") && ToolUtil.isNoEmpty(param.get("id").toString())) {
			baseDao.updateObj(param, "com.lz.yh.services.tevaluation.mapper.TEvaluationMapper.updateEvaluationClickCount");
		}
		return baseDao.queryList(param, "com.lz.yh.services.tevaluation.mapper.TEvaluationMapper.queryEvaluation");
	}

	@Override
	public Map<String, Object> querySYPCLimitList(Map<String, Object> param) {
		Map<String,Object> result = new HashMap<String,Object>();
		Object totalCount=baseDao.queryObj(param, "com.lz.yh.services.tevaluation.mapper.TEvaluationMapper.queryTevaluationByTypeCount");
		result.put("totalCount", totalCount);
		Object totalPage=ToolUtil.calcTotalPage(param.get("perNumber"), totalCount);
		result.put("totalPage",totalPage);
		Object startRecordNum=ToolUtil.calcStartRecord(param.get("perNumber"), param.get("page"));
		param.put("startRecordNum", startRecordNum.toString());
		result.put("resultList",baseDao.queryList(param, "com.lz.yh.services.tevaluation.mapper.TEvaluationMapper.queryTevaluationByType"));
		return result;
	}

}
