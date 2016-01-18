package com.lz.yh.services.tuser.serivce.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tuser.serivce.TUserService;
import com.lz.yh.system.dao.BaseDao;

@Service("tUserService")
public class TUserServiceImpl implements TUserService {

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> queryTUser(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tuser.mapper.TUserMapper.queryTUser");
	}
	
	@Override
	public List<Map<String, Object>> queryTUserByRegister(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tuser.mapper.TUserMapper.queryTUserByRegister");
	}

	/**
	 * type:
	 * 		1.最后登录时间更新，连续登录天数+1
	 * 		2.最后登录时间更新，连续登录天数置1
	 * 		3.连续签到天数+1，金币+1
	 * 		4.连续签到天数置1
	 */
	@Override
	public void updateTUser(Map<String, Object> param) {
		baseDao.updateObj(param, "com.lz.yh.services.tuser.mapper.TUserMapper.updateTUser");
	}

	@Override
	public void registerTUser(Map<String, Object> param) {
		baseDao.addObj(param, "com.lz.yh.services.tuser.mapper.TUserMapper.insterTUser");
	}

}
