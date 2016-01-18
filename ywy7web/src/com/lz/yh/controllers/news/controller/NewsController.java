package com.lz.yh.controllers.news.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bsh.commands.dir;

import com.lz.yh.services.tevaluation.service.TEvaluationService;
import com.lz.yh.services.timages.serivce.TImagesService;
import com.lz.yh.services.timagesdepict.serivce.TImagesDepictService;
import com.lz.yh.services.tnews.serivce.TNewsService;
import com.lz.yh.services.tpackage.serivce.TPackageService;
import com.lz.yh.services.tproductzq.serivce.TProductZQService;
import com.lz.yh.services.traiders.serivce.TRaidersService;
import com.lz.yh.services.tvideos.serivce.TVideosService;
import com.lz.yh.system.bean.PageResult;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;

@Controller
@RequestMapping("news")
public class NewsController {
	@Autowired
	private  TNewsService tNewsService;
	@Autowired
	private TImagesService tImagesService;
	@Autowired
	private TRaidersService tRaidersService;
	@Autowired
	private TEvaluationService tEvaluationService;
	@Autowired
	private TPackageService tPackageService;
	@Autowired
	private TProductZQService tProductZQService;
	@Autowired
	private TImagesDepictService tImagesDepictService;
	
	@Autowired
	private TVideosService tVideosService;
	private static final Logger log = Logger.getLogger(NewsController.class);
	
	@RequestMapping(value="news")
	public String index (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "zx");
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
		return "/webviews/news/index.jsp";
	}
	
	@RequestMapping(value="sypc")
	public String sypc(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "zx");
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
		return "/webviews/news/sypc.jsp";
	}
	@RequestMapping(value="ynzx")
	public String ynzx(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "zx");
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
		return "/webviews/news/news_content.jsp";
	}
	@RequestMapping(value="rwzf")
	public String rwzf(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "zx");
		model.addAttribute("nav_on", 3);
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
		return "/webviews/news/news_content.jsp";
	}
	
	@RequestMapping(value="pssh")
	public String pssh(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "zx");
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
		return "/webviews/news/pssh.jsp";
	}
	
	@RequestMapping(value="psshxq/{tTypeId}")
	public String psshxq(Model model, HttpServletRequest request, @PathVariable("tTypeId") String tTypeId) throws ParseException {
		model.addAttribute("nav", "zx");
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
		
		model.addAttribute("tTypeId", tTypeId);
		return "/webviews/news/psshxq.jsp";
	}
	
	@RequestMapping(value="{newsId}")
	public String zx_info(@PathVariable String newsId, Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "zx");
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
		model.addAttribute("newsId", newsId);
		return "/webviews/news/info.jsp";
	}
	
	@RequestMapping(value="content/{newsId}")
	public String news_content(@PathVariable String newsId, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", newsId);
		param.put("perNumber", 1);
		model.addAttribute("news", tNewsService.queryTnews(param).get(0));
		return "/webviews/news/content.jsp";
	}
	
	/**
	 * 查询图文
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getNewsImages")
	@ResponseBody
	public PageResult getNewsImages(String perNumber, String tType) {
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
	 * 查询（评测）图文
	 * @param perNumber
	 * @param tType
	 * @return
	 */
	@RequestMapping(value="getEvaluationImages")
	@ResponseBody
	public PageResult getEvaluationImages(String perNumber, String tType) {
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
	 * 查询资讯分页
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getGamesNewsPage")
	@ResponseBody
	public Map<String, Object> getGamesNewsPage( String tType,String perNumber,String page) {
		Map<String,Object> result = new HashMap<String,Object>();
		Map<String, Object> param=new HashMap<String,Object>();
		param.put("page", page);
		param.put("perNumber", Integer.parseInt(perNumber));
		param.put("tType", tType);
		param.put("sortField", "CREATE_TIME");
		param.put("sortOrder", "desc");
		param.put("startRecordNum", "0");
		result = tNewsService.queryfirstFouceLimit(param);
		return result;
	}
	
	
	/**
	 * 查询新闻表（分页）
	 * @param tType
	 * @param order
	 * @param perNumber
	 */
	@RequestMapping(value="/queryTNewsPage", method=RequestMethod.POST)
	@ResponseBody
	public PageResult queryTNewsPage(String tType, String order, String page, String perNumber) {
		PageResult result = new PageResult();
		tType = ToolUtil.isNoEmpty(tType) ? tType : "0";
		order = ToolUtil.isNoEmpty(order) ? order : null;
		page = ToolUtil.isNoEmpty(page) ? page : "1";
		perNumber = ToolUtil.isNoEmpty(perNumber) ? perNumber : "0";
		result.setPageIndex(Integer.parseInt(page));
		result.setPageSize(Integer.parseInt(perNumber));
		Integer totalCount = tNewsService.queryTNewsCount(Integer.parseInt(tType));
		result.setTotalCount(totalCount);
		result.setPageCount(totalCount % Integer.parseInt(perNumber) == 0 ? totalCount / Integer.parseInt(perNumber) : totalCount / Integer.parseInt(perNumber) + 1);
		result.setResultList(tNewsService.queryTNewsPage(Integer.parseInt(tType), order, (result.getPageIndex() - 1) * result.getPageSize(), Integer.parseInt(perNumber)));
		return result;
	}
	/**
	 * 查询游戏资讯
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getGamesNews")
	@ResponseBody
	public PageResult getGamesNews(String tType,String perNumber) {
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
		resultList = tNewsService.queryTnews(param);
		result.setResultList(resultList);
		return result;
	}
	/**
	 * 查询游戏资讯
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getHotNews")
	@ResponseBody
	public PageResult getHotNews(String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", perNumber);
		}
		param.put("order", OrderType.getName("CLICK_COUNT"));
		resultList = tNewsService.queryTnews(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 手游评测
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getMobileGameTest")
	@ResponseBody
	public PageResult getMobileGameTest(String tType,String perNumber) {
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
		resultList = tEvaluationService.queryEvaluation(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 热门评测
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getHotTest")
	@ResponseBody
	public PageResult getHotTest(String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("CLICK_COUNT"));
		resultList = tEvaluationService.queryEvaluation(param);
		result.setResultList(resultList);
		return result;
	}
	
	
	
	/**
	 * 评测分页
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getEvaluationPage")
	@ResponseBody
	public Map<String, Object> getEvaluationPage(String perNumber,String page) {
		Map<String,Object> result = new HashMap<String,Object>();
		Map<String, Object> param=new HashMap<String,Object>();
		param.put("page", page);
		param.put("perNumber", Integer.parseInt(perNumber));
		param.put("order", OrderType.getName("CREATE_TIME"));
		param.put("startRecordNum", "0");
		result = tEvaluationService.querySYPCLimitList(param);
		return result;
	}
	/**
	 * 热门攻略
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getHotRaiders")
	@ResponseBody
	public PageResult getHotRaiders(String tType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		resultList = tRaidersService.queryTRAIDERS(param);
		result.setResultList(resultList);
		return result;
	}
	
	/**
	 * 最新礼包
	 * @param param
	 * @param perNumber
	 * @return
	 */
	@RequestMapping(value="getNewPackage")
	@ResponseBody
	public PageResult getNewPackage(String tType,String perNumber,String startRecordNum) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		resultList = tPackageService.queryTPackagePage(Integer.parseInt(tType), null, null, null, null, Integer.parseInt(startRecordNum), Integer.parseInt(perNumber));
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
	public PageResult getHotRegion(String zqType,String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(zqType)) {
			param.put("zqType", zqType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		resultList = tProductZQService.queryHotArea(param);
		result.setResultList(resultList);
		return result;
	}

	
	@RequestMapping(value="getPssh")
	@ResponseBody
	public Object getPssh(Integer tType,String id){
		Map<String,Object > param = new HashMap<String, Object>();
		if(tType != null){
			param.put("tType",tType);
		}
		if(id != null){
			param.put("id",id);
		}
		return tImagesService.querytImages(param);
	}
	
	@RequestMapping(value="getPsshxq")
	@ResponseBody
	public Object getPsshxq(Model model, String tTypeId){
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("tTypeId", tTypeId);
		return tImagesDepictService.queryTImagesDepict(param);
	}
}
