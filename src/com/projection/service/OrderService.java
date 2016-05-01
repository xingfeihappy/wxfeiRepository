package com.projection.service;

import com.projection.domain.Order;
import com.projection.service.Base.BaseService;

public class OrderService extends BaseService{
	public void save(Order order){
		orderDao.save(order);
	}

}
