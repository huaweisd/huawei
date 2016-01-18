package com.lz.yh.controllers.region.controller;

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

import com.lz.yh.services.tevaluation.service.TEvaluationService;
import com.lz.yh.services.tpackage.serivce.TPackageService;
import com.lz.yh.services.tproductzq.serivce.TProductZQService;
import com.lz.yh.system.bean.PageResult;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;

@Controller
@RequestMapping("region")
public class RegionController {
	@Autowired
	private TProductZQService tProductZQService;
	@Autowired
	private TEvaluationService tEvaluationService;
	@Autowired
	private TPackageService tPackageService;
	
	
	private static final Logger log = Logger.getLogger(RegionController.class);
	
	@RequestMapping(value="region")
	public String index (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "index");
		model.addAttribute("nav_on", 6);
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
		return "/webviews/region/index.jsp";
	}
	
	
	
	
	
	
	/**
	 * 专区查询
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getRegion")
	@ResponseBody
	public PageResult getRegion(String perNumber, String zqType) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(zqType)) {
			param.put("zqType", zqType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", perNumber);
		}
		resultList = tProductZQService.queryHotArea(param);
		result.setResultList(resultList);
		return result;
	}
	/**
	 * 评测查询
	 * @param tType
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getEvaluation")
	@ResponseBody
	public PageResult getEvaluation(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", perNumber);
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		resultList = tEvaluationService.queryEvaluation(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 礼包查询
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getPackage")
	@ResponseBody
	public PageResult getPackage(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		resultList = tPackageService.queryTPackagePage(Integer.parseInt(tType), null, null, null, null, null, Integer.parseInt(perNumber));
		result.setResultList(resultList);
		return result;
	}
	
	
}
