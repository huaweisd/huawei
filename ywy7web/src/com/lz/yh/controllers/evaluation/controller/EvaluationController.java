package com.lz.yh.controllers.evaluation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lz.yh.controllers.BaseControl;
import com.lz.yh.system.util.ToolUtil;

/**
 * 
 * @author hw
 * @data 2015/11/26
 *
 */
@Controller
@RequestMapping("evaluation")
public class EvaluationController extends BaseControl {
	
	@RequestMapping(value="{evaluationId}")
	public String zx_info(@PathVariable String evaluationId, Model model, HttpServletRequest request) throws ParseException {
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
		model.addAttribute("evaluationId", evaluationId);
		return "/webviews/index/evaluation_info.jsp";
	}
	
	@RequestMapping(value="content/{evaluationId}")
	public String gl_content(@PathVariable String evaluationId, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", evaluationId);
		param.put("perNumber", 1);
		model.addAttribute("evaluation", tEvaluationService.queryEvaluation(param).get(0));
		return "/webviews/index/evaluation_content.jsp";
	}
	
}
