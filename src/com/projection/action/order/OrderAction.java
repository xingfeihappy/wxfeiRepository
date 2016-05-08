package com.projection.action.order;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.domain.Order;
import com.projection.domain.User;
import com.projection.util.Constant;

public class OrderAction extends BaseAction {
	private Double total;
	private List<Order> orders;
	private Order order;
	
	public String myOrders() {
		User user = (User) getValueFromSession(Constant.LOGIN_USER);
		orders = orderService.getOrderByUser(user.getId());
		return SUCCESS;
	}
	
	public String placeOrder() {
		Order order = new Order();
		@SuppressWarnings("unchecked")
		Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().remove(Constant.CAR);
		User user = (User) getValueFromSession(Constant.LOGIN_USER);
		order.setDishesMap(dishesMap);
		order.setTotalMoney(total);
		order.setUser(user);
		order.setDinnerTime(new Date());
		order.setState(0); //已下单
		
		
		Integer id = orderService.save(order);
		order.setId(id);
		order.setCodes("2016"+String.format("%04d", id));
		orderService.update(order);
		return SUCCESS;
	}

	public String deleteOrder() {
		order = orderService.get(order.getId());
		order.setValid(0);
		orderService.update(order);
		return SUCCESS;
	}
	
	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}
