package com.projection.action.message;

import java.util.Set;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.domain.Message;
import com.projection.domain.Order;
import com.projection.domain.User;
import com.projection.util.Constant;

public class MessageAction extends BaseAction {
	private Order order;
	private Message message;
	private Set<Dishes> dishesSet;
	private Integer[] recommendation;
	
	public String appraise(){
		User user = (User) getValueFromSession(Constant.LOGIN_USER);
		order = orderService.get(order.getId());
		
		message.setUser(user);
		message.setOrder(order);
		StringBuilder sb = new StringBuilder();
		sb.append("");
		for(Integer i : recommendation){
			sb.append(i);
			sb.append(',');
		}
		message.setRecommendation(sb.toString());
		messageService.save(message);
		
		order.setState(2);
		orderService.update(order);
		return SUCCESS;
	}

	public String goToAppraise(){
		order = orderService.get(order.getId());
		dishesSet = order.getDishesMap().keySet();
		
		return SUCCESS;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Set<Dishes> getDishesSet() {
		return dishesSet;
	}

	public void setDishesSet(Set<Dishes> dishesSet) {
		this.dishesSet = dishesSet;
	}

	public Integer[] getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(Integer[] recommendation) {
		this.recommendation = recommendation;
	}
}
