package cn.believeus.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.dao.MySQLDao;

@Service(value="service")
public class MySQLService{
	@Resource
	private MySQLDao mysqlDao;
	
	
	
	public void saveOrUpdate(Object object) {
		mysqlDao.saveOrUpdate(object);
	}
	
	public void merge(Object object){
		mysqlDao.merge(object);
	}
	
	public void delete(Class<?> clazz, Integer id) {
		mysqlDao.delete(clazz, id);
	}

	
	
	public void delete(Object entity) {
		mysqlDao.delete(entity);
	}
	
	
	public void delete(Class<?> clazz,List<?> ids){
		mysqlDao.delete(clazz, ids);
	}

	
	public void delete(Class<?> clazz, String property, Object value) {
		mysqlDao.delete(clazz, property, value);
	}

	public Object findObject(String hql,boolean isSQL) {
		return mysqlDao.findObject(hql,isSQL);
	}
	public void updateOrInsert(String sql){
		mysqlDao.update(sql);
	}
	
	public Object findObject(Class<?> clazz, Object property, Object value) {
		return mysqlDao.findObject(clazz, property, value);
	}

	
	public Object findObject(Class<?> clazz, Integer id) {
		return mysqlDao.findObject(clazz, id);
	}

	
	public List<?> findObjectList(Class<?> clazz, Object property, Object value) {
		return mysqlDao.findObjectList(clazz, property, value);
	}


	
	public List<?> findObjectList(Class<?> clazz, Object property,
			Object value1, Object property2, Object value2) {
		return mysqlDao.findObjectList(clazz, property, value1, property2, value2);
	}

	
	public List<?> findObjectList(Class<?> clazz) {
		return mysqlDao.findObjectList(clazz);
	}

	
	
	public List<?> findObjectList(Class<?> clazz, Integer num) {
		return mysqlDao.findObjectList(clazz, num);
	}

	public List<?> findObjectList(final Class<?> clazz,final String property,final String value,final Integer num){
		return mysqlDao.findObjectList(clazz, property,value,num);
	}
	
	public List<?> findObjectList(Class<?> clazz, String property,
			Object value, int num) {
		return mysqlDao.findObjectList(clazz, property, value, num);
	}
	 public List<?> findColumnValue(final Class<?> clazz,final String column,final String prop,final Object val,final int num){
		 return mysqlDao.findColumnValue(clazz, column, prop, val, num);
	 }
	public List<?> findObjectList(String hql, Integer num) {
		return mysqlDao.findObjectList(hql,num);
	}
	
	public List<?> findObjectList(String hql) {
		return mysqlDao.findObjectList(hql);
	}
	public Page<?> findObjectList(String hql, Pageable pageable) {
		return (Page<?>) mysqlDao.getPageDateList(hql,pageable );
	}

	public Page<?> findObjectPage(Class<?> clazz, Pageable pageable){
	 	return mysqlDao.findObjectPage(clazz, pageable);
	}

}
