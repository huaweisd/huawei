package com.lz.yh.controllers.video.controller;

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

/**
 * 
 * @author huawei
 * @data 2015/11/19
 *
 */
@Controller
@RequestMapping("video")
public class VideoController extends BaseControl {
	
	private static final Logger log = Logger.getLogger(VideoController.class);
	
	@RequestMapping(value="video")
	public String video (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "sp");
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
		return "/webviews/video/index.jsp";
	}
	
	@RequestMapping(value="swpc")
	public String swpc (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "sp");
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
		return "/webviews/video/video_content.jsp";
	}
	
	@RequestMapping(value="yxsp")
	public String yxsp (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "sp");
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
		return "/webviews/video/video_content.jsp";
	}
	
	@RequestMapping(value="xyfb")
	public String xyfb (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "sp");
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
		return "/webviews/video/video_content.jsp";
	}
	
	@RequestMapping(value="{videoId}")
	public String zx_info(@PathVariable String videoId, Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "sp");
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
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", videoId);
		param.put("perNumber", 1);
		Map<String, Object> video = tVideosService.queryVideoInfoById(param);
		model.addAttribute("videoTitle", video.get("title"));
		model.addAttribute("videoSpUrl", video.get("tlink"));
		return "/webviews/video/info.jsp";
	}
	
	@RequestMapping(value="getVideoImages")
	@ResponseBody
	public PageResult getVideoImages(String perNumber, String tType) {
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
	
	@RequestMapping(value="getVideoVideos")
	@ResponseBody
	public PageResult getVideoVideos(String perNumber, String tType){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		list = tVideosService.queryGameVideos(param);
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getVideoVideosPage")
	@ResponseBody
	public PageResult getVideoVideosPage(String perNumber, String tType, String page){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if (!ToolUtil.isNoEmpty(tType) || !ToolUtil.isNoEmpty(page) || !ToolUtil.isNoEmpty(perNumber)) {
			result.setState(false);
			return result;
		}

		result.setPageSize(Integer.parseInt(perNumber));
		result.setPageIndex(Integer.parseInt(page));
		result.setTotalCount(tVideosService.queryVideoCount(Integer.parseInt(tType)));
		result.setPageCount(PageResult.calcTotalPage(result.getPageSize(), result.getTotalCount()));
		
		Integer startRecordNum = (result.getPageIndex() - 1) * result.getPageSize();
		list = tVideosService.queryVideosPage(Integer.parseInt(tType), OrderType.getName("CLICK_COUNT"), startRecordNum, Integer.parseInt(perNumber));
		
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getVideoNews")
	@ResponseBody
	public PageResult getVideoNews(String perNumber, String tType, String id, String gameName) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(id)) {
			param.put("id", id);
		}
		if (ToolUtil.isNoEmpty(gameName)) {
			param.put("gameName", gameName);
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		resultList = tNewsService.queryTnews(param);
		result.setResultList(resultList);
		return result;
	}
	
	@RequestMapping(value="getVideoEvaluation")
	@ResponseBody
	public PageResult getVideoEvaluation(String perNumber, String tType) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		resultList = tEvaluationService.queryEvaluation(param);
		result.setResultList(resultList);
		return result;
	}
	
	@RequestMapping(value="getVideoRaiders")
	@ResponseBody
	public PageResult getVideoRaiders(String perNumber, String tType, String gameName){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(gameName)) {
			param.put("gameName", gameName);
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		list = tRaidersService.queryTRAIDERS(param);
		result.setResultList(list);
		return result;
	}
	
}
