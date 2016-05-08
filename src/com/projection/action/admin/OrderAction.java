package com.projection.action.admin;

import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Order;
import com.projection.util.Constant;

public class OrderAction extends BaseAction{
	private Order order;
	private List<Order> orderList;
	public String execute(){//delete
		try{
			orderList = orderService.getAll();
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	
	public String FinishOrder() {
		order = orderService.get(order.getId());
		//设置订单状态为已完成
		order.setState(1);
		//设置该订单所占用的桌子为可用
		//order.getSeat().setState(1);
		orderService.update(order);
		return SUCCESS;
	}
	
	public String DeleteOrder(){
		try{
			if(order == null){
				throw new Exception("参数为空");
			}
			order = orderService.get(order.getId());
			if(order == null){
				throw new Exception("查询为空");
			}
			orderService.delete(order);
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	public String GetAOrder(){
		try{
			if(order == null){
				throw new Exception("参数为空");
			}
			order = orderService.get(order.getId());
			if(order == null){
				throw new Exception("查询为空");
			}
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
}
