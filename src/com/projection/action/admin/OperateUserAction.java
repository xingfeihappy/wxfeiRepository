package com.projection.action.admin;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.projection.action.Base.BaseAction;
import com.projection.dao.DishesDao;
import com.projection.dao.OrderDao;
import com.projection.domain.Dishes;
import com.projection.domain.Log;
import com.projection.domain.Order;
import com.projection.domain.User;
import com.projection.util.Constant;
import com.projection.util.ExceptionUtil;
import com.projection.util.MD5Util;
import com.projection.util.StringUtil;

public class OperateUserAction extends BaseAction{
	private List<User> userList;
	private User user;
	public String execute(){
		
		
		
		Order o = new Order();
		o.setCodes("aabbcc");
		o.setDinnerTime(new Date());
		o.setFoodNum(5);
		Dishes di = new Dishes();
		di.setName("hongshaorou");
		dishesService.save(di);
		
		
		Set<Dishes> s = new HashSet<Dishes>();
		s.add(di);
		o.setDishesSet(s);
		orderService.save(o);
		
		
		
		
		
		
		try{
			String logContent = "管理员查询全部用户信息";
			userList = userService.getAll();
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
	
	public String AddUser(){
		try{
			String logContent = "更新用户信息";
			/*logService.save(new Log(new User(
					(Integer) getValueFromSession(Constant.USER_ID)),
					logContent, new Date(),
					Constant.EXCEPTION_LOG, Constant.SEE_OPERATION, this
							.getClass().getName()));*/
			if(user == null){
				throw new NullPointerException("参数为空");
			}
			if(user.getId() != null){
				User oldUser = userService.get(user.getId());
				oldUser.setUsername(StringUtil.trim(user.getUsername()));
				oldUser.setName(StringUtil.trim(user.getName()));
				oldUser.setPassword(MD5Util.MD5(Constant.DEFAULT_PASSWORD));
				oldUser.setBirthday(user.getBirthday());
				oldUser.setEmail(StringUtil.trim(user.getEmail()));
				oldUser.setSex(StringUtil.trim(user.getSex()));
				oldUser.setAddress(StringUtil.trim(user.getAddress()));
				oldUser.setTelephone(StringUtil.trim(user.getTelephone()));
				oldUser.setUserType(StringUtil.trim(user.getUserType()));
				user = oldUser;
			}
			
			user.setUsername(StringUtil.trim(user.getUsername()));
			user.setName(StringUtil.trim(user.getName()));
			user.setPassword(MD5Util.MD5(Constant.DEFAULT_PASSWORD));
			user.setBirthday(user.getBirthday());
			user.setEmail(StringUtil.trim(user.getEmail()));
			user.setSex(StringUtil.trim(user.getSex()));
			user.setAddress(StringUtil.trim(user.getAddress()));
			user.setTelephone(StringUtil.trim(user.getTelephone()));
			user.setUserType(StringUtil.trim(user.getUserType()));
			if(user.getId() == null){
				user.setId(userService.save(user));
			}else{
				userService.update(user);
			}
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
	public String GetAUser(){
		try{
			String logContent = "更新用户信息";
			if(user == null){
				throw new Exception("参数为空");
			}
			user = userService.get(user.getId());
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
	
	public String DeleteUser(){
		try{
			String logContent = "删除用户信息";
			/*logService.save(new Log(new User(
					(Integer) getValueFromSession(Constant.USER_ID)),
					logContent, new Date(),
					Constant.USER_LOG, Constant.DELETE_OPERATION, this
							.getClass().getName()));*/
			
			if(user == null){
				throw new Exception("参数为空");
			}
			user = userService.get(user.getId());
			if(user == null){
            	throw new Exception("查询结果为空");
            }
			userService.deleteUser(user);
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
