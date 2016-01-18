package com.lz.yh.controllers.newGame.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lz.yh.controllers.BaseControl;
import com.lz.yh.system.bean.PageResult;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;


@Controller
@RequestMapping("newGame")
public class NewGameController extends BaseControl {
	private static final Logger log = Logger.getLogger(NewGameController.class);
	
	@RequestMapping(value="newGame")
	public String newGame (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "xy");
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
		return "/webviews/newGame/index.jsp";
	}
	
	@RequestMapping(value="zyx")
	public String zyx(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "xy");
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
		return "/webviews/newGame/zyx.jsp";
	}
	@RequestMapping(value="kfkc")
	public String kfkc(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "xy");
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
		return "/webviews/newGame/kfkc.jsp";
	}
	
	@RequestMapping(value="xypc")
	public String xypc(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "xy");
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
	 * 查询图文
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getNewGameImages")
	@ResponseBody
	public PageResult getNewGameImages(String perNumber, String tType) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		resultList = tImagesService.querytImages(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 热门专区
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getHotRegion")
	@ResponseBody
	public PageResult getHotRegion(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		resultList = tProductZQService.queryHotArea(param);
		result.setResultList(resultList);
		return result;
	}
	/**
	 * 开服游戏
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getOpenServerGame")
	@ResponseBody
	public PageResult getOpenServerGame(String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("isNow", 1);
		param.put("order", OrderType.getName("TPO_OPEN_TIME"));
		resultList = tProductOpenService.queryProductOpenTable(param);
		Map<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("kfCount", tProductOpenService.queryKFKCCount(1));
		countMap.put("kcCount", tProductOpenService.queryKFKCCount(2));
		result.setResultMap(countMap);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 查询游戏分页
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getGamePage")
	@ResponseBody
	public PageResult getGamePage(String gameType, String osType, String priceType, String languageType, String order, String perNumber, String page) {
		PageResult result = new PageResult();

		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		if (!ToolUtil.isNoEmpty(page) || !ToolUtil.isNoEmpty(perNumber)) {
			result.setState(false);
			return result;
		}

		gameType = ToolUtil.isNoEmpty(gameType) ? gameType : "0";
		osType = ToolUtil.isNoEmpty(osType) ? osType : "0";
		priceType = ToolUtil.isNoEmpty(priceType) ? priceType : "0";
		languageType = ToolUtil.isNoEmpty(languageType) ? languageType : "0";
		order = ToolUtil.isNoEmpty(order) ? order : null;
		
		result.setPageSize(Integer.parseInt(perNumber));
		result.setPageIndex(Integer.parseInt(page));
		result.setTotalCount(tProductOsService.queryGamesCount(Integer.parseInt(gameType), Integer.parseInt(osType), Integer.parseInt(priceType), Integer.parseInt(languageType)));
		result.setPageCount(PageResult.calcTotalPage(result.getPageSize(), result.getTotalCount()));
		
		Integer startRecordNum = (result.getPageIndex() - 1) * result.getPageSize();
		list = tProductOsService.queryGamesPage(Integer.parseInt(gameType), Integer.parseInt(osType), Integer.parseInt(priceType), Integer.parseInt(languageType), order, startRecordNum, Integer.parseInt(perNumber));
		
		result.setResultList(list);
		return result;
	}
	
	/**
	 * 热门评测
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getGameTest")
	@ResponseBody
	public PageResult getGameTest(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("PRIORITY,CREATE_TIME"));
		resultList = tEvaluationService.queryEvaluation(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 热门礼包
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getHotPackage")
	@ResponseBody
	public PageResult getHotPackage(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("T_COUNT"));
		resultList = tPackageService.queryTPackage(null, Integer.parseInt(tType), null, null, null, null, Integer.parseInt(perNumber));
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 热门资讯
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getHotNews")
	@ResponseBody
	public PageResult getHotNews(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("CLICK_COUNT"));
		resultList = tPackageService.queryTPackage(null, Integer.parseInt(tType), null, null, null, null, Integer.parseInt(perNumber));
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 开服表
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getGameOpenServer")
	@ResponseBody
	public PageResult getGameOpenServer(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("TP_START_TIME"));
		resultList = tProductOpenService.queryProductOpenTable(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 开测表
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getGameOpenTest")
	@ResponseBody
	public PageResult getGameOpenTest(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("TP_START_TIME"));
		resultList = tProductTestService.queryProductTestTable(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 游戏单机表
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getGamesByGroup")
	@ResponseBody
	public PageResult getGamesByGroup(String tGroup,String perNumber,String startRecordNum) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tGroup)) {
			param.put("tGroup", tGroup);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(startRecordNum)) {
			param.put("startRecordNum", startRecordNum);
		}
		resultList = tProductsService.queryGamesByType(param);
		result.setResultList(resultList);
		return result;
	}
}
