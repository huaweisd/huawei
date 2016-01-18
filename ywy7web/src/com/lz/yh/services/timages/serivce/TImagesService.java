package com.lz.yh.services.timages.serivce;

import java.util.List;
import java.util.Map;

public interface TImagesService {
	List<Map<String,Object>> queryGlTopImg();
	
	// 图片
	public List<Map<String, Object>> querytImages(Map<String, Object> param);

	List<Map<String,Object>> queryXyTopImg();
	
	List<Map<String,Object>> queryZxTopImg();
}
