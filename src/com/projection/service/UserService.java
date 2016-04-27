package com.projection.service;

import java.util.List;

import com.projection.domain.User;
import com.projection.service.Base.BaseService;

public class UserService extends BaseService{
	public List<User> getAll(){
		return userDao.getAll();
	}

	public Integer save(User user){
		return userDao.save(user);
	}
	
	public void update(User user){
		userDao.update(user);
	}
	public User get(Integer id){
		return userDao.get(id);
	}

	public void deleteUser(User user) {
		userDao.delete(user);
		
	}
}
