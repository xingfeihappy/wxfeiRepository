package com.projection.action.admin;

import java.util.Date;
import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Log;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.ExceptionUtil;
import com.projection.util.MD5Util;
import com.projection.util.StringUtil;

public class OperateUserAction extends BaseAction {
	private static final long serialVersionUID = 5500096170122382031L;
	private String logContent;
	private List<User> userList;
	private User user;

	public String execute() {
		try {
			logContent = "管理员查询全部用户信息";
			userList = userService.getAll();
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String AddUser() {
		try {
			logContent = "更新用户信息";
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER), logContent, new Date(),
			 Constant.USER_LOG, Constant.UPDATE_OPERATION, this
			 .getClass().getName()));
			 
			if (user == null) {
				throw new NullPointerException("参数为空");
			}

			
			//user.id exist, update user information
			if(user.getId() != null){
				User oldUser = userService.get(user.getId());
				oldUser.setUsername(StringUtil.trim(user.getUsername()));
				oldUser.setName(StringUtil.trim(user.getName()));
				oldUser.setBirthday(user.getBirthday());
				oldUser.setEmail(StringUtil.trim(user.getEmail()));
				oldUser.setSex(StringUtil.trim(user.getSex()));
				oldUser.setAddress(StringUtil.trim(user.getAddress()));
				oldUser.setTelephone(StringUtil.trim(user.getTelephone()));
				oldUser.setUserType(StringUtil.trim(user.getUserType()));
				user = oldUser;
				//update user
				userService.update(user);
			//otherwise add new user
			}else{
				System.out.println(user);
				user.setUsername(StringUtil.trim(user.getUsername()));
				user.setName(StringUtil.trim(user.getName()));
				if(user == null || user.getPassword().equals("") || user.getPassword() == null){
					user.setPassword(MD5Util.MD5(Constant.DEFAULT_PASSWORD));
				}else{
					user.setPassword(MD5Util.MD5(StringUtil.trim(user.getPassword())));
				}
				user.setBirthday(user.getBirthday());
				user.setEmail(StringUtil.trim(user.getEmail()));
				user.setSex(StringUtil.trim(user.getSex()));
				user.setAddress(StringUtil.trim(user.getAddress()));
				user.setTelephone(StringUtil.trim(user.getTelephone()));
				
				if(user.getUserType() == null || user.getUserType() == ""){
					user.setUserType("0");
				}else{
					user.setUserType(StringUtil.trim(user.getUserType()));
				}
				//add user and get userId
				user.setId(userService.save(user));
				
			}
			return SUCCESS;
		} catch (Exception e) {
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER),
			 ExceptionUtil.getExceptionAllinformation(e), new Date(),
			 Constant.EXCEPTION_LOG, Constant.UPDATE_OPERATION, this
			 .getClass().getName()));
			 
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String GetAUser() {
		try {
			logContent = "查看用户信息";
			if (user == null) {
				throw new Exception("参数为空");
			}
			user = userService.get(user.getId());
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public String DeleteUser() {
		try {
			 logContent = "删除用户信息";
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER), logContent, new Date(),
			 Constant.USER_LOG, Constant.DELETE_OPERATION, this
			 .getClass().getName()));
			 

			if (user == null) {
				throw new Exception("参数为空");
			}
			user = userService.get(user.getId());
			if (user == null) {
				throw new Exception("查询结果为空");
			}
			userService.delete(user);
			return SUCCESS;
		} catch (Exception e) {
			
			 logService.save(new Log((User) getValueFromSession(Constant.LOGIN_USER),
			 ExceptionUtil.getExceptionAllinformation(e), new Date(),
			 Constant.EXCEPTION_LOG, Constant.DELETE_OPERATION, this
			 .getClass().getName()));
			e.printStackTrace();
			return Constant.ERROR;
		}
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
