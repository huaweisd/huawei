package com.lz.yh.system.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author huawei
 * @time 2015/10/28
 *
 */
@Repository("baseDao")
public class BaseDao extends SqlSessionDaoSupport {
	
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	/**
	 * ��������
	 * @param obj
	 * @param sqlId
	 * @return
	 */
	public Integer addObj(Object obj, String sqlId) {
		return this.getSqlSession().insert(sqlId, obj);
	}
	
	/**
	 * ������������
	 * @param list
	 * @param sqlId
	 */
	public void addList(List<Object> list, String sqlId) {
		for (int i = 0; i < list.size(); i++) {
			addObj(list.get(i), sqlId);
		}
	}
	
	/**
	 * ɾ������
	 * @param obj
	 * @param sqlId
	 * @return
	 */
	public Integer delObj(Object obj, String sqlId) {
		return this.getSqlSession().delete(sqlId, obj);
	}
	
	/**
	 * ����ɾ������
	 * @param list
	 * @param sqlId
	 */
	public void delList(List<Object> list, String sqlId) {
		for (int i = 0; i < list.size(); i++) {
			delObj(list.get(i), sqlId);
		}
	}
	
	/**
	 * ��������
	 * @param obj
	 * @param sqlId
	 * @return
	 */
	public Integer updateObj(Object obj, String sqlId) {
		return this.getSqlSession().update(sqlId, obj);
	}
	
	/**
	 * ��ѯһ�������
	 * @param map
	 * @param sqlId
	 * @return
	 */
	public Object queryObj(Map<String, Object> map, String sqlId) {
		return this.getSqlSession().selectOne(sqlId, map);
	}
	
	/**
	 * ��ѯ���������
	 * @param map
	 * @param sqlId
	 * @return
	 */
	public List<Map<String, Object>> queryList(Map<String, Object> map, String sqlId) {
		return this.getSqlSession().selectList(sqlId, map);
	}
}
