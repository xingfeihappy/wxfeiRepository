package com.projection.action.admin;

import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.util.Constant;
import com.projection.util.StringUtil;

public class DishesAction extends BaseAction{
	private Dishes dishes;
	private List<Dishes> dishesList;
	public String execute(){
		try{
			String logContent = "查询全部菜品信息";
			dishesList = dishesService.getAll();
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
	
	public String AddDishes(){
		try{
			String logContent = "更新菜品信息";
			if(dishes == null){
				throw new NullPointerException("参数为空");
			}
			if(dishes.getId() != null){
				Dishes oldDishes = dishesService.get(dishes.getId());
				oldDishes.setDescription(StringUtil.trim(dishes.getDescription()));
				oldDishes.setName(StringUtil.trim(dishes.getName()));
				oldDishes.setPrice(dishes.getPrice());
				oldDishes.setType(StringUtil.trim(dishes.getType()));
				oldDishes.setDescription(StringUtil.trim(dishes.getDescription()));
				dishes = oldDishes;
			}
			dishes.setDescription(StringUtil.trim(dishes.getDescription()));
			dishes.setName(StringUtil.trim(dishes.getName()));
			dishes.setPrice(dishes.getPrice());
			dishes.setType(StringUtil.trim(dishes.getType()));
			dishes.setDescription(StringUtil.trim(dishes.getDescription()));
			if(dishes.getId() == null){
				dishes.setId(dishesService.save(dishes));
			}else{
				dishesService.update(dishes);
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
	
	public String GetADishes(){
		try{
			String logContent = "查询菜品信息";
			dishes = dishesService.get(dishes.getId());
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

	public String DeleteDishes(){
		try{
			String logContent = "删除菜品信息";
			/*logService.save(new Log(new User(
					(Integer) getValueFromSession(Constant.USER_ID)),
					logContent, new Date(),
					Constant.USER_LOG, Constant.DELETE_OPERATION, this
							.getClass().getName()));*/
			
			if(dishes == null){
				throw new Exception("参数为空");
			}
			dishes = dishesService.get(dishes.getId());
			if(dishes == null){
            	throw new Exception("查询结果为空");
            }
			dishesService.deleteDishes(dishes);
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
	public Dishes getDishes() {
		return dishes;
	}

	public void setDishes(Dishes dishes) {
		this.dishes = dishes;
	}

	public List<Dishes> getDishesList() {
		return dishesList;
	}

	public void setDishesList(List<Dishes> dishesList) {
		this.dishesList = dishesList;
	}
}
