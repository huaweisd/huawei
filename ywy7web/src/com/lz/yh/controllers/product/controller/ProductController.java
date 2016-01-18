package com.lz.yh.controllers.product.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lz.yh.controllers.BaseControl;
import com.lz.yh.system.enumeration.OrderType;
import com.lz.yh.system.util.ToolUtil;

@Controller
@RequestMapping("product")
public class ProductController extends BaseControl{
	
	@RequestMapping(value="{productId}")
	public String product(@PathVariable String productId,Model model,HttpServletRequest request) throws ParseException{
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
		Map<String,Object> param = new  HashMap<String, Object>();
		param.put("id", productId );
		List<Map<String, Object>> list = tProductsService.queryGamesById(param);
		if (null == list || list.size() == 0) {
			list = tProductsService.queryGameInfoById(param);
		}
		model.addAttribute("content", list.get(0));
		model.addAttribute("lb", tPackageService.queryTPackage(null, null, null, null, null, null, 2));
		param.clear();
		param.put("perNumber", 8);
		param.put("order", OrderType.getName("CREATE_TIME"));
		param.put("tType", 1);
		model.addAttribute("gl", tRaidersService.queryTRAIDERS(param));
		param.clear();
		param.put("perNumber", 12);
		param.put("zqType", 8);
		model.addAttribute("cnxh", tProductZQService.queryZqListByType(param));
		return "/webviews/product/index.jsp";
	}
}
