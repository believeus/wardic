package cn.believeus.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Assert;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;


public class MySQLDao extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(MySQLDao.class);
	@Resource
	private SessionFactory sessionFactory;
	

	
	public void merge(Object object) {
		 HibernateTemplate ht = super.getHibernateTemplate();
		ht.merge(object);
		ht.flush();
	}

	
	public void saveOrUpdate(Object object) {
		 HibernateTemplate ht = super.getHibernateTemplate();
		ht.saveOrUpdate(object);
		ht.flush();
	}
	
	public void update(final String sql){
		 HibernateTemplate ht = super.getHibernateTemplate();
		ht.execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				SQLQuery sqlQuery = session.createSQLQuery(sql);
				sqlQuery.executeUpdate();
				return null;
			}
		});
	}
	
	
	public void delete(Class<?> clazz,List<?> idList){
		 HibernateTemplate ht = super.getHibernateTemplate();
		if (idList==null||idList.isEmpty()) {
			return;
		}
		String ids=idList.toString().replace("[", "(").replace("]", ")");
		final String hql = "delete from " + clazz.getName()+ " as entity where entity.id in "+ids;
		ht.execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						return query.executeUpdate();
					}
				});
	}
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#delete(java.lang.Class, java.lang.Integer)
	 */
	public void delete(Class<?> clazz, final Integer id) {
		Object object = this.getHibernateTemplate().get(clazz, id);
		getHibernateTemplate().delete(object);
		this.getHibernateTemplate().flush();
	}
	
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#delete(java.lang.Object)
	 */
	public void delete(Object entity){
		this.getHibernateTemplate().delete(entity);
		this.getHibernateTemplate().flush();
	}
	
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#delete(java.lang.Class, java.lang.String, java.lang.Object)
	 */
	public void delete(Class<?> clazz, String property, final Object value) {
		HibernateTemplate ht = getHibernateTemplate();
		List<?> objectList = this.findObjectList(clazz, property, value);
		for (Object entity : objectList) {
			ht.delete(entity);
			ht.flush();
		}
	}
	
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#findObject(java.lang.String)
	 */
	public Object findObject(final String hql,final boolean isSQL) {
		return this.getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						if(isSQL==true){
							SQLQuery query = session.createSQLQuery(hql);
							return query.uniqueResult();
						}else {
							Query query = session.createQuery(hql);
							return query.uniqueResult();
						}
						
					}
				});
	}

	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#findObject(java.lang.Class, java.lang.Object, java.lang.Object)
	 */
	
	public Object findObject(Class<?> clazz, final Object property,
			final Object value) {
		final String hql = "from " + clazz.getName()+ " as entity where entity." + property + " =:value";
		log.debug("current hql:" + hql);
		return this.getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setParameter("value", value);
						return query.uniqueResult();
					}
				});
	}
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#findObject(java.lang.Class, java.lang.Integer)
	 */

	
	public Object findObject(Class<?> clazz, Integer id) {
		return getHibernateTemplate().get(clazz, id);
	}
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#findObjectList(java.lang.Class, java.lang.Object, java.lang.Object)
	 */
	
	public List<?> findObjectList(Class<?> clazz, final Object property,
			final Object value) {
		final String hql = "from " + clazz.getName()+ " as entity where entity." + property + " =:value";
		return (List<?>) this.getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setParameter("value", value);
						return query.list();
					}
				});
	}
	
	
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#findObjectList(java.lang.Class, java.lang.Object, java.lang.Object, java.lang.Object, java.lang.Object)
	 */
	
	public List<?> findObjectList(Class<?> clazz, final Object property,
			final Object value1, final Object property2, final Object value2) {
		final String hql = "from " + clazz.getName()+ " as entity where entity." + property + " =:value1 and entity." + property2 + " =:value2 order by id desc";
		return (List<?>) this.getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setParameter("value1", value1);
						query.setParameter("value2", value2);
						return query.list();
					}
				});
	}
	
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#findObjectList(java.lang.Class)
	 */
	
	public List<?> findObjectList(final Class<?> clazz){
		
		return (List<?>)getHibernateTemplate().execute(new HibernateCallback<Object>() {
			
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
					String hql="from "+clazz.getName();
					Query query = session.createQuery(hql);
					return query.list();
			}
			
		});
	}
 
	/* (non-Javadoc)
	 * @see cn.believeus.dao.IBaseDao#findObjectList(java.lang.Class, java.lang.Integer)
	 */
	
	public List<?> findObjectList(final Class<?> clazz, final Integer num) {
		return (List<?>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {
					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from " + clazz.getName();
						Query query = session.createQuery(hql);
						query.setFirstResult(0);
						query.setMaxResults(num);
						List<?> list = query.list();
						return list;
					}
				});
	}
	public List<?> findObjectList(final Class<?> clazz,final String property,final String value,final Integer num) {
		return (List<?>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {
					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from " + clazz.getName()+" where "+property+"='"+value+"'";
						Query query = session.createQuery(hql);
						query.setFirstResult(0);
						query.setMaxResults(num);
						List<?> list = query.list();
						return list;
					}
				});
	}
	
	public List<?> findObjectList(final Class<?> clazz, final String property,
			final Object value, final int num) {
		return (List<?>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from " + clazz.getName()+ " as entity where entity." + property + " =:value";
						Query query = session.createQuery(hql);
						query.setParameter("value", value);
						query.setFirstResult(0);
						query.setMaxResults(num);
						List<?> list = query.list();
						return list;
					}
				});
	}
   public List<?> findColumnValue(final Class<?> clazz,final String column,final String prop,final Object val,final int num){
	   return (List<?>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "select "+column+" from " + clazz.getName()+ " as entity where entity." + prop + " =:value";
						Query query = session.createQuery(hql);
						query.setParameter("value", val);
						query.setFirstResult(0);
						query.setMaxResults(num);
						List<?> list = query.list();
						return list;
					}
				});
   }
	
	public List<?> findObjectList(final String hql, final Integer num) {
		Assert.assertNotNull(num);
		return (List<?>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setFirstResult(0);
						query.setMaxResults(num);
						List<?> list = query.list();
						return list;
					}
				});
	}
	
	public List<?> findObjectList(final String hql) {
		return (List<?>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {

					
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						List<?> list = query.list();
						return list;
					}
				});
	}
	
	public Page<?> getPageDateList(final String hql, final Pageable pageable) {
		return (Page<?>)getHibernateTemplate().execute(new HibernateCallback<Object>() {

			@SuppressWarnings("unchecked")
			
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				long total = query.list().size();
				query = session.createQuery(hql);
				int totalPages = (int) Math.ceil((double) total / (double) pageable.getPageSize());
				if (totalPages < pageable.getPageNumber()) {
					pageable.setPageNumber(totalPages);
				}
				query.setFirstResult((pageable.getPageNumber() - 1) * pageable.getPageSize());
				query.setMaxResults(pageable.getPageSize());
			    @SuppressWarnings("rawtypes")
				Page page = new Page(query.list(), (int)total, pageable);
			    return page;
			}
		});
	}

	public Page<?> findObjectPage(final Class<?> clazz, final Pageable pageable){
		return (Page<?>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {


					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from " + clazz.getName()+ " as entity";
						Query query = session.createQuery(hql);
						int total = query.list().size();
						query.setFirstResult((pageable.getPageNumber()-1)*pageable.getPageSize());
						query.setMaxResults(pageable.getPageSize());
						List<?> list = query.list();
						return new Page(list,(int)total,pageable);
					}
				});
	}


}