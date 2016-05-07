package com.projection.service.Base;

import com.projection.dao.DishesDao;
import com.projection.dao.DishesTypeDao;
import com.projection.dao.LogDao;
import com.projection.dao.MessageDao;
import com.projection.dao.OrderDao;
import com.projection.dao.SeatDao;
import com.projection.dao.UserDao;

public class BaseService {
	protected UserDao userDao;
	protected DishesDao dishesDao;
	protected DishesTypeDao dishesTypeDao;
	protected MessageDao messageDao;
	protected OrderDao orderDao;
	protected SeatDao seatDao;
	protected LogDao logDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public DishesDao getDishesDao() {
		return dishesDao;
	}

	public void setDishesDao(DishesDao dishesDao) {
		this.dishesDao = dishesDao;
	}

	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public SeatDao getSeatDao() {
		return seatDao;
	}

	public void setSeatDao(SeatDao seatDao) {
		this.seatDao = seatDao;
	}

	public LogDao getLogDao() {
		return logDao;
	}

	public void setLogDao(LogDao logDao) {
		this.logDao = logDao;
	}

	public DishesTypeDao getDishesTypeDao() {
		return dishesTypeDao;
	}

	public void setDishesTypeDao(DishesTypeDao dishesTypeDao) {
		this.dishesTypeDao = dishesTypeDao;
	}
}
