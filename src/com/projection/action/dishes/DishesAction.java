package com.projection.action.dishes;

import java.util.List;
import java.util.Map;

import com.projection.action.Base.BaseAction;
import com.projection.domain.Dishes;
import com.projection.util.Constant;

public class DishesAction extends BaseAction {
	private List<Dishes> dishesList;
	private Integer type;
	private Integer totalAmount;

	public String execute() {
		if (type != null) {
			ctx.getSession().put(Constant.FILTER_TYPE, type);
			if (type == -1) {
				dishesList = dishesService.getAll();
			} else {
				dishesList = dishesService.getByType(type);
			}
		} else {
			Integer t = (Integer) ctx.getSession().get(Constant.FILTER_TYPE);
			if (t != null && t != -1) {
				dishesList = dishesService.getByType(t);
			} else {
				dishesList = dishesService.getAll();
			}
		}
		@SuppressWarnings("unchecked")
		Map<Dishes, Integer> dishesMap = (Map<Dishes, Integer>) ctx.getSession().get(Constant.CAR);
		totalAmount = 0;
		if (dishesMap != null) {
			for (Integer i : dishesMap.values()) {
				totalAmount += i;
			}
		}
		return SUCCESS;
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

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
}
