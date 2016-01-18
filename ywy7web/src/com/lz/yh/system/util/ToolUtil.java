package com.lz.yh.system.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.codec.language.bm.Lang;
import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.lz.yh.services.tmenu.models.TMenu;

/**
 * ������
 * 
 * @author huawei
 * @time 2015/10/28
 * 
 */
public class ToolUtil {

	private static final Logger log = Logger.getLogger(ToolUtil.class);

	/**
	 * 
	 * ʱ������ת��Ϊ�ַ�����
	 * 
	 * @param date
	 *            ��Ҫת����ʱ�����
	 * @param format
	 *            ��ʽ
	 * @return ��ʽ��֮����ַ�
	 */
	public static String dateFormat(Date date, String format) {
		if (date == null) {
			return "";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}
	}

	/**
	 * 
	 * ʱ���ַ�ת��Ϊʱ������
	 * 
	 * @param date
	 *            ��Ҫת����ʱ���ַ�
	 * @param format
	 *            ��ʽ
	 * @return ��ʽ��֮���ʱ�����
	 */
	public static Date dateFormat(String date, String format) {
		Date time = null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			time = sdf.parse(date);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return time;
	}

	/**
	 * ����ת��JSON��
	 * 
	 * @param obj
	 * @return JSON����
	 */
	public static String ObjectToJson(Object obj) {
		Gson gson = new Gson();
		if (null != obj) {
			return gson.toJson(obj);
		}
		return null;
	}

	/**
	 * ��ȡ���ṹ�˵�json
	 * 
	 * @param list
	 * @return
	 */
	public static String getTreeJson(List<TMenu> list) {
		StringBuffer json = new StringBuffer("[");

		List<TMenu> rootlist = new ArrayList<TMenu>();
		List<TMenu> chaillist = new ArrayList<TMenu>();
		List<TMenu> lastlist = new ArrayList<TMenu>();

		TMenu root = null;
		for (int i = 0; i < list.size(); i++) {
			root = new TMenu();
			root = list.get(i);
			if (null != root && null != root.getLevel()) {
				if (root.getLevel() == 1) {
					rootlist.add(root);
				} else if (root.getLevel() == 2) {
					chaillist.add(root);
				} else if (root.getLevel() == 3) {
					lastlist.add(root);
				}
			}
		}
		for (int i = 0; i < rootlist.size(); i++) {
			root = new TMenu();
			root = rootlist.get(i);
			String temps = "";
			json.append("{\"text\":\"" + root.getName() + "\",\"id\":\""
					+ root.getId() + "\",\"priority\":" + root.getPriority()
					+ ",\"iconCls\":\"" + root.getImgUrl() + "\",\"expanded\":"
					+ (i == 0 ? true : false)
					+ ",\"checked\":false,\"children\":[");
			TMenu tu = null;
			for (int j = 0; j < chaillist.size(); j++) {
				tu = new TMenu();
				tu = chaillist.get(j);
				boolean isleaf = true;
				String last = "";
				if (root.getId().equals(tu.getParentId())) {
					TMenu tus = null;
					for (int k = 0; k < lastlist.size(); k++) {
						tus = new TMenu();
						tus = lastlist.get(k);
						if (tu.getId().equals(tus.getParentId())) {
							isleaf = false;
							last = last + "{\"text\":\"" + tus.getName()
									+ "\",\"priority\":" + tus.getPriority()
									+ "," + "\"leaf\":true,\"id\":\""
									+ tus.getId() + "\"," + "\"iconCls\":\""
									+ tus.getImgUrl() + "\",\"checked\":false,"
									+ "\"config\":\"" + tus.getConfig()
									+ "\"},";
						}
					}
					temps = temps + "{\"text\":\"" + tu.getName()
							+ "\",\"priority\":" + tu.getPriority() + ","
							+ "\"leaf\":" + isleaf + ",\"id\":\"" + tu.getId()
							+ "\"" + ",\"iconCls\":\"" + tu.getImgUrl()
							+ "\",\"checked\":false," + "\"config\":\""
							+ tu.getConfig() + "\",\"children\":[";
					if (last.length() > 1) {
						temps = temps
								+ (last.length() > 0 ? (last.substring(0,
										last.length() - 1)) : "") + "]},";
					} else {
						temps = temps + "]},";
					}
				}
			}
			json.append((temps.length() > 0 ? (temps.substring(0,
					temps.length() - 1)) : "")
					+ "]},");
		}
		return json.substring(0, json.length() - 1) + "]";
	}

	/**
	 * ��ȡ�˵�json
	 * 
	 * @param list
	 * @return
	 */
	public static String getJson(List<TMenu> list) {
		StringBuffer json = new StringBuffer("[");
		List<TMenu> rootlist = new ArrayList<TMenu>();
		List<TMenu> chaillist = new ArrayList<TMenu>();
		List<TMenu> lastlist = new ArrayList<TMenu>();
		TMenu root = null;
		for (int i = 0; i < list.size(); i++) {
			root = new TMenu();
			root = list.get(i);
			if (root.getLevel() == 1) {
				rootlist.add(root);
			} else if (root.getLevel() == 2) {
				chaillist.add(root);
			} else if (root.getLevel() == 3) {
				lastlist.add(root);
			}
		}
		for (int i = 0; i < rootlist.size(); i++) {
			root = new TMenu();
			root = rootlist.get(i);
			String temps = "";
			json.append("{\"text\":\"" + root.getName() + "\",\"priority\":"
					+ root.getPriority() + ",\"iconCls\":\"" + root.getImgUrl()
					+ "\",\"expanded\":" + (i == 0 ? true : false)
					+ ",\"children\":[");
			TMenu tu = null;
			for (int j = 0; j < chaillist.size(); j++) {
				tu = new TMenu();
				tu = chaillist.get(j);
				boolean isleaf = true;
				String last = "";
				if (root.getId().equals(tu.getParentId())) {
					TMenu tus = null;
					for (int k = 0; k < lastlist.size(); k++) {
						tus = new TMenu();
						tus = lastlist.get(k);
						if (tu.getId().equals(tus.getParentId())) {
							isleaf = false;
							last = last + "{\"text\":\"" + tus.getName()
									+ "\",\"priority\":" + tus.getPriority()
									+ "," + "\"leaf\":true," + "\"iconCls\":\""
									+ tus.getImgUrl() + "\"," + "\"config\":\""
									+ tus.getConfig() + "\"},";
						}
					}
					temps = temps + "{\"text\":\"" + tu.getName()
							+ "\",\"priority\":" + tu.getPriority() + ","
							+ "\"leaf\":" + isleaf + ",\"iconCls\":\""
							+ tu.getImgUrl() + "\"," + "\"config\":\""
							+ tu.getConfig() + "\",\"children\":[";
					if (last.length() > 1) {
						temps = temps
								+ (last.length() > 0 ? (last.substring(0,
										last.length() - 1)) : "") + "]},";
					} else {
						temps = temps + "]},";
					}
				}
			}
			json.append((temps.length() > 0 ? (temps.substring(0,
					temps.length() - 1)) : "")
					+ "]},");
		}
		return json.substring(0, json.length() - 1) + "]";
	}

	/**
	 * ���һ��UUID
	 * 
	 * @return String UUID
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}

	/**
	 * ����ת�ַ�
	 * @param date
	 * @param format
	 * @return
	 */
	public static String dateRoStr(Date date, String format) {

		if (date == null) {
			return "";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}
	}

	/**
	 * �����ַ�ת����
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date strToDate(String date, String format) {
		Date time = null;
		if (date == null || "".equals(date)) {

		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			try {
				time = sdf.parse(date);
			} catch (ParseException e) {
				log.error("", e);
			}
		}
		return time;
	}
	public static Map<String,Object> convertParmeterMap(Map<String,String[]> param){
		Map<String,Object> result = new HashMap<String, Object>();
 		for(String key : param.keySet()){
			String value = "";
			for(String str : param.get(key)){
				value += (str + ",");
			}
			value = value.substring(0,value.length()-1);
			result.put(key, value);
		}
 		return result;
	}
	/**
	 * 计算startRecord
	 * @param preCount 每页记录条数
	 * @param page 当前页
	 * @return 返回计算结果
	 */
	public static Integer calcStartRecord(Object preCount,Object page){
		if(preCount == null || page == null){
			return 0;
		}
		Integer preCountNumber = Integer.valueOf(preCount.toString());
		Integer pageNumber = Integer.valueOf(page.toString());
		return preCountNumber * (pageNumber - 1);
	}
	/**
	 * 计算分页页数
	 * @param preCount 每页记录条数
	 * @param totalCount 记录数量
	 * @return 返回计算结果
	 */
	public static Integer calcTotalPage(Object preCount, Object totalCount){
		if(preCount == null || totalCount == null){
			return 0;
		}
		Integer preCountNumber = Integer.valueOf(preCount.toString());
		Integer totalCountNumber = Integer.valueOf(totalCount.toString());
		return (totalCountNumber - 1) / preCountNumber + 1;
	}
	
	/**
	 * 
	 */
	public static boolean isNoEmpty(String str){
		if (null != str && !"".equals(str)) {
			return true;
		} else {
			return false;
		}
	}
	
//	/**
//	 * 效验request参数
//	 *
//	 * @param param request参数
//	 * @param validata key为要效验参数的名称，value为自定义规则(value可以是list,也可以是CustomValidata对象)，若value为空，则默认执行为空验证
//	 * @return 成功返回true 失败返回false
//	 */
//	@SuppressWarnings("unchecked")
//	public static boolean validataParam(Map<String,Object> param,Map<String,Object> validatas){
//		for (String keyStr : validatas.keySet()) {
//			if(param.get(keyStr) == null || "".equals(param.get(keyStr).toString())){
//				return false;
//			} 
//			Object vd = validatas.get(keyStr);
//			if(vd != null){
//				if(vd.getClass().toString().indexOf("List") != -1){
//					List<CustomValidata> vdList = (List<CustomValidata>)vd;
//					for(CustomValidata cv : vdList){
//						if(cv == null){
//							continue;
//						}
//						if(!cv.validata(param.get(keyStr))){
//							return false;
//						}
//					}
//				}
//				if(vd.getClass().toString().indexOf("CustomValidata") != -1){
//					if(!((CustomValidata)vd).validata(param.get(keyStr))){
//						return false;
//					}
//				}
//			}
//		}
//		return true;
//	}
	
	
	/**
	 * 日期比较,判断今天是否为给定时间的后一天
	 * @throws ParseException
	 * @return 
	 * 		0:今日已登录或已签到
	 * 		1:满足连续登录或连续签到条件
	 * 		2:不满足连续登录或连续签到条件
	 */
	public static Integer compareDate(long time) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date d1 = new Date(time);
		String d1s = df.format(d1) + " 23:59:59";
		d1 = df2.parse(d1s);
		Date d2 = new Date();
		if (d2.getTime() - time <= 24 * 60 * 60 * 1000) {
			return 0;
		} else if (d2.getTime() - d1.getTime() <= 24 * 60 * 60 * 1000 && d2.getTime() - d1.getTime() > 0) {
			return 1;
		} else {
			return 2;
		}
	}
	
	/**
	 * 判断今日是否为第二个月，签到
	 */
	public static boolean checkTheNextMonth(long time) {
		Date d1 = new Date(time);
		Date d2 = new Date();
		Calendar c1 = Calendar.getInstance();
		c1.setTime(d1);
		Calendar c2 = Calendar.getInstance();
		c2.setTime(d2);
		if (c1.get(Calendar.MONTH) == c2.get(Calendar.MONTH)) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 签到奖励金币规则：
	 * 每月连续签到次数置1，连续签到7n+7天是分别奖励10、13、16、19个金币，7n+1、7n+2、7n+3、7n+4、7n+5、2n+6天分别奖励1、2、3、4、5、6个金币
	 */
	public static Integer getGoldNum(Integer signNum) {
		Integer goldNum = 0;
		switch (signNum % 7) {
		case 0:
			switch (signNum) {
			case 7:
				goldNum = 10;
				break;
			case 14:
				goldNum = 13;
				break;
			case 21:
				goldNum = 16;
				break;
			case 28:
				goldNum = 19;
				break;
			default:
				break;
			}
			break;
		case 1:
			goldNum = 1;
			break;
		case 2:
			goldNum = 2;
			break;
		case 3:
			goldNum = 3;
			break;
		case 4:
			goldNum = 4;
			break;
		case 5:
			goldNum = 5;
			break;
		case 6:
			goldNum = 6;
			break;
		default:
			break;
		}
		return goldNum;
	}
}
