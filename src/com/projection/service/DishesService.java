package com.projection.service;

import java.util.List;

import com.projection.domain.Dishes;
import com.projection.domain.Message;
import com.projection.domain.Order;
import com.projection.service.Base.BaseService;

public class DishesService extends BaseService{

	public List<Dishes> getAll() {
		return dishesDao.getAll();
	}

	public Dishes get(Integer id) {
		return dishesDao.get(id);
	}

	public Integer save(Dishes dishes) {
		return dishesDao.save(dishes);
	}

	public void update(Dishes dishes) {
		dishesDao.update(dishes);
		
	}

	public void deleteUser(Dishes dishes) {
		List<Message> messageList = messageDao.getMessageByDishes(dishes.getId());
		List<Order> orderList = orderDao.getOrderByDishes(dishes.getId());
		for(int i=0;i<messageList.size();i++){
			
			messageDao.delete(messageList.get(i));
		}
		/*for(int i=0;i<orderList.size();i++){
			List<User>
			List<>
			orderDao.delete(orderList.get(i));
		}*/
		dishesDao.delete(dishes);
		
	}

}
