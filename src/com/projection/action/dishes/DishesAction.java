package com.projection.action.dishes;

import java.util.List;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;

public class DishesAction extends BaseAction {
	private List<Dishes> dishesList;
	private Integer type;
	
	public String execute() {
		if(type == null){
			dishesList = dishesService.getAll();	
		}else{
			dishesList = dishesService.getByType(type);
		}
		return SUCCESS;
	}
	public String filterDish() {
		return null;
	}
	public List<Dishes> getDishesList() {
		return dishesList;
	}
	public void setDishesList(List<Dishes> dishesList) {
		this.dishesList = dishesList;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
}
