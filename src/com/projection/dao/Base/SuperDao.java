package com.projection.dao.Base;


import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 是所有DaoImpl的父类
 * 实现了增删改查，getAll，以及分页查询
 * @author d
 * 2013-7-28
 * @param <T>
 */
public abstract class SuperDao<T> extends HibernateDaoSupport implements BaseDao<T> {

	/**
	 * 根据主键ID查找
	 */
	@SuppressWarnings("unchecked")
	@Override
	public T get(int id) {
		// 实体类名
		Class<?> entityClass = getEntityClass();
		return (T) getHibernateTemplate().get(entityClass, id);
	}
	

	/**
	 * 查询出全部
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getAll() {
		
		String entityName = getEntityName();
		//System.out.println(entityName);
		String hql = "from %s";
		hql = String.format(hql, entityName);
		//System.out.println(hql);
		
		return getHibernateTemplate().find(hql);
	}
	
	/**
	 * 分页查询
	 * 传入两个参数，开始记录和记录数
	 * @param start
	 * @param count
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> findByPage(int start,int count){
		String entityName = getEntityName();
		String hql = "from %s";
		hql = String.format(hql, entityName);
		Query query = this.getSessionFactory().getCurrentSession().createQuery(hql);
		query.setFirstResult(start);
		query.setMaxResults(count);
		return query.list();
	}

	/**
	 * 插入实体
	 */
	@Override
	public int save(T e) {
		return  (Integer) getHibernateTemplate().save(e);
	}

	/**
	 * 删除实体
	 */
	@Override
	public void delete(T e) {
		getHibernateTemplate().delete(e);
	}

	/**
	 * 按主键ID删除实体
	 */
	@Override
	public void delete(int id) {
		getHibernateTemplate().delete(get(id));
	}

	/**
	 * 更新
	 */
	@Override
	public void update(T e) {
		getHibernateTemplate().update(e);
	}

	
	/**
	 * 得到传过来的泛型的类名
	 * @return
	 */
	private String getEntityName() {
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		Class<?> entityClass = (Class<?>) params[0];
		return entityClass.getSimpleName();
	}
	
	/**
	 * 得到传过来的泛型类
	 * @return
	 */
	private Class<?> getEntityClass() {
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		Class<?> entityClass = (Class<?>) params[0];
		return entityClass;
	}


	/**
	 * 得到传过来的泛型类的带路径类名
	 * @return
	 */
	private String getEntityPathName() {
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		Class<?> entityClass = (Class<?>) params[0];
		return entityClass.getName();
	}
	
}
