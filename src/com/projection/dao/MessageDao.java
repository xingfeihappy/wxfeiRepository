package com.projection.dao;

import java.util.List;

import com.projection.dao.Base.SuperDao;
import com.projection.domain.Message;

public class MessageDao extends SuperDao<Message>{

	public List<Message> getMessageListByUser(Integer id) {
		String hql = "from Message m where m.user.id = :id";
		@SuppressWarnings("unchecked")
		List<Message> list = this.getSession().createQuery(hql).setParameter("id", id).list();
		return list;
	}

	public List<Message> getMessageByDishes(Integer id) {
		String hql = "from Message m where m.recommendation like :id";
		@SuppressWarnings("unchecked")
		List<Message> list = this.getSession().createQuery(hql).setParameter("id", "%"+id+"%").list();
		System.out.println(list.size());
		return list;
	}

	public List<Message> getMessageByOrder(Integer id) {
		String hql = "from Message m where m.order.id = :id";
		@SuppressWarnings("unchecked")
		List<Message> list = this.getSession().createQuery(hql).setParameter("id", id).list();
		return list;
	}

}
