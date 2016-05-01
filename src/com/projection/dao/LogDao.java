package com.projection.dao;

import java.util.List;

import com.projection.dao.Base.SuperDao;
import com.projection.domain.Log;

public class LogDao extends SuperDao<Log>{

	public List<Log> getLogListByUser(Integer id) {
		String hql = "from Log l where l.user.id = :id";
		@SuppressWarnings("unchecked")
		List<Log> list = getHibernateTemplate().find(hql, id);
		//List<Log> list = this.getSession().createQuery(hql).setParameter("id", id).list();
		return list;
	}

}
