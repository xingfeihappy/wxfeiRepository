package com.projection.dao;

import java.util.List;

import com.projection.dao.Base.SuperDao;
import com.projection.domain.Order;

public class OrderDao extends SuperDao<Order>{

	public List<Order> getOrderByUser(Integer id) {
		String hql = "from Order o where o.user.id = :id and o.valid = 1";
		@SuppressWarnings("unchecked")
		List<Order> list = this.getSession().createQuery(hql).setParameter("id", id).list();
		return list;
	}

	public List<Order> getAllByDish(Integer id) {
		String hql = "from Order_dishes o where o.dish.id = :id";
		@SuppressWarnings("unchecked")
		List<Order> list = this.getSession().createQuery(hql).setParameter("id", id).list();
		return list;
	}

}
