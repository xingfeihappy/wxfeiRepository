package com.projection.service;

import java.util.List;

import com.projection.domain.Order;
import com.projection.service.Base.BaseService;

public class OrderService extends BaseService {
	public List<Order> getOrderByUser(Integer id) {
		return orderDao.getOrderByUser(id);
	}
	
	public List<Order> getAll() {
		return orderDao.getAll();
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
		orderDao.delete(order);
	}

}
