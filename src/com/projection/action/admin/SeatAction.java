package com.projection.action.admin;

import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Seat;
import com.projection.util.Constant;

public class SeatAction extends BaseAction{
	public Seat seat;
	public List<Seat> getSeatList() {
		return seatList;
	}
	public void setSeatList(List<Seat> seatList) {
		this.seatList = seatList;
	}
	private List<Seat> seatList;
	public String execute(){
		try{
			String logContent = "管理员查询全部餐位信息";
			seatList = seatService.getAll();
			
			return SUCCESS;
		}catch(Exception e){
			/*logService.save(new Log(new User(
					(Integer) getValueFromSession(Constant.USER_ID)),
					ExceptionUtil.getExceptionAllinformation(e), new Date(),
					Constant.EXCEPTION_LOG, Constant.SEE_OPERATION, this
							.getClass().getName()));*/
			e.printStackTrace();
			return Constant.ERROR;
		}
	}
	
	public String AddSeat() {
		if(seat.getId() != null){
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
			/*
			 * logService.save(new Log(new User( (Integer)
			 * getValueFromSession(Constant.USER_ID)), logContent, new Date(),
			 * Constant.USER_LOG, Constant.DELETE_OPERATION, this
			 * .getClass().getName()));
			 */

			if (seat == null) {
				throw new Exception("参数为空");
			}
			seat = seatService.get(seat.getId());
			if (seat == null) {
				throw new Exception("查询结果为空");
			}
			seatService.delete(seat);
			return SUCCESS;
		} catch (Exception e) {
			/*
			 * logService.save(new Log(new User( (Integer)
			 * getValueFromSession(Constant.USER_ID)),
			 * ExceptionUtil.getExceptionAllinformation(e), new Date(),
			 * Constant.EXCEPTION_LOG, Constant.SEE_OPERATION, this
			 * .getClass().getName()));
			 */
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
}
