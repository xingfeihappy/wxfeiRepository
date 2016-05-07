package com.projection.dao;

import java.util.List;

import com.projection.dao.Base.SuperDao;
import com.projection.domain.User;
import com.projection.util.MD5Util;

public class UserDao extends SuperDao<User> {

	public User getUserByUsername(String username) {
		@SuppressWarnings("unchecked")
		// this.getSession() 获取Hibernate 当前的session
		// 以HQL语句创建query对象
		// setParameter 为HQl语句的参数赋值
		// query调用list方法获取查询的全部实例
		List<User> list = this.getSession().createQuery("from User u where u.username = :username")
				.setParameter("username", username).list();
		return list.size() > 0 ? list.get(0) : null;
	}

	public User getUserByUsernameAndPassword(String username, String password) {
		@SuppressWarnings("unchecked")
		List<User> list = this.getSession().createQuery("from User u where u.username = :username and u.password = :password")
				.setParameter("username", username).setParameter("password", MD5Util.MD5(password)).list();
		System.out.println(MD5Util.MD5(password));
		return list.size() > 0 ? list.get(0) : null;
	}

}
