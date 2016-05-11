package com.projection.action.admin;

import java.util.Date;
import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Log;
import com.projection.domain.Order;
import com.projection.domain.Seat;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.ExceptionUtil;

public class SeatAction extends BaseAction{
	public Seat seat;
	private Order order;
	public List<Seat> getSeatList() {
		return seatList;
	}
	public void setSeatList(List<Seat> seatList) {
		this.seatList = seatList;
	}
	private List<Seat> seatList;
	public String execute(){
		try{
			seatList = seatService.getAll();
			if(order != null){
				order = orderService.get(order.getId());
			}
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	
	public String AddSeat() {
		if(seat.getId() != null){
			 String logContent = "删除用户信息";
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER), logContent, new Date(),
			 Constant.USER_LOG, Constant.DELETE_OPERATION, this
			 .getClass().getName()));
			Seat oldSeat = seatService.get(seat.getId());
			oldSeat.setContainPeople(seat.getContainPeople());
			seat = oldSeat;
			seatService.update(seat);
		}else{
			seatService.save(seat);
		}
		return SUCCESS;
	}
	
	public String GetASeat(){
		try{
			if (seat == null) {
				throw new Exception("参数为空");
			}
			seat = seatService.get(seat.getId());
			if (seat == null) {
				throw new Exception("查询结果为空");
			}
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	
	public String DeleteSeat() {
		try {
			String logContent = "删除餐位信息";
			
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER), logContent, new Date(),
			 Constant.USER_LOG, Constant.DELETE_OPERATION, this
			 .getClass().getName()));

			if (seat == null) {
				throw new Exception("参数为空");
			}
			seat = seatService.get(seat.getId());
			if (seat == null) {
				throw new Exception("查询结果为空");
			}
			seat.setValid(0);
			seatService.update(seat);
			return SUCCESS;
		} catch (Exception e) {
			 logService.save(new Log( (User) getValueFromSession(Constant.LOGIN_USER),
			 ExceptionUtil.getExceptionAllinformation(e), new Date(),
			 Constant.EXCEPTION_LOG, Constant.DELETE_OPERATION, this
			 .getClass().getName()));
			 
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	public Seat getSeat() {
		return seat;
	}
	public void setSeat(Seat seat) {
		this.seat = seat;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
}
