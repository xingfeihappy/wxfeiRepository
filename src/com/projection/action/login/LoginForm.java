package com.projection.action.login;

import com.projection.action.Base.BaseAction;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.MD5Util;
import com.projection.util.StringUtil;

public class LoginForm extends BaseAction {
	private User user;

	public String execute() {
		try {
			user.setUsername(StringUtil.trim(user.getUsername()));
			user.setPassword(StringUtil.trim(user.getPassword()));
			user = userService.loginCheck(user.getUsername(), user.getPassword());
			if (user == null || user.getValid() == 0) {
				return Constant.LOGIN_PAGE;
			}
			ctx.getSession().put(Constant.LOGIN_USER, user);
			
			//put all dishesTypes into session
			ctx.getSession().put(Constant.DISHES_TYPES, dishesService.getAllTypes());
			if ("0".equals(user.getUserType())) {
				return "user";
			} else {
				return "admin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.LOGIN_PAGE;
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
