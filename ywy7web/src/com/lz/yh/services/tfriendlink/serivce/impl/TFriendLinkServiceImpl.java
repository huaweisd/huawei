package com.lz.yh.services.tfriendlink.serivce.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lz.yh.services.tfriendlink.serivce.TFriendLinkService;
import com.lz.yh.system.dao.BaseDao;

@Service("tFriendLinkService")
public class TFriendLinkServiceImpl implements TFriendLinkService{

	@Autowired
	private BaseDao baseDao;
	
	@Override
	public List<Map<String, Object>> querytFriendLink(Map<String, Object> param) {
		return baseDao.queryList(param, "com.lz.yh.services.tfriendlink.mapper.TFriendLinkMapper.querytFriendLink");
	}

}
