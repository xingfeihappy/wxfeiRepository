package com.projection.service;

import java.util.ArrayList;
import java.util.List;

import com.projection.domain.User;
import com.projection.service.Base.BaseService;

public class UserService extends BaseService {

	public List<User> getAll() {
		List<User> users = userDao.getAll();
		List<User> result = new ArrayList<>();
		for (User user : users) {
			if (user.getValid() == 1) {
				result.add(user);
			}
		}
		return result;
	}

	public Integer save(User user) {
		return userDao.save(user);
	}

	public void update(User user) {
		userDao.update(user);
	}

	public User get(Integer id) {
		return userDao.get(id);
	}

	public void delete(User user) {
		user.setValid(0);
		userDao.update(user);
	}

	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}
}
