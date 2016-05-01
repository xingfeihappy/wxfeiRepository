package com.projection.action.admin;

import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Seat;
import com.projection.util.Constant;

public class SeatAction extends BaseAction{
	private Seat seat;
	private List<Seat> seatList;
	public String execute(){
		try{
			String logContent = "管理员查询全部用户信息";
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

}
