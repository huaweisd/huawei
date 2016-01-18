package com.lz.yh.controllers.index.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lz.yh.controllers.BaseControl;
import com.lz.yh.system.bean.PageResult;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;
import com.lz.yh.system.util.YzmUtil;

/**
 * 
 * @author huawei
 * @data 2015/11/19
 *
 */
@Controller
@RequestMapping("index")
public class IndexController extends BaseControl {
	
	private static final Logger log = Logger.getLogger(IndexController.class);
	
	@RequestMapping(value="index")
	public String index (Model model, HttpServletRequest request) throws ParseException {
		model.addAttribute("nav", "index");
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
		return "/webviews/index/index.jsp";
	}
	
	@RequestMapping(value="register")
	public String register () {
		return "/webviews/common/index.jsp";
	}
	
	@RequestMapping(value="ajaxUser")
	@ResponseBody
	public Object ajaxUser (String fieldId, String fieldValue) {
		boolean temp = false;

		List<Object> s = new ArrayList<Object>();

		if (ToolUtil.isNoEmpty(fieldValue)) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("loginName", fieldValue);
			List<Map<String, Object>> list = tUserService.queryTUserByRegister(param);
			if (null == list || list.size() == 0) {
				temp = true;
			}
		}
		s.add(fieldId);
		s.add(temp);

		return s;
	}
	
	@RequestMapping(value="registerNewUser")
	@ResponseBody
	public PageResult registerNewUser(String loginName, String email, String password, String repassword, String yzm, HttpSession session) {
		PageResult result = new PageResult();
		if (!ToolUtil.isNoEmpty(loginName)) {
			result.setState(false);
			result.setMsg("* 请检查用户名输入是否正确！");
			return result;
		}
		if (!ToolUtil.isNoEmpty(email)) {
			result.setState(false);
			result.setMsg("* 请检查邮箱输入是否正确！");
			return result;
		}
		if (!ToolUtil.isNoEmpty(password) || !ToolUtil.isNoEmpty(repassword) || !password.equals(repassword)) {
			result.setState(false);
			result.setMsg("* 请检查密码输入是否正确！");
			return result;
		}
		if (!ToolUtil.isNoEmpty(yzm)) {
			result.setState(false);
			result.setMsg("* 请检查验证码输入是否正确！");
			return result;
		}
		String code = session.getAttribute("validateCode").toString();
		if (null == code || !code.equals(yzm.toUpperCase())) {
			result.setState(false);
			result.setMsg("* 请仔细核对验证码输入是否正确！");
			return result;
		}
		Map<String, Object> param = new HashMap<String, Object>();
		String id = ToolUtil.getUUID();
		param.put("id", id);
		param.put("loginName", loginName);
		param.put("password", password);
		param.put("email", email);
		tUserService.registerTUser(param);
		Map<String, Object> param2 = new HashMap<String, Object>();
		param2.put("id", id);
		List<Map<String, Object>> list = tUserService.queryTUser(param2);
		session.setAttribute("userId", id);
		session.setAttribute("user", list.get(0));
		return result;
	}
	
	@RequestMapping(value="getIndexImages")
	@ResponseBody
	public PageResult getIndexImages(String perNumber, String tType) {
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
	
	@RequestMapping(value="getIndexNews")
	@ResponseBody
	public PageResult getIndexNews(String perNumber, String tType, String id, String order) {
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
		param.put("startRecordNum", 0);
		if (ToolUtil.isNoEmpty(order)) {
			if ("1".equals(order)) {
				param.put("order", OrderType.getName("CLICK_COUNT"));
			}
		} else{
			param.put("order", OrderType.getName("CREATE_TIME"));
		}
		resultList = tNewsService.queryTnews(param);
		result.setResultList(resultList);
		return result;
	}
	
	@RequestMapping(value="getIndexEvaluation")
	@ResponseBody
	public PageResult getIndexEvaluation(String perNumber, String tType) {
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
	
	@RequestMapping(value="getIndexPackage")
	@ResponseBody
	public PageResult getIndexPackage(String perNumber, String tType) {
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
		param.put("startRecordNum", 0);
		resultList = tPackageService.queryTPackageByName(param);
		result.setResultList(resultList);
		return result;
	}
	
	@RequestMapping(value="getIndexConfig")
	@ResponseBody
	public PageResult getIndexConfig(String group){
		PageResult result = new PageResult();
		Map<String, Object> map = new HashMap<String, Object>();
		if (group != null && !"".equals(group)) {
			String[] groupArr = group.split(",");
			for (int i = 0; i < groupArr.length; i++) {
				List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
				if (ToolUtil.isNoEmpty(groupArr[i])) {
					list = tConfigService.queryTconfigByTgroup(groupArr[i]);
				}
				map.put(groupArr[i], list);
			}
			result.setObj(map);
		} else {
			result.setState(false);
		}
		return result;
	}
	
	@RequestMapping(value="getIndexViewProductZQ")
	@ResponseBody
	public PageResult getIndexViewProductZQ(String perNumber, String zqType){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(zqType)) {
			param.put("zqType", zqType);
		}
		list = tProductZQService.queryHotArea(param);
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getIndexKFKC")
	@ResponseBody
	public PageResult getIndexKFKC(String perNumber, String type){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (null != type && !"".equals(type)) {
			if ("1".equals(type)) {
				param.put("order", OrderType.getName("PROD_TEST_TIME"));
				list = tProductTestService.queryProductTestTable(param);
			} else if ("2".equals(type)) {
				param.put("order", OrderType.getName("OPEN_TIME"));
				list = tProductOpenService.queryProductOpenTable(param);
			} else {
				param.put("order", OrderType.getName("START_TIME"));
				param.put("tGroup", 2);
				list = tProductsService.querySingleRank(param);
			}
			result.setResultList(list);
		} else {
			result.setState(false);
		}
		return result;
	}
	
	@RequestMapping(value="getIndexRaiders")
	@ResponseBody
	public PageResult getIndexRaiders(String perNumber, String type, String gameName, String order){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(type)) {
			param.put("type", type);
		}
		if (ToolUtil.isNoEmpty(gameName)) {
			param.put("gameName", gameName);
		}
		if (ToolUtil.isNoEmpty(order)) {
			if ("1".equals(order)) {
				param.put("order", OrderType.getName("CLICK_COUNT"));
			}
		} else{
			param.put("order", OrderType.getName("CREATE_TIME"));
		}
		list = tRaidersService.queryTRAIDERS(param);
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getIndexVideos")
	@ResponseBody
	public PageResult getIndexVideos(String perNumber, String tType, String order){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tType)) {
			param.put("tType", tType);
		}
		if (ToolUtil.isNoEmpty(perNumber)) {
			param.put("perNumber", Integer.parseInt(perNumber));
		}
		if (ToolUtil.isNoEmpty(order)) {
			if ("1".equals(order)) {
				param.put("order", OrderType.getName("CLICK_COUNT"));
			}
		} else{
			param.put("order", OrderType.getName("CREATE_TIME"));
		}
		list = tVideosService.queryGameVideos(param);
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getIndexFriendLink")
	@ResponseBody
	public PageResult getIndexFriendLink(String tGroup){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(tGroup)) {
			param.put("tGroup", tGroup);
		}
		param.put("order", OrderType.getName("PRIORITY"));
		list = tFriendLinkService.querytFriendLink(param);
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getIndexViewProductOsType")
	@ResponseBody
	public PageResult getIndexViewProductOsType(String gameType, String osType, String priceType, String languageType){
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		gameType = ToolUtil.isNoEmpty(gameType) ? gameType : "0";
		osType = ToolUtil.isNoEmpty(osType) ? osType : "0";
		priceType = ToolUtil.isNoEmpty(priceType) ? priceType : "0";
		languageType = ToolUtil.isNoEmpty(languageType) ? languageType : "0";
		list = tProductOsService.queryGames(Integer.parseInt(gameType), Integer.parseInt(osType), Integer.parseInt(priceType), Integer.parseInt(languageType));
		result.setResultList(list);
		return result;
	}
	
	@RequestMapping(value="getIndexUser")
	@ResponseBody
	public PageResult getIndexUser(HttpSession session, String loginName, String password) throws NumberFormatException, ParseException{
		PageResult result = new PageResult();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if (ToolUtil.isNoEmpty(loginName) && ToolUtil.isNoEmpty(password)) {
			param.put("loginName", loginName);
			param.put("password", password);
			list = tUserService.queryTUser(param);
			if (list != null && list.size() == 1) {
				session.setAttribute("userId", list.get(0).get("id").toString());
				session.setAttribute("user", list.get(0));
				// 修改最后登录时间与连续登录次数
				Map<String, Object> param2 = new HashMap<String, Object>();
				param2.put("id", list.get(0).get("id").toString());
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				Integer i = ToolUtil.compareDate(df.parse(list.get(0).get("lastLoginTime").toString()).getTime());
				if (i == 0) {
					param2.put("setInfo", "LAST_LOGIN_TIME = NOW()");
				} else if (i == 1) {
					param2.put("setInfo", "LAST_LOGIN_TIME = NOW(), CDAYS = CDAYS + 1");
				} else {
					param2.put("setInfo", "LAST_LOGIN_TIME = NOW(), CDAYS = 1");
				}
				tUserService.updateTUser(param2);
			} else {
				result.setState(false);
				result.setMsg("亲，您输入的用户名或密码有误！请仔细确认");
			}
		} else {
			result.setState(false);
			result.setMsg("亲，您输入的用户名或密码有误！请仔细确认");
		}
		return result;
	}
	
	@RequestMapping(value="loginOut")
	@ResponseBody
	public PageResult loginOut(HttpSession session){
		PageResult result = new PageResult();
		session.removeAttribute("userId");
		session.removeAttribute("user");
		return result;
	}
	
	@RequestMapping(value="sign")
	@ResponseBody
	public PageResult sign(HttpSession session, HttpServletRequest request) throws ParseException{
		PageResult result = new PageResult();
		Object obj = request.getSession().getAttribute("user");
		if (null != obj) {
			@SuppressWarnings("unchecked")
			Map<String, Object> user = (Map<String, Object>) obj;
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("id", user.get("id").toString());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			boolean flagSign = true;// 区别是否已签到
			if (ToolUtil.checkTheNextMonth(df.parse(user.get("lastQdTime").toString()).getTime())) {// 判断今日是否为第二个月，签到
				Integer i = ToolUtil.compareDate(df.parse(user.get("lastQdTime").toString()).getTime());
				if (i == 0) {
					flagSign = false;
				} else if (i == 1) {
					param.put("setInfo", "LAST_QD_TIME = NOW(), CADAYS = CADAYS + 1");
				} else {
					param.put("setInfo", "LAST_QD_TIME = NOW(), CADAYS = 1");
				}
			} else {
				param.put("setInfo", "LAST_QD_TIME = NOW(), CADAYS = 1");
			}
			tUserService.updateTUser(param);
			// 根据规则增加金币
			if (flagSign) {
				Map<String, Object> param2 = new HashMap<String, Object>();
				param2.put("id", user.get("id").toString());
				Map<String, Object> user2 = tUserService.queryTUser(param2).get(0);
				session.setAttribute("user", user2);
				Integer goldNum = ToolUtil.getGoldNum(Integer.parseInt(user2.get("cadays").toString()));
				param2.put("setInfo", "N_COIN = N_COIN + " + goldNum);
				tUserService.updateTUser(param2);
				Map<String, Object> param3 = new HashMap<String, Object>();
				param3.put("id", user.get("id").toString());
				session.setAttribute("user", tUserService.queryTUser(param3).get(0));
			}
		} else {
			result.setState(false);
		}
		return result;
	}
	
	@RequestMapping(value="getIndexYZM")
	@ResponseBody
	public void getIndexYZM(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
		YzmUtil.service(request, response, session);
	}
}
