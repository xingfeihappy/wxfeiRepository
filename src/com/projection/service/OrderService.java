package com.projection.service;

import java.util.ArrayList;
import java.util.List;

import com.projection.domain.Dishes;
import com.projection.domain.Order;
import com.projection.service.Base.BaseService;

public class OrderService extends BaseService {
	public List<Order> getOrderByUser(Integer id) {
		return orderDao.getOrderByUser(id);
	}
	
	public List<Order> getAll() {
		List<Order> orders = orderDao.getAll();
		List<Order> result = new ArrayList<>();
		for (Order order : orders) {
			if (order.getValid() == 1) {
				result.add(order);
			}
		}
		return result;
	}

	public Integer save(Order order) {
		return orderDao.save(order);
	}

	public void update(Order order) {
		orderDao.update(order);
	}

	public Order get(Integer id) {
		return orderDao.get(id);
	}

	public void delete(Order order) {
		order.setValid(0);
		orderDao.update(order);
	}

}
