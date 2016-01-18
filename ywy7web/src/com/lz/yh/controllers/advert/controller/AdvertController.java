package com.lz.yh.controllers.advert.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lz.yh.controllers.BaseControl;
import com.lz.yh.services.tadvert.serivce.TAdvertService;
import com.lz.yh.system.bean.PageResult;
import com.lz.yh.system.enumeration.IndexType;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;

@Controller
@RequestMapping("advert")
public class AdvertController extends BaseControl {
	@Autowired
	private  TAdvertService tAdvertService;
	
	@RequestMapping(value="advertA")
	public String advertA (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("ad", "advertA");
		model.addAttribute("ad_on", 0);
		return "/webviews/common/advertA.jsp";
	}
	
	
	
	/**
	 * 查询图片
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getAdverts")
	@ResponseBody
	public PageResult getAdverts( String tindex,String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", Integer.parseInt(tType));
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("into",IndexType.getName(tindex));
		param.put("order", OrderType.getName("T_INDEX"));
		resultList = tAdvertService.queryAdvertByType(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 查询背景图
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getBlAdverts")
	@ResponseBody
	public PageResult getBlAdverts( String tindex,String tType) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", Integer.parseInt(tType));
		}
		if (ToolUtil.isNoEmpty(tindex)) {
			param.put("tindex", Integer.parseInt(tindex));
		}
		resultList = tAdvertService.querytAdvert(param);
		result.setResultList(resultList);
		return result;
	}
	
}
