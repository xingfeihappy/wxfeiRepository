package com.projection.action.user;

import java.util.Date;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Log;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.ExceptionUtil;

@SuppressWarnings("serial")
public class GetUserByIdAction extends BaseAction{
	private User user;
	private String userType;
	public String execute(){
		try{
			if(user == null){
				user = userService.get((Integer) getValueFromSession(Constant.USER_ID));
			}
			else{
				user = userService.get(user.getId());
			}
			
			if(userType != null){
				ctx.getSession().put(Constant.USER_TYPE, userType);
			}
			return SUCCESS;
		}catch(Exception e){
			logService.save(new Log(new User(
				(Integer) getValueFromSession(Constant.USER_ID)),
				ExceptionUtil.getExceptionAllinformation(e), new Date(),
				Constant.EXCEPTION_LOG, Constant.SEE_OPERATION, this
						.getClass().getName()));
		e.printStackTrace();
		return Constant.ERROR;
	}
  }
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
}
