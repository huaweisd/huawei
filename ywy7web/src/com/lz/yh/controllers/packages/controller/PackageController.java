package com.lz.yh.controllers.packages.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
 * @data 2015/11/24
 *
 */
@Controller
@RequestMapping("package")
public class PackageController extends BaseControl {
	
	private static final Logger log = Logger.getLogger(PackageController.class);
	
	@RequestMapping(value="package")
	public String packageIndex(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "lb");
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
		return "/webviews/package/index.jsp";
	}
	
	@RequestMapping(value="rmlb")
	public String rmlb(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "lb");
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
		return "/webviews/package/package_content.jsp";
	}
	
	@RequestMapping(value="tjlb")
	public String tjlb(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "lb");
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
		return "/webviews/package/package_content.jsp";
	}
	
	@RequestMapping(value="djlb")
	public String djlb(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "lb");
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
		return "/webviews/package/package_content.jsp";
	}
	
	@RequestMapping(value="wdlb")
	public String wdlb(Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "lb");
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
			model.addAttribute("userName", user.get("loginName") == null ? "" : user.get("loginName").toString());
			model.addAttribute("userImage", user.get("timg") == null ? "webviews/common/img/errorHead.png" : user.get("timg").toString());
			model.addAttribute("userMoney", user.get("ncoin") == null ? "0" : user.get("ncoin").toString());
			if (i == 0) {
				model.addAttribute("isSign", 1);
			}
			// 根据userid查package_code
			String userId = request.getSession().getAttribute("userId").toString();
			List<Map<String, Object>> list = tPackageService.queryTPackageCodeByParam(userId, null, OrderType.getName("GET_TIME"));
			if (list.size() != 0) {
				model.addAttribute("packageListLength", list.size());
				model.addAttribute("packageList", list);
			}
			
		}else{
			model.addAttribute("userImg","webviews/common/img/icon_head.jpg");
		}
		return "/webviews/package/package_wdlb.jsp";
	}
	
	@RequestMapping(value="{packageId}")
	public String lb_info(@PathVariable String packageId, Model model, HttpServletRequest request) throws ParseException{
		model.addAttribute("nav", "lb");
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
		
		Map<String, Object> lbmap = tPackageService.queryTPackage(packageId, null, null, null, null, null, 1).get(0);
		model.addAttribute("packages", lbmap);
		model.addAttribute("keyName", lbmap.get("gameName").toString());
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.add(Calendar.DAY_OF_MONTH, -6);
		c2.setTime(sf.parse(lbmap.get("createTimeStr").toString()));
		if (sf.parse(sf.format(c1.getTime())).compareTo(c2.getTime()) > 0 && Integer.parseInt(lbmap.get("scount").toString()) >= Integer.parseInt(lbmap.get("tcount").toString()) / 2) {
			model.addAttribute("isshow", true);
		} else {
			HttpSession session = request.getSession();
			String userId = session.getAttribute("userId") != null ? session.getAttribute("userId").toString() : null;
			if (ToolUtil.isNoEmpty(userId)) {
				List<Map<String, Object>> list = tPackageService.queryTPackageCodeByParam(userId, packageId, null);
				if (list != null && list.size() > 0) {
					model.addAttribute("isshow", true);
				} else {
					model.addAttribute("isshow", false);
				}
			} else {
				model.addAttribute("isshow", false);
			}
		}
		
		return "/webviews/package/info.jsp";
	}
	
	@RequestMapping(value="{productId}_1")
	public String lb_list_info(@PathVariable String productId, Model model, HttpServletRequest request) throws ParseException{
		model.addAttribute("nav", "lb");
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
		if (ToolUtil.isNoEmpty(productId)) {
			param.put("productId", productId);
		}
		param.put("order", OrderType.getName("CLICKCOUNT_DESC"));
		List<Map<String, Object>> list = tPackageService.queryTPackageListByPruductId(param);
		if (null == list || list.size() == 0) {
			model.addAttribute("packageList", list);
			return "/webviews/package/list_info.jsp";
		}
		model.addAttribute("packageList", list);
		model.addAttribute("keyName", list.get(0).get("gameName").toString());
		
		return "/webviews/package/list_info.jsp";
	}
	
	@RequestMapping(value="getPackageXGLB")
	@ResponseBody
	public PageResult getPackageXGLB(String perNumber, String keyName) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(keyName)) {
			param.put("keyName", keyName);
		}
		param.put("order", OrderType.getName("CREATE_TIME"));
		param.put("startRecordNum", 0);
		resultList = tPackageService.queryTPackageByName(param);
		result.setResultList(resultList);
		return result;
	}
	
	@RequestMapping(value="getPackageImages")
	@ResponseBody
	public PageResult getPackageImages(String perNumber, String tType) {
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
	
	@RequestMapping(value="getPackageTProducts")
	@ResponseBody
	public PageResult getPackageTProducts(String keyName) {
		PageResult result = new PageResult();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(keyName)) {
			param.put("keyName", keyName);
		}else{
			result.setState(false);
			return result;
		}
		resultList = tProductsService.queryProductByName(keyName);
		if (null == resultList || resultList.size() == 0) {
			result.setState(false);
			return result;
		}
		result.setObj(resultList.get(0));
		return result;
	}
	
	@RequestMapping(value="getPackageInfo")
	@ResponseBody
	public PageResult getPackageInfo(String perNumber, String tType, String order) {
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
		if (ToolUtil.isNoEmpty(order)) {
			if ("1".equals(order)) {
				param.put("order", OrderType.getName("S_COUNT"));
			}
		}
		param.put("startRecordNum", 0);
		resultList = tPackageService.queryTPackageByName(param);
		result.setResultList(resultList);
		return result;
	}
	
	@RequestMapping(value="queryPackagePage")
	@ResponseBody
	public PageResult queryPackagePage(String tType, String priceType, String packageType, String priceStatus, String page, String perNumber) {
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if (!ToolUtil.isNoEmpty(tType) || !ToolUtil.isNoEmpty(priceType) || !ToolUtil.isNoEmpty(packageType) || !ToolUtil.isNoEmpty(priceStatus) || !ToolUtil.isNoEmpty(page) || !ToolUtil.isNoEmpty(perNumber)) {
			result.setState(false);
			return result;
		}
		result.setPageSize(Integer.parseInt(perNumber));
		result.setPageIndex(Integer.parseInt(page));
		result.setTotalCount(tPackageService.queryTPackageCount(Integer.parseInt(tType), Integer.parseInt(priceType), Integer.parseInt(packageType), Integer.parseInt(priceStatus)));
		result.setPageCount(PageResult.calcTotalPage(result.getPageSize(), result.getTotalCount()));
		
		Integer startRecordNum = (result.getPageIndex() - 1) * result.getPageSize();
		list = tPackageService.queryTPackagePage(Integer.parseInt(tType), Integer.parseInt(priceType), Integer.parseInt(packageType), Integer.parseInt(priceStatus), OrderType.getName("S_COUNT"), startRecordNum, Integer.parseInt(perNumber));
		
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getPackageCode")
	@ResponseBody
	public PageResult getPackageCode(String packageId, HttpServletRequest request, HttpSession session) {
		PageResult result = new PageResult();
		if (!ToolUtil.isNoEmpty(packageId)) {
			result.setState(false);
			result.setCode(100010);
			result.setMsg("未知异常，请联系网站人员解决！");
			return result;
		}
		Object uId = session.getAttribute("userId");
		if (null != uId) {// 是否登录
			String userId = uId.toString();
			List<Map<String, Object>> list = tPackageService.queryTPackageCodeByParam(userId, packageId, null);
			if (null == list || list.size() == 0) {// 该用户是否已经领取过该礼包
				Map<String, Object> packageCode = tPackageService.queryTPackageCode(userId, packageId, 1);
				if (null == packageCode) {// 礼包是否已经发完了，搜不到有效数据
					result.setState(false);
					result.setCode(100003);
					result.setMsg("亲，礼包可能已经发完了，试试淘号系统吧！");
				}else{
					result.setObj(packageCode);
				}
			}else{
				result.setState(false);
				result.setCode(100002);
				result.setMsg("亲，您已经领取过该礼包了，不要贪心(⊙o⊙)哦！您可以在我的礼包里面查看您的礼包码");
			}
		}else{
			result.setState(false);
			result.setCode(100001);
		}
		return result;
	}
	
	@RequestMapping(value="getTaohaoCode")
	@ResponseBody
	public PageResult getTaohaoCode(String packageId, HttpServletRequest request, HttpSession session) {
		PageResult result = new PageResult();
		if (!ToolUtil.isNoEmpty(packageId)) {
			result.setState(false);
			result.setCode(100010);
			result.setMsg("未知异常，请联系网站人员解决！");
			return result;
		}
		Object uId = session.getAttribute("userId");
		if (null != uId) {// 是否登录
			Map<String, Object> packageCodeTH = tPackageService.queryTPackageCodeTH(packageId, 1);
			if (null == packageCodeTH) {// 没有淘到号
				result.setState(false);
				result.setCode(100004);
				result.setMsg("未知异常，请联系网站人员解决！");
				return result;
			}
			result.setObj(packageCodeTH);
		}else{
			result.setState(false);
			result.setCode(100001);
		}
		return result;
	}
	
}
