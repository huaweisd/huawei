package com.lz.yh.controllers.rank.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bsh.commands.dir;

import com.lz.yh.services.tadvert.serivce.TAdvertService;
import com.lz.yh.services.tproducts.serivce.TProductsService;
import com.lz.yh.system.bean.PageResult;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;

@Controller
@RequestMapping("rank")
public class RankController {
	
	@Autowired
	private TProductsService tProductsService;
	@Autowired
	private TAdvertService tAdvertService;
	
	private static final Logger log = Logger.getLogger(RankController.class);
	@RequestMapping(value="rank")
	public String index (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "index");
		model.addAttribute("nav_on", 5);
		if (null != request.getAttribute("isLogin") && (Boolean) request.getAttribute("isLogin")) {
			model.addAttribute("loginState", 1);
			@SuppressWarnings("unchecked")
			Map<String, Object> user = (Map<String, Object>) request.getSession().getAttribute("user");
			request.setAttribute("userName", user.get("loginName") == null ? "" : user.get("loginName").toString());
			request.setAttribute("userImg", user.get("timg") == null ? "webviews/common/img/icon_head.jpg" : user.get("timg").toString());
			request.setAttribute("userMoney", user.get("ncoin") == null ? "0" : user.get("ncoin").toString());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Integer i = ToolUtil.compareDate(df.parse(user.get("lastQdTime").toString()).getTime());
			if (i == 0) {
				model.addAttribute("isSign", 1);
			}
		}
		return "/webviews/rank/index.jsp";
	}
	
	
	
	/**
	 * 近七天Top5
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getRankTopFive")
	@ResponseBody
	public PageResult getRankTopFive(String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
			if (ToolUtil.isNoEmpty(perNumber)) {
				param.put("perNumber", perNumber);
			}
		param.put("order", OrderType.getName("CLICK_COUNT"));	
		resultList = tProductsService.queryGamesRanks(param);
		result.setResultList(resultList);
		return result;
	}
	
	
	/**
	 * 查询广告
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getAdverPic")
	@ResponseBody
	public PageResult getAdverPic(String perNumber, String tType) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
			if (ToolUtil.isNoEmpty(perNumber)) {
				param.put("perNumber", Integer.parseInt(perNumber));
			}
			if (ToolUtil.isNoEmpty(tType)) {
				param.put("tType", tType);
			}
		//param.put("order", OrderType.getName("START_TIME"));
		resultList = tAdvertService.queryAdvertByType(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 查询排行榜
	 * @param perNumber
	 * @param tGroup
	 * @param gameState
	 * @param order
	 * @return
	 */
	@RequestMapping(value="getRanks")
	@ResponseBody
	public PageResult getRanks(String perNumber, String tGroup,String gameState,String order) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(tGroup)) {
			param.put("tGroup", tGroup);
		}
		if (ToolUtil.isNoEmpty(gameState)) {
			param.put("gameState", gameState);
		}
		param.put("order", OrderType.getName("CLICK_COUNT"));
		if (ToolUtil.isNoEmpty(order)) {
			if ("1".equals(order)) {
				param.put("order", OrderType.getName("START_TIME"));
			}
		}
		resultList = tProductsService.querySingleRank(param);
		result.setResultList(resultList);
		return result;
	}
	
	
	
}
