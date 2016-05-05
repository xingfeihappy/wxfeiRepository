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
	private String newPassword;

	public String execute() {
		try {
			String logContent = "用户修改密码";

			User user = (User) getValueFromSession(Constant.LOGIN_USER);
			user.setPassword(MD5Util.MD5(newPassword));
			userService.update(user);
			ctx.getSession().put(Constant.LOGIN_USER, user);
			return "rightPassword";

		} catch (Exception e) {
			logService.save(new Log(new User((Integer) getValueFromSession(Constant.USER_ID)),
					ExceptionUtil.getExceptionAllinformation(e), new Date(), Constant.EXCEPTION_LOG,
					Constant.UPDATE_OPERATION, this.getClass().getName()));
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
}
