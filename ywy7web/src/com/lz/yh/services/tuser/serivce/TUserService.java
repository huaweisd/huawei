package com.lz.yh.services.tuser.serivce;

import java.util.List;
import java.util.Map;

public interface TUserService {
	
	public List<Map<String, Object>> queryTUser(Map<String, Object> param);
	
	public List<Map<String, Object>> queryTUserByRegister(Map<String, Object> param);
	
	/**
	 * 登录之后更新用户表最后登录时间和连续登录天数
	 */
	public void updateTUser(Map<String, Object> param);
	
	/**
	 * 注册新用户
	 */
	public void registerTUser(Map<String, Object> param);
	
}
