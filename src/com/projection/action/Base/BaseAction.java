package com.projection.action.Base;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.projection.service.DishesService;
import com.projection.service.LogService;
import com.projection.service.MessageService;
import com.projection.service.OrderDetailService;
import com.projection.service.OrderService;
import com.projection.service.SeatService;
import com.projection.service.UserService;


public class BaseAction extends ActionSupport {
	protected ActionContext ctx = ActionContext.getContext();
	protected OrderService orderService;
	protected OrderDetailService orderdetailService;
	protected SeatService seatService;
	protected UserService userService;
	protected DishesService dishesService;
	protected MessageService messageService;
	protected LogService logService;
	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	

	public OrderDetailService getOrderdetailService() {
		return orderdetailService;
	}

	public void setOrderdetailService(OrderDetailService orderdetailService) {
		this.orderdetailService = orderdetailService;
	}

	public SeatService getSeatService() {
		return seatService;
	}

	public void setSeatService(SeatService seatService) {
		this.seatService = seatService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public DishesService getDishesService() {
		return dishesService;
	}

	public void setDishesService(DishesService dishesService) {
		this.dishesService = dishesService;
	}

	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public LogService getLogService() {
		return logService;
	}

	public void setLogService(LogService logService) {
		this.logService = logService;
	}

	public ActionContext getCtx() {
		return ctx;
	}

	public void setCtx(ActionContext ctx) {
		this.ctx = ctx;
	}

	protected String getIpAddr() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	protected Object getValueFromSession(String key) {
		return ctx.getSession().get(key);
	}
}
