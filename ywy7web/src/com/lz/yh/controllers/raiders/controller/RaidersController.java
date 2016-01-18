package com.lz.yh.controllers.raiders.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lz.yh.controllers.BaseControl;
import com.lz.yh.system.bean.PageResult;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;


@Controller
@RequestMapping("raiders")
public class RaidersController extends BaseControl {
	private static final Logger log = Logger.getLogger(RaidersController.class);
	
	@RequestMapping(value="raiders")
	public String index (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "gl");
		model.addAttribute("nav_on", 0);
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
		return "/webviews/raiders/index.jsp";
	}
	
	@RequestMapping(value="{raiderId}")
	public String zx_info(@PathVariable String raiderId, Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "gl");
		model.addAttribute("nav_on", 0);
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
		model.addAttribute("raiderId", raiderId);
		return "/webviews/raiders/info.jsp";
	}
	
	@RequestMapping(value="content/{raiderId}")
	public String gl_content(@PathVariable String raiderId, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", raiderId);
		param.put("perNumber", 1);
		model.addAttribute("raider", tRaidersService.queryTRAIDERS(param).get(0));
		return "/webviews/raiders/content.jsp";
	}
	
	@RequestMapping(value="twgl")
	public String twgl(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "gl");
		model.addAttribute("nav_on", 1);
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
		return "/webviews/raiders/raider_content.jsp";
	}
	@RequestMapping(value="spgl")
	public String spgl(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "gl");
		model.addAttribute("nav_on", 2);
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
		return "/webviews/raiders/raider_content.jsp";
	}
	@RequestMapping(value="yxzq")
	public String yxzq(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "zq");
		model.addAttribute("nav_on", 0);
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
	
	@RequestMapping(value="xypc")
	public String xypc(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "ql");
		model.addAttribute("nav_on", 4);
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
		return "/webviews/newGame/xypc.jsp";
	}
	
	
	
	/**
	 * 攻略信息
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getRaiders")
	@ResponseBody
	public PageResult getRaiders(String tType,String perNumber, String order) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		if (ToolUtil.isNoEmpty(order)) {
			if ("1".equals(order)) {
				param.put("order", OrderType.getName("CLICK_COUNT"));
			}
		}
		resultList = tRaidersService.queryTRAIDERS(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 周阅读榜单
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getRaidersByTime")
	@ResponseBody
	public PageResult getRaidersByTime(String tType,String perNumber,String startCreateTimeStr,String endCreateTimeStr) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(startCreateTimeStr)) {
			param.put("startCreateTimeStr", startCreateTimeStr);
		}
		
		param.put("order", OrderType.getName("CLICK_COUNT"));
		resultList = tRaidersService.queryTRAIDERS(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 攻略信息分页
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getRaidersPage")
	@ResponseBody
	public PageResult getRaidersPage(String tType,String perNumber,String page) {
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if (!ToolUtil.isNoEmpty(page) || !ToolUtil.isNoEmpty(perNumber)) {
			result.setState(false);
			return result;
		}

		result.setPageSize(Integer.parseInt(perNumber));
		result.setPageIndex(Integer.parseInt(page));
		result.setTotalCount(tRaidersService.queryTraidersPageCount(tType));
		result.setPageCount(PageResult.calcTotalPage(result.getPageSize(), result.getTotalCount()));
		
		Integer startRecordNum = (result.getPageIndex() - 1) * result.getPageSize();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		param.put("startRecordNum", startRecordNum);
		param.put("perNumber", Integer.parseInt(perNumber));
		list = tRaidersService.queryTraidersPage(param);
		result.setResultList(list);
		
		return result;
	}
	
	
	
}
