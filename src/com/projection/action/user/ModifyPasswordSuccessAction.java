package com.projection.action.user;

import java.util.Date;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Log;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.ExceptionUtil;
import com.projection.util.MD5Util;

@SuppressWarnings("serial")
public class ModifyPasswordSuccessAction extends BaseAction {
	private User user;// 前台传过来的用户
	private User olduser;// 数据库用户
	private String newPassword;
	public String execute() {
		try {
			String logContent = "用户修改密码";
			
			
		    olduser = userService.get((Integer) getValueFromSession(Constant.USER_ID));
		    
			//if (olduser.getPasswords().equals(MD5Util.MD5(user.getPasswords()))) {

				olduser.setPassword(MD5Util.MD5(newPassword));
				userService.update(olduser);
				user = userService.get(olduser.getId());
				return "rightPassword";
				/*} else {
				user = userService.get(olduser.getId());
				return "errorPassword";
			}*/

		} catch (Exception e) {
			logService.save(new Log(new User(
					(Integer) getValueFromSession(Constant.USER_ID)),
					ExceptionUtil.getExceptionAllinformation(e), new Date(),
					Constant.EXCEPTION_LOG, Constant.UPDATE_OPERATION, this
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

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public User getOlduser() {
		return olduser;
	}

	public void setOlduser(User olduser) {
		this.olduser = olduser;
	}
	
}
