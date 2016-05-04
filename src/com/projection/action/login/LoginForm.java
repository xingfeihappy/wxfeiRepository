package com.projection.action.login;

import com.projection.action.Base.BaseAction;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.MD5Util;
import com.projection.util.StringUtil;

public class LoginForm extends BaseAction{
	private String username;
	private String password;
	private String userType;
	public String execute(){
		try{
			username = StringUtil.trim(username);
			password = StringUtil.trim(password);
			userType = StringUtil.trim(userType);
			System.out.println(username);
			User user = userService.getUserByUsername(username);
			System.out.println(user.getUsername());
			if(user != null && user.getPassword().equals(MD5Util.MD5(password)) && user.getUserType().contains(userType)){
				ctx.getSession().put(Constant.USER_TYPE, userType);
				ctx.getSession().put(Constant.USER_ID, user.getId());
				ctx.getSession().put(Constant.USER_NAME, user.getUsername());
			}
			System.out.println("userType"+user.getUserType());
			if(user.getUserType().equals("0")){
				System.out.println(0);
				return "user";
			}else{
				System.out.println(1);
				return "admin";
			}
		}catch(Exception e){
			e.printStackTrace();
			return Constant.LOGIN_PAGE;
		}
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}

	
}
