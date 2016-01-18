package com.lz.yh.system.bean;

import java.util.List;
import java.util.Map;

/**
 * 
 * 返回结果集
 * @author hauwei
 * @time 2015/10/28
 *
 */
public class PageResult {
	
	private List<Map<String, Object>> resultList;
	
	private Map<String, Object> resultMap;
	
	private Object obj;
	
	private Integer totalCount = 0;// 总记录数
	
	private Integer pageSize = 1;// 每页显示记录数
	
	private Integer pageIndex = 1;// 当前页数
	
	private Integer pageCount;// 总页数
	
	private boolean state = true;// 判断请求是否成功
	
	private Integer code = 100000;// 错误码；100000表示正常
	
	private String msg;// 错误信息
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public List<Map<String, Object>> getResultList() {
		return resultList;
	}

	public void setResultList(List<Map<String, Object>> resultList) {
		this.resultList = resultList;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Map<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}
	
	/**
	 * 获取起始记录数
	 * @param preCount 每页显示数
	 * @param page 当前页数
	 * @return 
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
	 * 获取总页数
	 * @param preCount 每页显示数
	 * @param totalCount 总记录数
	 * @return 
	 */
	public static Integer calcTotalPage(Object preCount, Object totalCount){
		if(preCount == null || totalCount == null){
			return 0;
		}
		Integer preCountNumber = Integer.valueOf(preCount.toString());
		Integer totalCountNumber = Integer.valueOf(totalCount.toString());
		return (totalCountNumber - 1) / preCountNumber + 1;
	}
	
}
