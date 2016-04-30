package com.projection.service;

import java.util.List;

import com.projection.domain.Log;
import com.projection.domain.Message;
import com.projection.domain.Order;
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
		List<Log> logList = logDao.getLogListByUser(user.getId());
		List<Message> messageList = messageDao.getMessageListByUser(user.getId());
		List<Order> orderList = orderDao.getOrderByUser(user.getId());
		for(int i=0;i<logList.size();i++){
			logDao.delete(logList.get(i));
		}
		for(int i=0;i<messageList.size();i++){
			messageDao.delete(messageList.get(i));
		}
		for(int i=0;i<orderList.size();i++){
			orderDao.delete(orderList.get(i));
		}
		userDao.delete(user);
		
	}
}
