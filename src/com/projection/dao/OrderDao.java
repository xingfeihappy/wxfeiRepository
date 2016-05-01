package com.projection.dao;

import java.util.List;

import com.projection.dao.Base.SuperDao;
import com.projection.domain.Order;

public class OrderDao extends SuperDao<Order>{

	public List<Order> getOrderByUser(Integer id) {
		String hql = "from Order o where o.user.id = :id";
		@SuppressWarnings("unchecked")
		List<Order> list = getHibernateTemplate().find(hql, id);
		//List<Order> list = this.getSession().createQuery(hql).setParameter("id", id).list();
		return list;
	}

}
